#!/usr/bin/python3
import sys

class Assembler():
  def __init__(self, filename, isa):
    self.fname = filename
    self.isa = isa 
  
  def assembler(self):
    data = self._read_file()

  def _read_file(self):
    with open(self.fname, 'r') as f:
      data = f.readlines()
    data = map(lambda x: x.strip(), data)
    data = map(lambda x: x.split(';', 1)[0], data)
    data = filter(lambda x: x is not None, data)
    data = filter(lambda x: len(x) > 0, data)
    return data

if __name__ == "__main__":
  A = Assembler(sys.argv[1], sys.argv[2])
  A.assembler()
