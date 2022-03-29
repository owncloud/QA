#! /usr/bin/python3
#
# - load the .drone.star from a github tag
# - prepare owncloudci/php:7.4 ...

import os, sys, time
import importlib, tempfile, subprocess

orga = 'owncloud'
tests_key = 'acceptance'
core_tag = 'v10.7.0'
owncloudci_php = 'owncloudci/php:7.4'

if len(sys.argv) < 2:
  print("""Usage:

        %s APPNAME APPVERSION
 
Report how to run the acceptance tests the same way that drone would do.
Environmennt variables:
  OWNCLOUD_CORE_TAG    defaults to '%s'
  GITHUB_ORGA          defaults to '%s'
  GITHUB_REPO          defaults to the APPNAME
  DRONE_STAR_TESTS_KEY defaults to '%s'
  DOCKER_OWNCLOUD_CI   defaults to '%s'
""" % (sys.argv[0]), core_tag, orga, tests_key, owncloudci_php)
  sys.exit(1)


appname = sys.argv[1]
appvers = sys.argv[2]
repo = appname
if 'GITHUB_ORGA' in os.environ: orga = os.getenv('GITHUB_ORGA')
if 'GITHUB_REPO' in os.environ: repo = os.getenv('GITHUB_REPO')
if 'OWNCLOUD_CORE_TAG' in os.environ: core_tag = os.getenv('OWNCLOUD_CORE_TAG')
if 'DRONE_STAR_TESTS_KEY' in os.environ: tests_key = os.getenv('DRONE_STAR_TESTS_KEY')
if 'DOCKER_OWNCLOUD_CI' in os.environ: owncloudci_php = os.getenv('DOCKER_OWNCLOUD_CI')


def import_path(path):
    """
        Load python code from a file that has no .py suffix. Quite tricky.
        FROM https://stackoverflow.com/questions/2601047/import-a-python-module-without-the-py-extension#2601083
    """
    module_name = os.path.basename(path).replace('-', '_')
    spec = importlib.util.spec_from_loader(
        module_name,
        importlib.machinery.SourceFileLoader(module_name, path)
    )
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    sys.modules[module_name] = module
    return module


def github_clone(orga, repo, branch='master', dest='.'):
  print(" - github_clone: %s/%s branch=%s, depth=1" % (orga, repo, branch))
  git_clone("git@github.com:%s/%s.git" % (orga, repo), branch=branch, dest=dest)

def git_clone(url, branch='master', dest='.'):
  subprocess.check_call(['git', 'clone', '--branch', branch, '--depth', '1', '--config', 'advice.detachedHead=false', url, dest])


t_name = tempfile.mkdtemp(suffix='_'+repo+'-'+appvers)
apps_external = t_name+'/apps-external/'

github_clone(orga, 'core',    branch=core_tag, dest=t_name)
github_clone(orga, 'testing', branch='master', dest=apps_external+'testing')
github_clone(orga, repo,      branch=appvers,  dest=apps_external+appname)
open(t_name+"/occ.sh", "w").write('su www-data -s /bin/sh -c "/var/www/owncloud/server/occ $*"')

# do this before chown www-data :-)
ds = import_path("%s/.drone.star" % (apps_external+appname))
if not tests_key in ds.config:
  print("ERROR: .drone.start config has no '%s' key. Found: %s" % (tests_key, str(ds.config.keys())))
  sys.exit(2)
tests = ds.config[tests_key]

docker_cmdv = ['docker', 'run', '--rm', '-ti', '-v', '%s:/var/www/owncloud/server' % t_name, '-p', '8080:80', owncloudci_php, 'bash']
subprocess.check_call(docker_cmdv + ['-c', 'cd /var/www/owncloud/server; make'])
subprocess.check_call(docker_cmdv + ['-c', 'cd /var/www/owncloud/server/vendor-bin/behat; composer install'])
subprocess.check_call(docker_cmdv + ['-c', 'chown -R www-data. /var/www/owncloud'])
subprocess.check_call(docker_cmdv + ['-c', 'chmod a+x /var/www/owncloud/server/occ.sh'])
subprocess.check_call(docker_cmdv + ['-c', '/var/www/owncloud/server/occ.sh maintenance:install --admin-pass=admin'])
subprocess.check_call(docker_cmdv + ['-c', '/var/www/owncloud/server/occ.sh app:enable testing'])
subprocess.check_call(docker_cmdv + ['-c', '/var/www/owncloud/server/occ.sh app:enable %s' % appname])
## FIXME: add more initializations here...

setup_seen='---'
for (k, v) in tests.items():
  print("%s:\n\tsuites: %s" % (k, ' '.join(v['suites'])))
  if 'extraSetup' in v and 'commands' in v['extraSetup'][0]:
    setup_j = "\n".join(v['extraSetup'][0]['commands'])
    if setup_j == setup_seen:
      print("\textraSetup: - dito -")
    else:
      setup_seen=setup_j
      print("\textraSetup:")
      for c in v['extraSetup'][0]['commands']:
        print("\t\t"+c)

print("\nEntering docker container shell ...")
print(" - Try: 'apachectl start' and inspect http://localhost:8080/server")
print(" - Try some of the commands from the .drone.star as e.g. extracted above.")
print(" - Try: cd %s%s; make test-acceptance-cli" % (apps_external, appname))
print(" - Try: cd %s%s; make test-acceptance-api" % (apps_external, appname))
print(" - When done, you can remove the git checkout tree with: sudo rm -rf %s" % t_name)
print(' + ' + ' '.join(docker_cmdv))
subprocess.call(docker_cmdv)

print(" - When done, you can remove the git checkout tree with: sudo rm -rf %s" % t_name)
