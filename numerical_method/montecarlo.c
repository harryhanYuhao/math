// Compile with gcc -lm
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define PI 3.1415926

// only use the first 6 digits.

int myRand(long n) {  
	// returns a uniformly distributed random integer from 0 to n-1
	long limit = (RAND_MAX / n)*n;
	int r;  
	while (1){ 
		r = rand(); 
		if(r < limit) break; 
	} 
	return r % n;  
}

long double sum_of_list(long double * in, int n){
	// sum the array of n long doubles and pass the result to the pointer in
	long double res = 0;
	while(n-->0){
		res+=in[n];
	}
	return res;
}

long double sum_square(long double * a, int n){
	// sum the square of a array of n long doubles and pass to the pointer a.
	long double res = 0;
	while(n-->0){
		res += a[n]*a[n];
	}
	return res;
}

void random_nArray(long double *res, int n){
	// Make input res to be a pointer to an array of n long double whose sum of square is less than 1;
	res[0]=2;
	int number = n;	
	while (sum_square(res, n)>1){	
		number = n;
		while (number --> 0){
			int buf1, buf2;
			// uniform_10_Random(&buf2); uniform_10_Random(&buf1);
			buf2=myRand(1000); buf1=myRand(1000);
			res[number] = (long double)buf1/(1000.0f) + (long double) buf2/(1000000.0f);
		}
	}
	return;
}

void area_n_sphere(int n, int iter){
	//  INPUT: iter is the number of iterations
	//  OUTPUT: None, but print a list of the area of 1-sphere to n-sphere. Note n-sphere is actually in n+1 dimension.
	long double * area_hypersphere=(long double*)malloc(n*sizeof(long double));
	long double * output=(long double *)malloc(iter*sizeof(long double));
	long double approx;
	area_hypersphere[0]=3.1415926;
	long double two = 2.0f;
	for (int i=1; i<n; i++){
		long double * buffer=(long double *)malloc((i+1)*sizeof(long double));

		for (int j=0; j<iter; j++){
			random_nArray(buffer, i+1);
			output[j]=sqrt(1.0f-sum_square(buffer, i+1));
		}

		approx = area_hypersphere[i-1]*(sum_of_list(output, iter)/(long double)iter)*two;
		area_hypersphere[i]=approx;
		free(buffer);
	}
	
	long double expected [8] = {3.14159, 4.18879, 4.9348, 5.2637, 5.1677, 4.7247, 4.0587, 3.2985};
	printf("%8s %12s %8s\n", "Dimension", "Calculated", "Error");
	for(int i=0; i<8; i++){
		printf("%8d: %12.4Lf %8.2Lf\%\n",i+2, area_hypersphere[i], (expected[i]-area_hypersphere[i])/expected[i]*100.0f);
	}

	free(area_hypersphere);free(output);
	printf("%s %d\n", "number of iterations", iter);
	return;
}

int main() {//int argc, char *argv[]
	srand(time(NULL));   // Initialization, should only be called once.
	area_n_sphere(8, 10000);
	return 0; 
}
