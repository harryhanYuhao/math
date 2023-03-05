# Comparing C, Python, and Julia in Computational & Numerical Analysis

## Performance

### Monte Carlo Integration

#### Truly random

It is difficult to generate truly uniformly distributed random numbers. For C and julia, the method form standard library are off by quit a bit. The numpy random generator python(`numpy.random.uniform`) is better but not fully "random" either.

##### Python

### A Complicated Example: Use Estimate the Volume of n-Sphere

#### The algorithm 

The performance of each language was tested with the following algorithm to estimate the volume of 1-Sphere to 8-Sphere (all with radius of 1):

- The volume of 1-Sphere is given as 3.1415926
- 10000 coordinate of $(n-1)$ dimension were generated with $(n-1)$ uniformly distributed independent random varialbe from 0 to 1. If the coordinate lies outside of the n-1 sphere, the random genration was repeated until it lies within the sphere. The coordinates were stored in `lis_coor`.
- A list was created by :`[sqrt(1-sum_of_square(i) for i in lis_coor]`. Its mean was calculated and stored in variable `m`.
- The volume of the $(n-1)$ sphere was estimated as $2V_{n-1}\cdot m$


