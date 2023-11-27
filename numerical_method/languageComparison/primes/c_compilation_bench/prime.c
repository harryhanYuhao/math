#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main()
{
	int upper_bound = 100000;
	int *primes = malloc(sizeof(int) * upper_bound / 2);
		int prime_counter = 0;
#pragma omp parallel for reduction(+:prime_counter)
		for (int i = 2; i <= upper_bound; ++i){
			int is_prime = 1;
			for (int j = 2; j < i; ++j){
				if (i % j == 0){
					is_prime = 0;
					break;
				}
			}
			if (is_prime){
				primes[prime_counter] = i;
				++prime_counter;
			}
		}
		printf("%d primes found!\n", prime_counter);
	free(primes);
	return 0;
}
