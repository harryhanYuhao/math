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

= Question 3

We have $S = sum_(n=0)^(infinity) (-1)^(n)x^(2n+1) / (2n+1)! =x - x^3/3! + x^5/5! + dots.h.c$. Define $C := S'$.

We have shown that the Interval of convergence of $S$ is $RR$, thus the interval of convergence of $C$ and $C'$ are also $RR$. 

Notice $C = S' = sum_(n=0)^(infinity) (-1)^n x^(2n)/(2n!)$, and $C' = sum_(n=1)^(infinity) (-1)^n x^(2n-1)/(2n-1)! = -S$. 

Let $f = C^2 + S^2$. Notice

$ f' = 2 C C ' + 2 S S' =-2 C S + 2 S C = 0 $

Thus $f$ is a constant function. Plugin $x = 0$ we find $f(0) = 1$. Thus we conclude that $f(x) = 1$ for all $x in RR$.

Moreover, since $S$ and $C$ have codomain in $RR$, $S^2 > 0$ and $C^2 > 0$. If $|S|>1$ or $|C|>1$ for certain $x$, clearly $S^2 + C^2 > 1$. This is a contradiction and we conclude that $|S| <= 1$  and $|C| <= 1$.

= Question 5

== $S > 0$ When $0 < x < sqrt(6)$

Rewrite $S$ in the following way:

$ S = x(1 - x^2/3!) + x^5(1/5! - x^2/7!) + dots.h.c = sum_(n=0)^(infinity) x^(4n+1)(1/(4n+1)! - x^2/(4n+3)!) $ <sin>

For $x<sqrt(6)$ and $n >= 0$, we have:

$ 1 >= (2 dot 3) / ((4n+2) dot (4n+3)) ==> 1 >= (x^2) / ((4n) dot (4n+2)) ==>  (1/(4n+1)! - x^2/(4n+3)!) > 0 $

Provided $0<x$, each $x^(4n+1)$ are also positive; thus, for $0 < x < sqrt(6)$ we have each term of the summation @sin being positive, and $S>0$.

== $C >0$ when $0 < x < sqrt(2)$

Rewrite $C$ in the following way:

$ C = (1 - x^2/2!) + x^4(1/4! - x^2/6!) + dots.h.c = sum_(n=0)^(infinity) x^(4n)(1/(4n)! - x^2/(4n+2)!) $ <cos>

For $x<sqrt(2)$ and $n >= 0$, we have:

$ 1 >= (1 dot 2) / ((4n) dot (4n+2)) ==> 1 >= (x^2) / ((4n) dot (4n+2)) ==> (1/(4n)! - x^2/(4n+2)!) > 0 $

Provided $0<x$, each $x^(4n)$ are also positive; thus, for $0 < x < sqrt(2)$ we have each term of the summation @cos being positive, and $C>0$.

