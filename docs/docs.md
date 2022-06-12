# Documentation of Kythera

# Architecture
The system can haddle following instructions.
* R type instructions: ``add, sub, and, or, slt``
* Memory instructions: ``lw, sw``
* Branches: ``beq``

The five stage pipelined processor. 
1. Fetch instructions from memory
2. Read registers and decode instructions.
3. Execute instruction or calculate an address.
4. Writeback the result to register. 

# Performance
Execution time of a program in seconds
$$exectution\ time = (number\ of\ instructions) 
\left(\frac{cycles}{instruction}\right)
\left(\frac{seconds}{cycle}\right)$$