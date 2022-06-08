#!/bin/python3
import sys
import argparse

def read_file(file):
  with open(file, 'r') as i:
    lines = i.readlines()
  return lines

def write_file(line, file):
  with open(file, 'w') as o:
      o.write(line+'\n')

class Encoder(object):
  # Parsing and encoding 
  def _bin(self, x, n):
    # convert x to n-bit binary    
    return format(x, 'b').zfill(n)  

  def _cat(self, *argv):
    # concatenate bits. Add as op, x1, x2, x3. 
    # returns for little-endian architecture 
    instr = ''
    for arg in argv:
      instr += str(arg)  
    return instr[::-1]

  def nop(self):
    if (self.x1 == self.x2 == self.x3 == None): 
      return self._cat(self._bin(0, 32))       

class Assembler(Encoder):
  def __init__(self):
    super().__init__()
    pass

  def is_label(self, line):
    if ':' in line:
      return True
    return False

  def parse(self, line):
    # seperate label, opcode, register values, and comment from each line 

    self.label = None
    self.op = None
    self.x1 = None
    self.x2 = None
    self.x3 = None
    self.comment = None
    line = " ".join(line.split())

    for i, arg in enumerate(line):
      if (arg == "#"): 
        self.comment = line[i+1:].split()
        line = line[:i] 
        break
    line = line.split()

    match len(line):
      case 0: return None
      case 1: 
        if self.is_label(line[0]):
          self.label = line[0]
        else:
          self.op = line[0]
      case 2: 
        self.op = line[0]
        self.x1 = line[1]
      case 3:
        if self.is_label(line[0]):
          self.label = line[0]
          self.op = line[1]
          self.x1 = line[2]
        else:
          self.op = line[0]
          self.x1 = line[1]
          self.x2 = line[2]
      case 4:
        if self.is_label(line[0]):
          self.label = line[0]
          self.op = line[1]
          self.x1 = line[2]
          self.x2 = line[3]
        else:
          self.op = line[0]
          self.x1 = line[1]
          self.x2 = line[2]
          self.x3 = line[3] 

  def error(self, message):
    print(f'Assembler error: {message}')

  def process(self, number):
    # check the validity of the line
    if (self.label == self.op == \
      self.x1 == self.x2 == self.x3 == None):  
      return False;

    if ((self.op == 'NOP' or  self.op == 'nop') and \
       (self.x1 == self.x2 == self.x3 == None)):
      return True 
    return False 

  def encode(self):
    # generate binary instructions
    if (self.op == 'NOP' or self.op == 'nop'):
      return self.nop()
    
  def assemble(self, lines, out_file):
    for number, line in enumerate(lines):
      self.parse(line)
      if (self.process(number)):
        instr = self.encode()
        write_file(instr, out_file)
      else:
        self.error(f'Invalid instruction on lne {number}') 

if __name__ == '__main__':
  # take arguments
  parser = argparse.ArgumentParser(description="Assembler")
  parser.add_argument("--i", type=str)
  parser.add_argument("--o", type=str, default="out.bin")
  args = parser.parse_args()

  lines = read_file(args.i)
  
  ass = Assembler()
  ass.assemble(lines, args.o)
