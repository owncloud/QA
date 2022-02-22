#! /usr/bin/python3
#
#   Example:
#     randfiles.py -m 100_000 randfiles_100k
#   or study the printed usage.
#
# Run on a filesystem with more inodes than default:
#  mke2fs -t ext4 -n /dev/sdb1
#   -> prints the default inode count. Run with 5 times as many.
#  mke2fs -t ext4 -N 80000000 /dev/sdb1
#
# Run on a filesystem where we have large directory support. If you see
#   [ 1738.125535] EXT4-fs warning (device sda2): ext4_dx_add_entry:2184: Directory (ino: 2) index full, reach max htree level :2
#   [ 1738.125537] EXT4-fs warning (device sda2): ext4_dx_add_entry:2188: Large directory feature is not enabled on this filesystem
#  sudo tune2fs -l /dev/sda2  | grep -i feature
#   Filesystem features:  has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
#  We can add large_dir (in addition to dir_index) option like this:
#   sudo tune2fs -O large_dir /dev/sda2
#
# CAUTION: Windows has short 260 char limits, even when using NTFS.
#  * In the latest versions of Windows, this limitation can be expanded to
#    approximately 32,000 characters. Your administrator will need to activate
#    the "Enable Win32 long paths" group policy, or set the registry value
#    HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem@LongPathsEnabled to 1.
#  * https://docs.microsoft.com/en-us/windows/win32/fileio/naming-a-file#maximum-path-length-limitation
#  * https://docs.python.org/3/using/windows.html
#
# TODO: On Linux, even deeper paths may be possible when using chdir() into each subdirectory.

# v0.1 -- 2019-09-03, jw        initial draught
# v0.2 -- 2019-09-05, jw        adaptive min_entries_per_dir and folder_ratio for very tall trees.
# v0.3 -- 2019-09-09, jw        target dir mandatory, option parser added.
# v0.4 -- 2019-09-11, jw        lower default folder ratio from 2.0% to 0.5%, fixed the logic for low -e values.
# v0.5 -- 2019-09-12, jw        new -t option to test max tree dimensions.
# v0.6 -- 2019-11-20, jw        count folders against -m too, so that we can properly build structures with mostly folders.
# v0.7 -- 2021-04-21, jw        added -s suffix option.


import random, time, string, os, sys, json
import argparse, shutil

__version__ = '0.7'

conf = {
  'maxfiles': 1_000_000,
  'seed': str(time.time()),
  'min_entries_per_dir': 500,
  'max_entries_per_dir': 10_000,
  'min_name_len': 10,
  'max_name_len': 50,
  'min_body_len': 1,
  'max_body_len': 1_000,
  'folder_ratio': 0.5,                # 2.0/100=0.02: 98% of all objects, are files; 2% are folders.
  'corpus_size': 2_000_000,
}

conf_run = {
  'argv0': os.path.abspath(sys.argv[0]),
  '__version__': __version__,
  'when': time.ctime(),
}

parser = argparse.ArgumentParser(description='Create deep or shallow trees of random files.')
parser.add_argument('dir', metavar='DIR', type=str, help='destination folder')
parser.add_argument('-m', '--maxfiles', metavar='MAXFILES', type=int, help='Number of files and folders to generate. Default: ' + str(conf['maxfiles']))
parser.add_argument('-S', '--seed', metavar='SEED_STRING', type=str, help='String to seed the random generator. Call with identical seed to recreate an identical tree. Default: current timestamp in msec')
parser.add_argument('-f', '--folder_ratio', metavar='FOLDER_PERCENTAGE', type=float, help='Probability to create a subfolder instead of a file, as percent. Default: ' + str(conf['folder_ratio']))
parser.add_argument('-e', '--max_entries_per_dir', metavar='MAX_ENTRIES_PER_DIR', type=int, help='Maximum number files/subdirs per directory. Default: ' + str(conf['max_entries_per_dir']))
parser.add_argument(      '--min_entries_per_dir', metavar='MIN_ENTRIES_PER_DIR', type=int, help='Minimum number files/subdirs per directory. Default: ' + str(conf['min_entries_per_dir']))
parser.add_argument('-n', '--max_name_len', metavar='MAX_NAME_LEN', type=int, help='Maximum length of file/subdir names. Default: ' + str(conf['max_name_len']))
parser.add_argument(      '--min_name_len', metavar='MIN_NAME_LEN', type=int, help='Minimum length of file/subdir names. Default: ' + str(conf['min_name_len']))
parser.add_argument('-b', '--max_body_len', metavar='MAX_BODY_LEN', type=int, help='Maximum length file contents. Default: ' + str(conf['max_body_len']))
parser.add_argument(      '--min_body_len', metavar='MIN_BODY_LEN', type=int, help='Minimum length file contents. Default: ' + str(conf['min_body_len']))
parser.add_argument('-c', '--corpus_size', metavar='CORPUS_SIZE', type=int, help='Size of the internal random pool. (Larger is more chaotic but slower). Default: ' + str(conf['corpus_size']))
parser.add_argument('-L', '--load_config', metavar='CONFIG_FILE', type=str, help='Load a config file from a previous run, before applying other options. Default: none.')
parser.add_argument('-t', '--testonly', action='store_true', help='Only test how deep or wide a tree could be. Default: create a tree.')
parser.add_argument('-s', '--suffix', metavar='SUFFIX', type=str, help='Common suffix for all file names generated. Default: none')
args = parser.parse_args()

if args.load_config:
  conf = json.load(open(args.load_config))
conf['run'] = conf_run

if args.maxfiles            is not None: conf['maxfiles']            = args.maxfiles
if args.seed                is not None: conf['seed']                = args.seed
if args.folder_ratio        is not None: conf['folder_ratio']        = args.folder_ratio
if args.max_entries_per_dir is not None: conf['max_entries_per_dir'] = args.max_entries_per_dir
if args.min_entries_per_dir is not None: conf['min_entries_per_dir'] = args.min_entries_per_dir
if args.max_name_len        is not None: conf['max_name_len']        = args.max_name_len
if args.min_name_len        is not None: conf['min_name_len']        = args.min_name_len
if args.max_body_len        is not None: conf['max_body_len']        = args.max_body_len
if args.min_body_len        is not None: conf['min_body_len']        = args.min_body_len
if args.corpus_size         is not None: conf['corpus_size']         = args.corpus_size
if args.suffix              is not None: conf['suffix']              = args.suffix

if conf['max_entries_per_dir'] < 5000:
  maxmin = int(conf['max_entries_per_dir'])
  if conf['min_entries_per_dir'] > maxmin:
    print("Reducing min_entries_per_dir from %d to %d due to low max_entries_per_dir." % (conf['min_entries_per_dir'], maxmin))
    conf['min_entries_per_dir'] = maxmin

if conf['max_entries_per_dir'] < 500:
  if conf['folder_ratio'] < 1.0:
    # try avoid running out of subdirs
    print("Increasing folder_ratio from %g to %g due to low max_entries_per_dir." % (conf['folder_ratio'], 1.0))
    conf['folder_ratio'] = 1.0
  if conf['max_name_len'] > 50:
    # try avoid crashing against MAXPATH trivially.
    print("Reducing max_name_len from %d to %d due to low max_entries_per_dir." % (conf['max_name_len'], 50))
    conf['max_name_len'] = 50

if conf['min_name_len'] > conf['max_name_len']:
  print("Reducing min_name_len from %d to %d due to low max_name_len." % ( conf['min_name_len'], max(1, int(conf['max_name_len']/10)) ))
  conf['min_name_len'] = max(1, int(conf['max_name_len']/10))

if conf['corpus_size'] < conf['max_name_len']:
  print("ERROR: corpus_size=%d must be at least max_name_len=%d." % (conf['corpus_size'], conf['max_name_len']))
  sys.exit(1)

if conf['corpus_size'] < conf['max_body_len']:
  print("ERROR: corpus_size=%d be at least max_body_len=%d." % (conf['corpus_size'], conf['max_body_len']))
  sys.exit(1)

conffile = os.path.basename(os.path.abspath(args.dir))+'.conf'

os.makedirs(args.dir, exist_ok=True)
os.chdir(args.dir)      # or explode.

if args.testonly:
  incr = 10
  testdepth = 10_000
  testwidth = 20_000
  testnamelen = 10_000
  testfolder = "_t"
  if sys.platform == 'win32':
    testdepth = 1_000           # Windows 10 on NTFS with LongPathsEnabled=1, 10_000 takes ages.
    testwidth = 2_000           # Windows 10 on NTFS is just dead slow.

  def myrmtree(path):
    sys.setrecursionlimit(testdepth+2)

    try:        # linux only: avoid soft limits.
      import resource
      a = resource.getrlimit(resource.RLIMIT_NOFILE)
      resource.setrlimit(resource.RLIMIT_NOFILE, (a[1], a[1]))
    except:
      pass

    try:
      shutil.rmtree(path)
    except OSError as e:
      print("myrmtree: had an OSError. errno=%d strerror=%s" % (e.errno, e.strerror))
      if e.errno == 24:         # Too many open files
        print("Try switching to superuser, run\n  ulimit -n %d\n\n... or higher, then retry." % (testdepth+2))
        sys.exit(1)
      else:
        raise(e)

  os.makedirs(testfolder, exist_ok=False)       # explode early, if another test is running here.
  for l in range(incr, testnamelen, incr):
    path = testfolder +"/" + "f" * l   # one file with long name
    try:
      fd = open(path, "w")
    except:
      print("open() with a long file name:          limit exceeded at namelen=%d (...+%d), pathlen=%d\n" % (l-incr+1, incr-1, len(path)))
      break
    else:
      fd.close()
      os.unlink(path)
  else:
    print("open() with a long file name:            (testnamelen=%d done; pathlen=%d)" % (testnamelen, len(path)))
  myrmtree(testfolder)

  for l in range(incr, testnamelen, incr):
    path = testfolder + "/" + "f" * l   # one folder with long name
    try:
      os.makedirs(path)
    except:
      print("makedirs() with one long folder name:  limit exceeded at namelen=%d (...+%d), pathlen=%d" % (l-incr+1, incr-1, len(path)))
      break
    else:
      os.rmdir(path)
  else:
    print(  "makedirs() with one long folder name:  (testnamelen=%d done; pathlen=%d)" % (testnamelen, len(path)))
  myrmtree(testfolder)

  for d in range(testdepth):
    fname = "123456789_123456789_123456789_123456789_123456789"
    path = testfolder + ("/" + fname) * d
    try:
      os.makedirs(path)
    except:
      print("makedirs() with long folder names:     limit exceeded at depth=%d, pathlen=%d (...+%d)" % (d-1, len(path)-len(fname), len(fname)))
      break
  else:
    print(  "makedirs() with long folder names:     (testdepth=%d done; pathlen=%d)" % (testdepth, len(path)))
  myrmtree(testfolder)

  for d in range(incr, testdepth, incr):
    path = testfolder + "/f" * d
    try:
      os.makedirs(path)
    except:
      print("makedirs() with short folder names:    limit exceeded at depth=%d (...+%d), pathlen=%d" % (d-incr+1, incr-1, len(path)))
      break
  else:
    print(  "makedirs() with short folder names:    (maxdepth=%d done; pathlen=%d)" % (testdepth, len(path)))
  myrmtree(testfolder)

  for d in range(testwidth):
    path = testfolder + ("/f_%08d" % d)
    try:
      os.makedirs(path)
    except:
      print("makedirs() with many sibling folders:  limit exceeded with number_of_siblings=%d" % (d))
      break
  else:
    print(  "makedirs() with many sibling folders:  (testwidth=%d done)" % (testwidth))
  myrmtree(testfolder)

  sys.exit(0)


random.seed(conf['seed'])
corpus = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(conf['corpus_size']))


def randstr(min_len=10, max_len=200):
  len = random.randint(min_len, max_len)
  len = min(len, conf['corpus_size'])
  start = random.randint(0, conf['corpus_size']-len)
  return corpus[start:start+len]


def randfile():
  name = randstr(conf['min_name_len'], conf['max_name_len'])
  body = randstr(conf['min_body_len'], conf['max_body_len'])
  if 'suffix' in conf: name = name + conf['suffix']
  return (name, body)


def randfolder():
  name = randstr(conf['min_name_len'], conf['max_name_len'])
  return name


dirs = [['.']]

total_files = 0
total_dirs = 0
emerg_dirs = 0
mkdir_err = 0
open_err = 0
max_depth = 0

done = 0
while not done:
  dirv = dirs.pop(0)
  dir = '/'.join(dirv)
  if len(dirv) > max_depth:
    max_depth = len(dirv)

  for i in range(random.randint(conf['min_entries_per_dir'], conf['max_entries_per_dir'])):
    if total_files + total_dirs >= conf['maxfiles']:
      done = 1
      break
    if random.random() > conf['folder_ratio'] * 0.01:   # percent
      f = randfile()
      try:
        fd = open(dir + '/' + f[0], 'w')
        fd.write(f[1])
        fd.close()
        total_files += 1
      except:
        pass
    else:
      f = randfolder()
      try:
        os.mkdir(dir + '/' + f)
        dirs.append(dirv+[f])
        total_dirs += 1
      except:
        pass
  while len(dirs) == 0:
    # all entries all folders were files. That is rare, but must not kill us.
    # let us have one emergency folder.
    f = randfolder()
    try:
      os.mkdir(dir + '/' + f)
      dirs.append(dirv+[f])
      total_dirs += 1
      emerg_dirs += 1
      break
    except:
      pass

  print("%d files done. depth: %d" % (total_files, max_depth))


print("total_files: ", total_files)
print("total_dirs:  ", total_dirs)
print("max_depth:   ", max_depth)
print("emerg_dirs:  ", emerg_dirs)
print("mkdir_err:   ", mkdir_err)
print("open_err:    ", open_err)
print("seed:        ", conf['seed'])

conf['run']['result'] = {
  'total_files': total_files,
  'total_dirs': total_dirs,
  'max_depth': max_depth,
  'emerg_dirs': emerg_dirs,
  'mkdir_err': mkdir_err,
  'open_err': open_err,
}

o = open(conffile, "w")
print(json.dumps(conf, sort_keys=True, indent=4), file=o)
o.close()
print("... %s written." % (args.dir + '/' + conffile))

