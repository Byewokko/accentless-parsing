#!/usr/bin/env python

import sys
import unicodedata

def split(c, deaccent=False):
    try:
        name = unicodedata.name(c)
    except:
        return c
    if " WITH " in name and " LETTER " in name:
        ans = []
        if deaccent:
            return unicodedata.lookup(name.split(" WITH ")[0])
        for n in name.split(" WITH "):
            try:
                ans.append(unicodedata.lookup(n))
            except KeyError:
                try:
                    ans.append(unicodedata.lookup(n + " ACCENT"))
                except KeyError:
                    pass
        return "".join(ans)
    return c

def main():
    for line in sys.stdin:
        for c in line:
            sys.stdout.write("".join(split(c)))
        
if __name__ == "__main__":
    main()
    
