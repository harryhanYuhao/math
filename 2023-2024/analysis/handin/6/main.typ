= Question #4

We are to prove that the function $f(x) = 1/x$ on $[a, infinity)$, where $a>0$, converge uniformly.

That is, for all $epsilon > 0$, there exists $delta = a^2 epsilon$, such that, for all $x in [a, infinity)$

$ |x-a|<delta ==> |x-a| < a^2 epsilon < underbrace(|x a|  epsilon, |x a| > a^2) ==> abs(1/x - 1/a) = abs((a-x)/(x a)) = abs((a-x)) / (abs(x a)) < epsilon $

And we are done.

= Question 7

We are to prove that a function $f$ is uniformly continuous in interval $I$ if and only if whenever $s_n, t_n in I$, we have $|s_n - t_n| -> 0 ==> |f(s_n) - f(t_n)| -> 0$.

== Forward Direction

For a uniformly continous function $f$, we want to prove that for all $epsilon$, there exist $N$ such that $n>N ==> |f(s_n) - f(t_n)| < epsilon$, provided $|s_n - t_n| -> 0$.

Since $f$ is uniformly convergent, for the same $epsilon$, we are guarenteed to have $delta > 0$ such that $|x-y| < delta ==> |f(x) - f(y)| < epsilon$. 

Moreover, as $|s_n - t_n| -> 0$, we know that there is $N'$ such that for all $n > N', |s_n - t_n| < delta$. Let $N = N'$, and we have 

$n>N' ==> |s_n - t_n| < delta ==> |f(s_n) - f(t_n)| < epsilon$ and we are done.

== Backwards Direction

We shall prove the backwards direction by contrapositive.

Assuming the function $f$ is not uniformly continuous; i.e., there exists $epsilon$ such that for all $ delta > 0$, there exist $s, t in DD$ such that $|s - t| < delta$ and $|f(s) - f(t)| >= epsilon$. 

Let us construct sequence $s_n$ and $t_n$ thus:

For the given $epsilon$, we know that, for $delta  = 1$, we have $s_1, t_1$ such that $|s_1 - t_1| < 1$ and $|f(s_1) - f(t_1)| >= epsilon$. 
For $delta  = 1/10$, we have $s_2, t_2$ such that $|s_2 - t_2| < 1/10$ and $|f(s_2) - f(t_2)| >= epsilon$, and so on. 

Let $s_n, t_n$ be the number guarenteed by the given $epsilon$ with $delta = 1/10^(n-1)$; i.e., $|s_n - t_n| < 1/10^(n-1)$ while $|f(s_n) - f(t_n)| >= epsilon$.

Obviously $|s_n - t_n| -> 0$ and $|f(s_n) - f(t_n)| $ does not. And we have proved the backwards direction.

