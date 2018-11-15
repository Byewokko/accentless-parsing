#!/usr/bin/env python3

import sys
from split_acc import split

for line in sys.stdin:
    for c in line:
        sys.stdout.write(split(c,deaccent=True))


