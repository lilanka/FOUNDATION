## Kythera
Kythera is 32-bit Chip build from scratch. From assembler to memory stuff can be found on here.

### Whole translation stack.  
High level code -> [compiler](https://github.com/lilanka/cc) -> Assembly code -> [Assembler](https://github.com/lilanka/kythera/tree/main/assembler) -> object file -> Linker -> Executable -> Loader -> Memory


### Directories
* ``assembler/`` - An assembler written in Python.
* ``core/`` - The chip core.
* ``bootrom/`` - A bootrom to download code to RAM over serial port. 
