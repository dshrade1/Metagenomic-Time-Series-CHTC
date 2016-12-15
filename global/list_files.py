#!/usr/bin/python

import os
import sys
from os import walk

dir_name=sys.argv[1]
print(dir_name)
mypath = os.path.join(".", dir_name)
print(mypath)
f = []
for (dirpath, dirnames, filenames) in walk(mypath):
    f.extend(filenames)
    break

readFileList = open('readFileList.txt','w')

for item in f:
  print>>readFileList, item
