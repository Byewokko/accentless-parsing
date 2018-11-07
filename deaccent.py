#!/usr/bin/env python

import sys
import unidecode

for line in sys.stdin:
    for c in line:
        sys.stdout.write(unidecode.unidecode(c)[0])


#[chr(int(c,16)) for c in unicodedata.decomposition("í").split(" ") if c]
