CC=gcc
FC=gfortran
FLAGS=-g -O3 
PARALLELFLAGS=-fopenmp

all: c_parallel f90_parallel c_nonparallel f90_nonparallel

c_parallel: prime.c
	$(CC) $(FLAGS) $(PARALLELFLAGS) -o c_parallel prime.c 

f90_parallel: prime.f90 
	$(FC) $(FLAGS) $(PARALLELFLAGS) -o f90_parallel prime.f90 

c_nonparallel: prime.c 
	$(CC) $(FLAGS) -o c_nonparallel prime.c 

f90_nonparallel: prime.f90
	$(FC) $(FLAGS) -o f90_nonparallel prime.f90

bench: c_parallel c_nonparallel f90_parallel  f90_nonparallel 
	for exec in $^ ; do \
		echo "benchmarking " $$exec; \
		\time -f "Elapsed Time: %E\nMaximum Memory Set Size: %M Kb" ./$$exec; \
		echo; \
	done

clean:
	rm -f c_parallel f90_parallel c_nonparallel f90_nonparallel
