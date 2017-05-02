#!/bin/bash
RAMDISK=”ramdisk”
SIZE=1024         #size in MB for ramdisk.
diskutil erasevolume HFS+ $RAMDISK \
     `hdiutil attach -nomount ram://$[SIZE*2048]`