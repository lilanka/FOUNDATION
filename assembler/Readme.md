## Assembler
An assembler for RISC-V. 

![alt text](https://github.com/lilanka/kythera/tree/main/assembler/img/ss.png?raw=true)

### How to Use
```assembler.py``` file has everything you need.
```python3
python3 assembler.py --i <assembly_file>  
```
Also
```python3
python3 assembler.py --i <assembly_file> --o <out_file.bin>
```

### TODO
* Only supports few instructions. Add other instructions.
* Supports for $x_i$ based register naming. where $i = 0, 2, ..., 31$. Add register mapping which is more dynamic for user.  
* Just list based search. Use an Hash Table for searching. 
