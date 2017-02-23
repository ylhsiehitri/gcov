# Makefile for kernel test
#
PWD         := $(shell pwd) 
KVERSION    := $(shell uname -r)
KERNEL_DIR   = /usr/src/linux-headers-$(KVERSION)/
MODULE_NAME  = hello
GCOV_PROFILE := y
CFLAGS=-ftest-coverage -fprofile-arcs
export CFLAGS

obj-m       := $(MODULE_NAME).o   
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
