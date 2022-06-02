#!/bin/python3

import sys

def read_file(file):
  with open(file, 'r') as i:
    lines = i.readlines()
  return lines

def write_file(binary, file):
  with open(file, 'w') as o:
    for line in binary:
      o.write(line)

def error(message):
  print(f'aV error: {message}')

def parse(line):
  # parse a line into tokens
  # [label:] [op [arg1[, arg2[, arg3]]]] [# comment]

  line = " ".join(line.split())
  for i, arg in enumerate(line):
    if arg == "#": 
      comment = line[i+1:].split()
      line = line[:i] 
      break
  line = line.split()
  if len(line) == 0:
    label, op, x1, x2, x3, comment = None, None, None, None, None, None
  elif len(line) == 1:
    label = line[0]
  else:
    op = line[0]
    x1 = line[1]
    x2 = line[2]
    if len(line) == 5:
      x3 = line[4]
def assemble(lines, file):
  for line in lines:
    parse(line)
  #write_file(binary, file)

if __name__ == '__main__':
  in_file = sys.argv[1]
  try: 
    out_file = sys.argv[2]
    lines = read_file(in_file)
    assemble(lines, out_file)
  except IndexError:
    print("Input the output file as: python3 input_file.py output_file")
