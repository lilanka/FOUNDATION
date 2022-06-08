# Documentation of Kythera
Kythera is 32-bit RISC-V based chip. It will contain CPU, GPU, and (maybe) AI accelerator. 
The [core](https://github.com/lilanka/kythera/tree/main/core) module contains all the 
components of the chip. 

Here is all the technical documentation of the system.

# Architecture
## PC
The program counter keeps track of current instruction and store memory address of current instruction.

# CPU
## ALU
ALU has following operations.
1. Addition.
2. Substraction
3. Bitwise AND
4. Bitwise OR
5. Bitwise XOR
6. 1's complement
7. Decrement
8. And others will be added.
9. Division

There may be different $16$ operations. So it has $\log_2 16 = 4$-bit opcode.

# Memory Arrays
Registers good for store small amount of data. Memory arrays are efficient way to store large amount of 
data. The memory consists of,
* DRAM
* SRAM
* ROM