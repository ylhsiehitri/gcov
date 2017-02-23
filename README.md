# gcov
gcov tutorial and simple
## gcov for usersapce C program
1. Add -ftest-coverage -fprofile-arcs when compiling codes  
`
gcc -ftest-coverage -fprofile-arcs main.c -o main  
`

2. Use gcov to capture coverage  
`
gcov main.c  
`

3. Outout html report py lcov and genhtml  
```
lcov -c -o main.info -d .  
genhtml main.info -o main_result
```
##gcov for kernel modles
###Require gcov enabled linux kernel
http://techvolve.blogspot.tw/2014/03/how-to-gcovlcov-for-linux-kernel-modules.html
here we use hello.c and Makefile as example  
1. Edit your Makefile as src/Makefile shows.  
	Add following
``` 
GCOV_PROFILE := y
CFLAGS=-ftest-coverage -fprofile-arcs
export CFLAGS
```

2. Make  
	Use make command to compile driver.  
3. Install driver and run your test program maybe.  
  insmod
4. The gcov file will be in  
`
/sys/kernel/debug/gcov/<your dir>/program.gcda nad program.gcno
`
5. Copy .gcda and .gcno to your project dir.  
6. Run gcov  
`
gcov hello.c
`
7. Outout html report py lcov and genhtml  
```
lcov -c -o hello.info -d .  
genhtml hello.info -o main_result
```
