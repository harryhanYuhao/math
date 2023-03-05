import numpy as np
import matplotlib.pyplot as plt
from scipy import integrate

PI = np.pi;

# #Question 1:
# # montecarlo integral, input function f, lower bound a, upper bound b, number of samples n
# def montecarlo(f, a, b, N):
#     # generate random samples
#     x = np.random.uniform(a, b, N)
#     # evaluate function at random samples
#     y = f(x)
#     # calculate integral
#     I = (b-a)*np.mean(y)
#     return I
#
# def f(x):
#     return np.cos(x)
#
# # calculate integral
# I = montecarlo(f, 0, 1, 1000)
# print("The result of our montecarlo approximation:\n", I, sep='')
#
# # Question 2
# # integrate.quad returns a list, the first element is the integral value
# print("The error: ", np.abs(I - integrate.quad(f, 0, 1)[0]))
#
# # Question 3
# def montecarlo_2D(f, a, b, c, d, N):
#     # generate random samples
#     x = np.random.uniform(a, b, N)
#     y = np.random.uniform(c, d, N)
#     # evaluate function at random samples
#     z = f(x, y)
#     # calculate integral
#     I = (b-a)*(d-c)*np.mean(z)
#     return I
#
# def f_2D(x, y):
#     return np.cos(x)*np.sin(y)
#
# # calculate integral
# I = montecarlo_2D(f_2D, 0, 1, 0, 1, 1000)
# print("The result of our montecarlo_2D approximation:\n", I, sep='')
#
# # integrate.dblquad returns a list, the first element is the integral value
# print("The error: ", np.abs(I - integrate.dblquad(f_2D, 0, 1, lambda x: 0, lambda x: 1)[0]))
#
# Write a function volume_ball(n, N) which uses random sampling in a similar way, to estimate the volume of an n-dimensional ball with radius 1 and centred around the origin, using N uniformly distributed random points.  

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


def random_nArray(n):
    # Returns a numpy array of n elements whose sum of square is less than 1;
    res=np.array([2])
    while(sum_square(res)>1):
        res = np.random.uniform(0, 1, n);
    
    # print(res);
    return res;

def area_n_sphere(n, iter):
    # INPUT: iter is the number of iterations
    # OUTPUT: a list of the area of 1-sphere to n-sphere. Note n-sphere is actually in n+1 dimension.
    area_hyperspheres = [np.pi]
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


