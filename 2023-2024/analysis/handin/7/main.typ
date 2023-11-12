= Q2

If $n$ is integer and $f(x) = [x n]^2$ for all $x in RR$. We are to show that 

$ integral _((0,1)) f(x) = 1/n sum_(j=1)^(n-1) j^2 $ 

For each $n >= 1$, partition the interval $I = (0, 1)$ into $n$ subinterval $J_1 dots.h.c J_n$ such that $J_i = ( (i-1)/n, i/n )$; i.e., $J_1 = (0, 1/n), J_2 = (1/n, 2/n), dots.h.c, J_n=( (n-1)/n, 1)$.

Clearly for all $x in J_i, f(x) = (i-1)^2$. Thus we can write $f(x) = sum_(j=1)^(n) (j-1)^2 chi_(J_j) (x)$.

For all finite $n$, $sum_(j=1)^n lambda(J_j) (j-1)^2$ is finite and equals to  $sum_(j=1)^n 1/n (j-1)^2 = 1/n sum_(j=1)^(n-1) j^2 $, thus we conclude
$integral _((0,1)) f(x) = 1/n sum_(j=1)^(n-1) j^2$. 

Moreover, it can be proved simply by induction that 
$ 1/n sum_(j=1)^(n-1) j^2 = 1/6 n(n-1)(2n-1)$ .

#pagebreak()

= Q5

$f: [a, b] -> RR$ is continuous and $M = sup |f(x)|$. 

In this session let $p>0$ and $b>a$.

== (a)

We are to prove that for all $0<epsilon<M/2$, there is an non-empty open interval $I$ such that 

$ (M - epsilon)^n lambda(I) <= integral_a^b |f(x)|^p <= M^p (b-a) $

=== Part 1: prove $integral_a^b |f(x)|^p < M^p (b-a)$

Since $|f(x)| <= M$, and $p>0$, we know that $|f(x)|^p <= M^p$.

By definition of integral of constant function, we know that $integral_a^b M^p = lambda((a, b)) M^p = (b-a) M^p$

Moreover, as $M^p >= |f(x)|^p$, by theorem 4.2.b from lecture note, we have $integral_a^b |f(x)|^p <= integral_a^b M^p = (b-a)M^p$

=== Part 2: for all $epsilon>0$, there is non empty interval $I$ such that $(M - epsilon)^n lambda(I) <=integral_a^b |f(x)|^p$

As $|f|$ has supremum $M$, for all $0 < epsilon < M/2 $, by the definition of supremum, there exist $c in (a,b)$ such that $M- epsilon/2 <= |f(c)| <= M$.

Since $f$ is continuous, we conlcude $|f(x)|$ is also continuous. 
Thus, for $zeta = (epsilon)/2$,
there exist $delta > 0$ such that for all $|x-c| < delta$, we have $| |f(x)| - |f(c)| | < zeta $; i.e., for all $x in I = (c-delta, c+delta) sect (a,b) $, (as (a,b) is open non-empty interval, $I$ must not be empty), we have $M-epsilon <=|f(x)| <=M$.

As $ 0 < epsilon < M/2$, we safely conclude that $M-epsilon > 0$ and $|M-epsilon| < |f(x)|$ ; thus, for all $p>0$, we have $(M-epsilon)^p <= |f(x)|^p $ in interval $I$.

This implies that $(M-epsilon)^n lambda(I) = integral_I (M-epsilon)^n <= integral_I|f(x)|^n$. Moreover, as $I subset (a,b)$, and $|f(x)|>0$, we know $integral_(a,b) |f(x)| >= integral_I |f(x)|$, which implies $(M-epsilon)^n lambda(I) <= integral_(a,b) |f(x)| $.

Thus for all $epsilon$ such that $0<epsilon<W/2$, we found the interval thus that$(M-epsilon)^n lambda(I) <= integral_(a,b) |f(x)|^n $.

== (b)

We are to prove that

$ lim_(p->infinity) (integral |f(x)|^p)^(1/p) = M $

We need this statement that have been proved in previous workshop: for all $a>0$, $lim_(p->infinity) a^(1/p) = 1$.

We have proved that 
$ integral_a^b |f(x)|^p <= M^p (b-a)$;
Thus, 
$ lim_(p->infinity) (integral |f(x)|^p)^(1/p) <= lim_(p->infinity) ((M^p)(b-a))^(1/p) = M lim_(p-> infinity) (b-a)^(1/p) = M $.

We also know that, for all $epsilon > 0$, $ (integral |f(x)|^p)^(1/p) >= (M-epsilon)c^(1/n)$ for certain number $c$. Thus for all $epsilon > 0$, we have $lim_(p->infinity) (integral |f(x)|^p)^(1/p) >= lim_(p->infinity) (M-epsilon)c^(1/p) = M-epsilon$. Thus $lim_(p->infinity) (integral |f(x)|^p)^(1/p) >= M$.

We have shown that $M < lim_(p->infinity) (integral |f(x)|^p)^(1/p) <= M$, which means the limit equals to $M$.


