import subprocess
import os

def run_cmd(cmd):
    result = subprocess.run(cmd.split(' '), stdout=subprocess.PIPE).stdout.decode('utf_8')
    my_print(text=result)
    return result

def log(file='./output.log', text=None):
    with open(file, 'a') as writer:
        if str(text).encode('utf_8')[len(str(text).encode('utf_8')) - 1] != 10:
            text = f'{text}\n'
        writer.write(text)

def my_print(text):
    log(text=text)
    print(text)

def run_command(command=None):
    my_print(command)
    return run_cmd(command)


my_print('Checking System')
os.environ['DEBIAN_FRONTEND'] = "noninteractive"
os.environ['DEBIAN_PRIORITY'] = "critical"
run_command('apt -qy update')
run_command('apt -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade')
packages = run_command('apt list --installed').split('\n')
for package in packages:
    run_command(f'apt-show-versions {package.split("/")[0]}')
my_print('Check finished')