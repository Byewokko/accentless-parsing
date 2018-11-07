#!/usr/bin/env python

import sys
import re

for line in sys.stdin:
    line = re.sub(r"\w","I",line.strip())
    line = re.sub(r"\bI\b","S",line)
    line = re.sub(r"I\b","E",line)
    line = re.sub(r"\bI","B",line)
    line = re.sub(r"[^\w ]","P",line)
    sys.stdout.write(line)
    sys.stdout.write("\n")
