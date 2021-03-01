### 
Test of remote shell exploit 

x32 bit version

works with ASLR disabled
```
$ nc -lvp 4444
$ sudo bash -c "echo 0 > /proc/sys/kernel/randomize_va_space
```