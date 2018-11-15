#!/usr/bin/env python3
import sys
from random import shuffle
import unicodedata
import argparse
from split_acc import split
    
def deaccent_string(s):
    return "".join([split(c,deaccent=True) for c in s])
    
#################################

def main():

    parser = argparse.ArgumentParser(description="Deaccent or partly deaccent.")
    parser.add_argument("input_file")
    parser.add_argument("output_file")
    parser.add_argument("-p", "--percentage", type=float, default=100)
    parser.add_argument("-c", "--conll", action="store_true", default=False)
    parser.add_argument("-l", "--lines-file-input", default=False)
    parser.add_argument("-n", "--lines-file-output", default=False)

    args = parser.parse_args()
    input_file = args.input_file
    output_file = args.output_file
    percentage = args.percentage
    conll = args.conll
    lines_file_input = args.lines_file_input
    lines_file_output = args.lines_file_output
    
    if conll and not lines_file_input:
        sys.stderr.write("Missing lines-file-input file for conll file\n")
        return
        

    # Read or generate line numbers

    if not lines_file_input:
        # Count lines and pick random numbers
        count = 0
        with open(input_file,"r") as fin:
            for line in fin:
                count += 1

        #sys.stderr.write("{} lines total. Deaccenting {} lines ({}%)...\n".format(count,count*part/100,part))

        rand = list(range(count))
        shuffle(rand)
        dlines = set(rand[:int(count*percentage/100)])
        if lines_file_output:
            with open(lines_file_output,"w") as lnout:
                lnout.write("\n".join([str(l) for l in dlines]))
        else:
            sys.stderr.write("\n".join([str(l) for l in dlines]))
            
    else:
        # Read numbers from file
        with open(lines_file_input,"r") as fin:
            dlines = set([int(ln.strip()) for ln in fin.readlines()])

    #print(dlines)

    if not conll:
        with open(input_file,"r") as fin, open(output_file,"w") as fout:
            for i,line in enumerate(fin):
                if i in dlines:
                    fout.write(deaccent_string(line))
                else:
                    fout.write(line)
    else:
        with open(input_file,"r") as fin, open(output_file,"w") as fout:
            i = 0
            line = fin.readline()
            while line:
                if line.strip():
                    if i in dlines and not line.startswith("#"):
                        word = line.split("\t")
                        word[1] = deaccent_string(word[1])
                        word[2] = deaccent_string(word[2])
                        fout.write("\t".join(word))
                    else:
                        fout.write(line)
                else:
                    fout.write(line)
                    i += 1
                line = fin.readline()
                
########################
            
if __name__ == "__main__":
    main()
    
