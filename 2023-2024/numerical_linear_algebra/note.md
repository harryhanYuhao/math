# Note

## Lecture 2

FLOP: floating point operation: including multiplication, division, addition, substraction, square root.

FLOPS: Floating Point Operations Per Second

C = number of FLOP

C(n) is the complexity of the algorithm: n is the size of the matrices.

Use the big O notation: $C(n) = O(f(n))$ if there exists a constant c such that $C(n) <= c*f(n)$ for all $n$.

Say: $C(n) = O(n^3)$ if $C(n) = 3*n^3$ for all $n$.

### Dot Product DP

Input: $\underline{x}, \underline{y} \in \mathbb{R}$

Output: $s = \underline{x} \cdot \underline{y}$

Algorithm:

```python
x # array
y # array
s = 0
for i, j in zip(x, y):
    s = s + i*j
```

Complexity: $C(2n) = O(n)$. Two operation: addition and multiplication.

### Product of Vector and Matrices: HV

Input: $A \in R^{m\times n}, x \in R^n$

Output $y \in R^m$

Algorithm: 
```python
res = 0
for i in range(m):
    res += dotproduct(A[i], x) # using DP algorithm
```

Complexity: $C(n*M) = 2nm = O(mn)$

### Product of Matrices

Complexity for square matrices: $O(n^3)$

### Vector Norm

$x$ is n dimensional vector:

$||x||_p = (\sum_{i=i}^n |x_i|^p )^{1/p}$

$p = infinity: ||x||_p = |max(x_i)|$

Note:

- norm are positive 
- ||ax|| = |a| ||x||
- triangule inequality: ||x+y|| <= ||x|| + ||y||

### Matrix norm induced by ||x||p

$A \in R^{m*n}$, $||A||_p = max_{x\in R^n} \frac{||Ax||_p}{||x|}$

Note:
- $||A||_{\infty}$ = max row sum
- $||A||_{1}$ = max column sum
- $||A||_{2}$ = max $\lambda_n$ which is eiganvlaues of $A^TA$
