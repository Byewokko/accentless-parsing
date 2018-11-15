#!/usr/bin/env python

import sys
from nltk.tokenize import sent_tokenize

line = sys.stdin.readline()
chunk = []
while line:
    if not line.strip() and chunk:
        for s in sent_tokenize(" ".join(chunk)):
            sys.stdout.write(s.strip())
            sys.stdout.write("\n")
        chunk = []
    chunk.append(line.strip())
    line = sys.stdin.readline()
