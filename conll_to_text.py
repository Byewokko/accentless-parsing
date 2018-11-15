import sys

line = sys.stdin.readline()
while line:
    if line.startswith("# text = "):
        print(line[len("# text = "):].strip())
    line = sys.stdin.readline()
