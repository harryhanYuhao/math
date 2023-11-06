= Exercise 1

We know $A = mat(3, 4; 4, 0)$

== (i)

=== (a)

By GS, we have $Q_1 = display(mat(3/5, 4/5; 4/5, -3/5))$ and $R_1 = display(mat(5, 12/5; 0, 16/5))$. (Details of computation in next page)

=== (b)

By householder algorithm, we have $Q_2 = display(mat(-3/5, -4/5; -4/5, 3/5))$ and $R_2 = display(mat(-5, -12/5; 0, -16/5))$. (Details of computation in next page)

== (ii) 

Notice $Q_1 = -Q_2$ and $R_1 = -R_2$. They spans the same vector field and $Q_1 R_1 = Q_2 R_2$

== (iii)

GS algorithm always gives non-negative diagonal entries for $R$, as each $r_(i i)$ are assigned to the value $||q_j||_2$, which is always non-negative.

== (iv)

Algorithm QR does not always give non-negative diagonal entries for $R$. As shown in (i.b), we find that QR gives negative diagonal entries.
