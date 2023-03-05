import numpy as np
import matplotlib.pyplot as plt
from scipy import integrate

PI = 3.1415926;
count = 0;

def sum_of_list(l):
    res = 0;
    for i in l:
        res+=i;
    return res;

def sum_square(l):
    if (l.size==0):
        return 0;

    res = 0;
    for i in l: 
        res += i*i;
    return res;

# Numpy array has non-variable size, like C

# This method will not generate truly uniformly distributed independent random variables, but is close to it.
def random_nArray(n): 
    # Returns a numpy array of n elements whose sum of square is less than 1;
    res=np.array([2])
    global count;
    count+=1;
    while(sum_square(res)>1):
        res = np.random.uniform(0, 1, n);
        count+=1;
    
    # print(res);
    return res;

def area_n_sphere(n, iter):
    # INPUT: iter is the number of iterations
    # OUTPUT: a list of the area of 1-sphere to n-sphere. Note n-sphere is actually in n+1 dimension.
    area_hyperspheres = [3.1415926]
    for i in range(1,n):
        output=[];
        
        for j in range(iter):
            output.append(np.sqrt(1-sum_square(random_nArray(1+i))));
        
        approx=area_hyperspheres[i-1]*(sum_of_list(output)/iter)*2
        area_hyperspheres.append(approx);

    return area_hyperspheres;

numOfIter=10000;
calculated = area_n_sphere(8,numOfIter)
# The following are expected volume of n-sphere starting from 1-sphere
expected_area=[PI, 4/3*PI, PI**2/2, 8*PI**2/15, PI**3/6, 16*PI**3/105, PI**4/24, 32/945*PI**4, PI*5/120]

print("\n\nQuestion 4: The volume of n-sphere\n")
print("{:10} {:16} {:16} {:16}".format("Dimension", "Calculated", "Expected", "Difference"))

counter=0;
for (i, j) in zip(calculated, expected_area):
    print("{:<10} {:<16.8} {:<16.8} {:<3.3}%".format(counter+2, i, j, 100*abs(i-j)/j))
    counter+=1;
print("Number of iterations: {}".format(numOfIter))

print("count: {}".format(count))

