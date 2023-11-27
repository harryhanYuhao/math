from numba import jit
import time

@jit(nopython=True)
def findP():
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
    
    print(len(primes))

tmp = time.time()
findP()
print("with compilation, it took", time.time()-tmp)


tmp = time.time()
findP()
print("without compilation, it took", time.time()-tmp)
