#!/bin/python3
import sys
import argparse

def read_file(file):
  with open(file, 'r') as i:
    lines = i.readlines()
  return lines

def write_file(line, file):
  with open(file, 'w') as o:
      o.write(line)

r_instr = [
  'add', 'sub', 'sll', 'sltu', 'xor', 'srl',
  'sra', 'or', 'and', 'addw', 'subw', 'sllw',
  'slrw', 'sraw', 'mul', 'mulh', 'mulu', 'mulsu',
  'div', 'divu', 'rem', 'remu']

i_instr = [
  'addi', 'lb', 'lw', 'ld', 'lbu', 'lhu', 
  'lwu', 'fence', 'fence.i', 'slli', 'slti', 'sltiu',
  'xori', 'slri', 'srai', 'ori', 'andi', 'addiw',
  'slliw', 'srliw', 'sraiw', 'jalr', 'ecall', 'ebreak']

registers = [
  'x0', 'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7',
  'x8', 'x9', 'x10', 'x11', 'x12', 'x13', 'x14', 'x15',
  'x16', 'x17', 'x18', 'x19', 'x20', 'x21', 'x22', 'x23',
  'x24', 'x25', 'x26', 'x27', 'x28', 'x29', 'x30', 'x31']

class Encoder(object):
  # Parsing and encoding 
  def _bin(self, x, n):
    # convert x to n-bit binary    
    return format(x, 'b').zfill(n)  

  def encode_register(self, x):
    if (x == 'zero' or x == 'x0'):
      return str(self._bin(0, 5))
    else:
      idx = registers.index(x)
      return str(self._bin(idx, 5))

  def r_instr(self):
    for ins in self.instr_data:
      if (self.op.lower() == ins[0]):
        opcode = ins[1]; f3 = ins[2]; f7 = ins[3] 
    rd = self.encode_register(self.rd)
    r1 = self.encode_register(self.r1)
    r2 = self.encode_register(self.r2)
    return "".join([f7, r2, r1, f3, rd, opcode])

  def i_instr(self):
    for ins in self.instr_data:
      if (self.op.lower() == ins[0]):
        opcode = ins[1]; f3 = ins[2]

    rd = self.encode_register(self.rd)
    r1 = self.encode_register(self.r1)
    imm = self._bin(int(self.r2), 12)
    return "".join([imm, r1, f3, rd, opcode])

  def encode(self):
    # instruction data 
    self.instr_data = read_file('riscv/instructions.txt') 
    for i, ins in enumerate(self.instr_data):
      self.instr_data[i] = ins.split()

    if (self.op.lower() in r_instr):
      return self.r_instr()

    elif (self.op.lower() in i_instr):
      return self.i_instr()

class Assembler(Encoder):
  def __init__(self):
    super().__init__()

  def is_label(self, line):
    if ':' in line:
      return True
    return False

  def parse(self, line):
    # seperate label, opcode, register values, and comment from each line 
    self.label = None
    self.op = None
    self.rd = None
    self.r1 = None
    self.r2 = None
    line = " ".join(line.split()).replace(',', '')

    for i, arg in enumerate(line):
      if (arg == "#"): 
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
        self.rd = line[1]
      case 3:
        if self.is_label(line[0]):
          self.label = line[0]
          self.op = line[1]
          self.rd = line[2]
        else:
          self.op = line[0]
          self.rd = line[1]
          self.r1 = line[2]
      case 4:
        if self.is_label(line[0]):
          self.label = line[0]
          self.op = line[1]
          self.rd = line[2]
          self.r1 = line[3]
        else:
          self.op = line[0]
          self.rd = line[1]
          self.r1 = line[2]
          self.r2 = line[3] 
    # print(f'{self.op}, {self.rd}, {self.r1}, {self.r2}')
  def error(self, message):
    print(f'Assembler error: {message}')

  def process(self, number):
    # check the validity of the line
    if (self.op == None):  
      return False;

    elif ((self.op == 'NOP' or  self.op == 'nop') and \
       (self.rd == self.r1 == self.r2 == None)):
      return True 
  
    # R instruction validation
    elif (self.op.lower() in r_instr and self.rd != None and self.r1 != None and self.r2 != None):
      return True

    return False 
    
  def assemble(self, lines, out_file):
    instr = ''
    for number, line in enumerate(lines):
      self.parse(line)
      if (self.process(number)):
        instr += self.encode() + '\n'
      else:
        self.error(f'Invalid instruction on lne {number}') 
    write_file(instr, out_file)

if __name__ == '__main__':
  # take arguments
  parser = argparse.ArgumentParser(description="Assembler")
  parser.add_argument("--i", type=str)
  parser.add_argument("--o", type=str, default="output/out.bin")
  args = parser.parse_args()

  lines = read_file(args.i)
  
  ass = Assembler()
  ass.assemble(lines, args.o)
