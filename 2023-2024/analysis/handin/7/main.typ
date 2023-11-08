= Q2

If $n$ is integer and $f(x) = [x n]^2$ for all $x in RR$. We are to show that 

$ integral _((0,1)) f(x) = 1/n sum_(j=1)^(n-1) j^2 $ 

Notice that for each $n >= 0$, partition the interval $I = (0, 1)$ into $n$ subinterval $J_1 dots.h.c J_n$ such that $J_i = ( (i-1)/n, i/n )$; i.e., $J_1 = (0, 1/n), J_2 = (1/n, 2/n), dots.h.c, J_n=( (n-1)/n, 1)$.

Clearly for all $x in J_i, f(x) = (i-1)^2$. Thus we can write $f(x) = sum_j^(n) (j-1)^2 chi_(J_j) (x)$.

For all finite $n$, $sum_(j=1)^n lambda(J_j) (j-1)^2$ is finite and equals to  $sum_(j=1)^n 1/n (j-1)^2 = 1/n sum_(j=1)^(n-1) j^2 $, thus we conclude
$integral _((0,1)) f(x) = 1/n sum_(j=1)^(n-1) j^2$. 

Moreover, it can be proved simply for induction that 
$ 1/n sum_(j=1)^(n-1) j^2 = 1/6 n(n-1)(2n-1)$ .

#pagebreak()

= Q5

$f: [a, b] -> RR$ is continuous and $M = sup |f(x)|$. 

(a)

We are to prove that 
