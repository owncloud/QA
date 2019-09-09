#! /usr/bin/python3
#
# Usage:
# study the variables below. 
#  * maxfiles seed and max_entries_per_dir are optional commandline parmeters. The others need to be edited in the code.
#  * study the contents of earlier randfiles.conf
#
# Run on a filesystem with more inodes than default:
#  mke2fs -y -t ext4 -n /dev/sdb1
#   -> prints the default inode count. Run with 5 times as many.
#  mke2fs -y -t ext4 -N 80000000 /dev/sdb1
#  
# Run on a filesystem where we have large directory support. If you see
#   [ 1738.125535] EXT4-fs warning (device sda2): ext4_dx_add_entry:2184: Directory (ino: 2) index full, reach max htree level :2
#   [ 1738.125537] EXT4-fs warning (device sda2): ext4_dx_add_entry:2188: Large directory feature is not enabled on this filesystem
#  sudo tune2fs -l /dev/sda2  | grep -i feature
#   Filesystem features:  has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
#  We can add large_dir (in addition to dir_index) option like this:
#   sudo tune2fs -O large_dir /dev/sda2

# v0.1 -- 2019-09-03, jw        initial draught
# v0.2 -- 2019-09-05, jw        adaptive min_entries_per_dir and folder_ratio for very tall trees.


import random, time, string, os, sys, json

__version__ = '0.2'

maxfiles = 1_000_000
if len(sys.argv) > 1:
  maxfiles = int(sys.argv[1])

seed = str(time.time())
if len(sys.argv) > 2:
  seed = sys.argv[2]

random.seed(seed)

folder_ratio = 0.002      # 0.02: 98% of all objects, are files; 2% are folders.

max_name_len = 200
min_name_len = 10

min_body_len = 1
max_body_len = 1_000

max_entries_per_dir = 10_000
if len(sys.argv) > 3:
  max_entries_per_dir = int(sys.argv[3])

min_entries_per_dir = 500
if max_entries_per_dir < 5000:
  min_entries_per_dir = int(max_entries_per_dir/10)
if max_entries_per_dir < 500:
  folder_ratio = 0.02
  max_name_len = 50     # try avoid crashing against MAXPATH trivially.

corpus_size = 2_000_000
conf = {
  'argv0': sys.argv[0],
  '__version__': __version__,
  'maxfiles': maxfiles,
  'seed': seed,
  'min_entries_per_dir': min_entries_per_dir,
  'max_entries_per_dir': max_entries_per_dir,
  'min_name_len': min_name_len,
  'max_name_len': max_name_len,
  'min_body_len': min_body_len,
  'max_body_len': max_body_len,
  'folder_ratio': folder_ratio,
  'corpus_size': corpus_size,
}

corpus = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(corpus_size))

def randstr(min_len=10, max_len=200):
  len = random.randint(min_len, max_len)
  len = min(len, corpus_size)
  start = random.randint(0, corpus_size-len)
  return corpus[start:start+len]


def randfile():
  name = randstr(min_name_len, max_name_len)
  body = randstr(min_body_len, max_body_len)
  return (name, body)
  
 
def randfolder():
  name = randstr(min_name_len, max_name_len)
  return name


dirs = [['.']]

total_files = 0
total_dirs = 0
emerg_dirs = 0
mkdir_err = 0
open_err = 0

done = 0
while not done:
  dirv = dirs.pop(0)
  dir = '/'.join(dirv)

  for i in range(random.randint(min_entries_per_dir, max_entries_per_dir)):
    if total_files >= maxfiles:
      done = 1
      break
    if random.random() > folder_ratio:
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

  print("%d files done. depth: %d" % (total_files, len(dirv)))


print("total_files: ", total_files)
print("total_dirs:  ", total_dirs)
print("emerg_dirs:  ", emerg_dirs)
print("mkdir_err:   ", mkdir_err)
print("open_err:    ", open_err)
print("seed:        ", seed)

o = open("randfiles.conf", "w")
print(json.dumps(conf, sort_keys=True, indent=4), file=o)
o.close()
print("... randfiles.conf written.")
