## Randfiles creates a filesystem tree 

File and directory names are random data, 
file content is random data.

File can be created in a flat folder or in deep hierarchies.

### Examples

* Create a tree with default settings in folder `1mio`:

`./randfiles.py 1mio`
```
5247 files done. depth: 1
11759 files done. depth: 2
...
998496 files done. depth: 3
1000000 files done. depth: 3
total_files:  1000000
total_dirs:   5100
max_depth:    3
emerg_dirs:   0
mkdir_err:    0
open_err:     0
seed:         1605617636.9358175
... 1mio/1mio.conf written.
```

As seen below, -f defaults to 0.5%, that means for each 200 files, one directory is created.
giving ca 5.000 directories amongs 1.000.000 files.
The -e parameter causes multiple levels of subdirectories, by forcing that no more than
10000 (default) files are in each directory. In the above case, this resulted in a tree 3 levels deep.

The total size of the default setting is ca. 12 GB -- it takes a few minutes to complete, depending on hard disk size.


* A quicker example with a deeper tree (ca 1.2 GB of data, and short file and folder names):

`randfiles.py -m 100000 -e 1000 -n 12 100k`
```
104 files done. depth: 1
209 files done. depth: 2
573 files done. depth: 3
1146 files done. depth: 4
...
99886 files done. depth: 10
100000 files done. depth: 10
total_files:  100000
total_dirs:   503
max_depth:    10
emerg_dirs:   2
mkdir_err:    0
open_err:     0
seed:         1605618427.722983
... 100k/100k.conf written.
```

Note that the *.conf files in the tree can be used with the -L option to create another tree with the same structure.


### Usage
```
Usage: randfiles.py [-h] [-m MAXFILES] [-s SEED_STRING] [-f FOLDER_PERCENTAGE]
                    [-e MAX_ENTRIES_PER_DIR]
                    [--min_entries_per_dir MIN_ENTRIES_PER_DIR]
                    [-n MAX_NAME_LEN] [--min_name_len MIN_NAME_LEN]
                    [-b MAX_BODY_LEN] [--min_body_len MIN_BODY_LEN]
                    [-c CORPUS_SIZE] [-L CONFIG_FILE] [-t]
                    DIR

Create deep or shallow trees of random files.

positional arguments:
  DIR                   destination folder

optional arguments:
  -h, --help            show this help message and exit
  -m MAXFILES, --maxfiles MAXFILES
                        Number of files to generate. Default: 1000000
  -s SEED_STRING, --seed SEED_STRING
                        String to seed the random generator. Call with
                        identical seed to recreate an identical tree. Default:
                        current timestamp in msec
  -f FOLDER_PERCENTAGE, --folder_ratio FOLDER_PERCENTAGE
                        Probability to create a subfolder instead of a file,
                        as percent. Default: 0.5
  -e MAX_ENTRIES_PER_DIR, --max_entries_per_dir MAX_ENTRIES_PER_DIR
                        Maximum number files/subdirs per directory. Default:
                        10000
  --min_entries_per_dir MIN_ENTRIES_PER_DIR
                        Minimum number files/subdirs per directory. Default:
                        500
  -n MAX_NAME_LEN, --max_name_len MAX_NAME_LEN
                        Maximum length of file/subdir names. Default: 50
  --min_name_len MIN_NAME_LEN
                        Minimum length of file/subdir names. Default: 10
  -b MAX_BODY_LEN, --max_body_len MAX_BODY_LEN
                        Maximum length file contents. Default: 1000
  --min_body_len MIN_BODY_LEN
                        Minimum length file contents. Default: 1
  -c CORPUS_SIZE, --corpus_size CORPUS_SIZE
                        Size of the internal random pool. (Larger is more
                        chaotic but slower). Default: 2000000
  -L CONFIG_FILE, --load_config CONFIG_FILE
                        Load a config file from a previous run, before
                        applying other options. Default: none.
  -t, --testonly        Only test how deep or wide a tree could be. Default:
                        create a tree.
