#!/bin/python3
import sys

def nop():
  if (x1 == x2 == x3 == None):
    #encode(0xb0)
    pass

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

def is_label(line):
  if ':' in line:
    return True
  return False

def parse(line):
  # seperate label, opcode, register values, and comment from each line 
  global label, op, x1, x2, x3, comment
  label, op, x1, x2, x3, comment = None, None, None, None, None, None

  line = " ".join(line.split())
  for i, arg in enumerate(line):
    if (arg == "#"): 
      comment = line[i+1:].split()
      line = line[:i] 
      break
  line = line.split()

  match len(line):
    case 0: return None
    case 1: 
      if is_label(line[0]):
        label = line[0]
      else:
        op = line[0]
    case 2: op, x1 = line[0], line[1]
    case 3:
      if is_label(line[0]):
        label, op, x1 = line[0], line[1], line[2]
      else:
        op, x1, x2 = line[0], line[1], line[2]
    case 4:
      if is_label(line[0]):
        label, op, x1, x2 = line[0], line[1], line[2], line[3]
      else:
        op, x1, x2, x3 = line[0], line[1], line[2], line[3] 

def process(number):
  # check the validity of the line
  if (label == op == x1 == x2 == x3 == None):  
    return True;
  if (op == 'NOP' or  op == 'nop'):
    nop()
  else:
    error(f'Invalid command: {op} on line {number}')
    return False

  return True

def assemble(lines, out_file):
  for number, line in enumerate(lines):
    parse(line)
    if (process(number)):
      pass
      
  #write_file(binary, file)

if __name__ == '__main__':
  in_file = sys.argv[1]
  out_file = sys.argv[2]
  lines = read_file(in_file)
  assemble(lines, out_file)
