// Import, "macros", etc

#import "@preview/ctheorems:1.0.0": *
#show: thmrules

#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)

#set math.equation(numbering: "(1)")

#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    )
  } else {
    // Other references as usual.
    it
  }
}
 
// Beginning of Document

= Question 5

We are here to show that, the series of function $f_n: [0, oo] -> RR$ defined by

$ f_n (x) = x^n/(1+x^n) $ <eq5>

converges pointwise and not uniformly to the function. 

$ f(x) = cases(
0 "if" 0<=x<1,
1/2 "if" x = 1,
1 "if" x > 1
) $

In particular, function @eq5 is uniformly convergent in any interval $[0, a]$ for $0<a<1$, and not otherwise.

#proof[ * We shall first prove that the @eq5 converge point-wise on $RR$. *

Case 1: $x = 0$. In this case $f_n (x) = 0$ for all $n$.

Case 2: $0<x<1$. For all $epsilon > 0$ and $x > 0$, let $N = display(ceil(ln(epsilon)/ln(x)))$. For all $n > N$ we have 

$ x^n/(1+x^n) < x^n/1 <= x^(ln(epsilon)/ln(x)) = epsilon $. 

This is the definition of pointwise convergence $f$.

Case 3: $x = 1$. In such case we have $f_n (x) = 1/2$ for all $n$.

Case 4: $x > 1$. For all $epsilon > 0$ and $x>0$, pick $N = display(ceil(ln(1/epsilon)/ln(x)))$. Thus, for all $n > N$, we have
$x^n >= 1/(epsilon) ==> 1/x^n <= epsilon ==> 1- x^n/(1+x^n) = 1/(1+x^n) < 1/x^n <= epsilon$. Note, $f_n > 0$ for all $x, n$, thus we conclude that
$|1-x^n/(1+x^n)|< epsilon$. 

* Next, we show that series of function @eq5 converges uniformly in interval $[0, a]$, where $0<a<1$, and not otherwise. *

First, notice that all $f_n$ are differentiable. Differentiate $f_n$ respect to $x$, we get $f'_n  = (n x^(n-1))/(1+x^n)^2$, which is greater than 0 for all $x > 0$ and $n > 0$. Thus, we conclude that all $f_n$ are increasing in their domain.

For all $x in [0, 1)$, pick $m = (x+1)/2$, note $x<m<1$. For all $epsilon$, let $N = display(ceil(ln(epsilon)/ln(m)))$. For all $n > N$, we have
$ x^n/(1+x^n) < m^n/(1+m^n) < m^n/1 <= m^(ln(epsilon)/ln(m)) = epsilon $. 

And we have proved $f_n$ uniformly converges for $x in [0, 1)$, that is, it converges for $x$ in the interval $[0, a)$, where $0<a<1$.

Next, we are to prove that $f_n$ does not converge uniformly in the interval $[0, 1]$; thus, it does not converge for any interval $[0, a]$, where $a>=1$.

Let $epsilon = 1/4$. For all $n > 0$, let $x = 0.5^n$. Thus, $f_n (x) = 1/3 > 1/4$: contradiction the defintion of uniform convergence.  ]

#pagebreak(weak: true)

= Question 7 

$f_n: RR -> RR$ is a sequence of continuous function that converge uniformly to $f$. $(x_n)$ is sequence of real number that converges to $x$, we are to prove that $f_n (x_n) -> f(x)$.

#proof[
$f_n (x_n) -> f(x)$, is to say that $forall epsilon, exists N$ such that $forall n > N, |f_n (x_n) - f(x)| < epsilon$.

Pick any $epsilon > 0$. Choose $N_1$ guaranteed by uniform convergence of $f_n$ such that $forall n>N_1$, $|f_n (x) - f(x)| < epsilon/2$.

For each $n > N_1$, as $f_n$ is continuous, we may pick an $delta$ such that $forall x' in RR $ and $|x' - x| < delta$, we have $|f_n (x') - f_n (x)| < epsilon/2$. 

Since $(x_n)$ converges to $x$, there exist $N_2$ such that for all $n>N_2$, $|x_n-x|<delta$. 

Let $N$ be the greator of $N_1$ and $N_2$. Thus, for all $n > N$, $|x_n-x|<delta ==> |f_n (x_n) - f_n (x)| < epsilon/2$. 
Moreover, $|f_n (x) - f(x)| < epsilon/2$. By triangular inequality $|f_n (x_n) - f(x)| < epsilon$, as desired.
]
