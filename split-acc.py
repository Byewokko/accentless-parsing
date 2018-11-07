#!/usr/bin/env python

import sys
import unicodedata


with open(sys.argv[1],"r") as fin, \
     open(sys.argv[1]+".dry","w") as dry, \
     open(sys.argv[1]+".acc", "w") as acc:
    for line in fin:
        for c in line.strip("\n"):
            decomp = [chr(int(part,16))
                      for part in unicodedata.decomposition(c).split(" ")
                      if part]
            if decomp:
                dry.write(decomp[0])
                acc.write(decomp[1])
            else:
                dry.write(c)
                acc.write("_")
        dry.write("\n")
        acc.write("\n")
        
