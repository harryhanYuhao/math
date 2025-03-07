# Finding primes

We implement a simple algorithem for finding primes in python, julia, c, and fortran.

Here is the algorithm in python

```
upper_bound = 100000
primes = []
for i in range(2, upper_bound + 1):
    is_prime = True
    for j in range(2, i):
        if (i % j) == 0:
            is_prime = False
            break
    if is_prime:
        primes.append(i)
```


Here is the result:

- C: elaspsed time: 0.60 s; RSS: 1408 kb
- fortran90: elaspsed time 0.61 sl; RSS: 2304 kb
- python: elaspsed time 26 s; RSS 9569 kb
- julia: elapsed time 25 s; RSS 28706 kb

## Multithreading & Other optimisation.

### C and Fortran: OpenMP

C and fortran have multithreading support with OpenMD. 

### Julia

Julia has native multithreading support. 

### Python

Performance of python can be improved with JIT interpreters.

## Reproducing

The source code are provided. C and fortran executable can be compiled with make.

We bench mark it with gnu time: `\time -f "elaspsed: %E\nRSS: %M" <executable>`.
