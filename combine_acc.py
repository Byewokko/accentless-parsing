#!/usr/bin/env python

import sys
import unicodedata


with open(sys.argv[1]+".dry","r") as dry, \
     open(sys.argv[1]+".acc","r") as acc, \
     open(sys.argv[1]+".com", "w") as com:
    for dline,aline in zip(dry,acc):
        for d,a in zip(dline.strip("\n"),aline.strip("\n")):
            if a == "_":
                com.write(d)
            else:
                try:
                    com.write(unicodedata.normalize("NFC","".join((d,a))))
                except KeyError:
                    com.write(d)
                    print("".join((d,a)))
        com.write("\n")
