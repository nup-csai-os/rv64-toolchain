## warm up exercise

Problem: implement syscall which is taking cpu/core id and return into userspace

## Steps
- add cpuid.c file in user/, print something like 'hello'
- modify Makefile and build system
- check that hello is printing
- add hartid() proto to user.h
- add entry in usys.pl
- add definition to syscall.h
- add file hartid.c in kernel/ and implement it returning some number like 9
- modify Makefile and test it
- search in sources to figure out what to call ro return real hart ID and implement it