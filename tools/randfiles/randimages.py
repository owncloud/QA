#!/usr/bin/python3
#
# Requires:
#   apt install python3-pil

import sys, re, random
try:
    from PIL import Image
except:
    print("ERROR: PIL not found. Try:\n\t apt install python3-pil\n")
    sys.exit(1)

VERSION = 1.0
imgcount = 10000
prefix = './randimg_'

if len(sys.argv) < 2 or sys.argv[1] == '-h' or sys.argv[1] == '--help':
    print(f"""
randimages V{VERSION} Usage:

        {sys.argv[0]} SOURCE.png [N] [PREFIX]

Parameters:
        SOURCE.png - an existing to uses as source material.
        N	   - an optional image count. Default: {imgcount}
        PREFIX     - output image name prefix, may be specified as a full path. Default: "{prefix}"

Creates a number of small random snippets from the named SOURCE.png image and ((by default) places them in the current folder.
Both sizes and location of the snippets are random.
""")
    sys.exit(0)


infile = sys.argv[1]
if len(sys.argv) > 2:
    imgcount = sys.argv[2]
if len(sys.argv) > 3:
    prefix = sys.argv[3]

suffix = re.sub('.*\.', '.', infile)
if len(suffix) == 0 or suffix[0] != '.': suffix = '.img'

print(infile, suffix, imgcount)

# Open the image file
img = Image.open(infile)


def save_cropped(img):
    w = random.randint(100, 200)
    h = random.randint(100, 200)
    x = random.randint(0, img.width-w-1)
    y = random.randint(0, img.height-h-1)
    if x < 0 or y < 0:
        print("source image too small. need min. 200 x 200")
        sys.exit(1)

    cropped = img.crop((x, y, x+w, y+h))
    outname = f"{prefix}{w}x{h}a{x}x{y}{suffix}"
    cropped.save(outname)
    return outname


for i in range(int(imgcount)):
    name = save_cropped(img)
    if i % 50 == 0: print(f"{i} \t{name}")

