---
title: "Find all the integers equal to twice the sum of their digits"
tags: "math easy-problems"
---


<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

## Problem statement
Find all the integer numbers equal to twice the sum of their digits.


## Solution #1
Any integer number can be written as the sum of its digits times the
appropriate power of $$10$$. \
Let $$ a_n \in [0,9] \subset \mathbb{N} $$ be the digits of a number, where
subscript $$n$$ represents the $$n$$-th digit.
Then any $$N$$-digit number, $$A_N$$, can be expressed as
\$$
    A_N = \sum_{n=1}^N 10^{n-1} a_n = a_1 + 10a_2 + \ldots + 10^{N-1}a_N.
\$$

The condition that $$A_N$$ is equal to twice the sum of its digits can be
expressed as 
\$$
    \sum_{n=1}^N 10^{n-1} a_n = 2 \sum_{n=1}^N a_n
\$$
which is equivalent to
\$$
    a_1 = \sum_{n=2}^N (10^{n-1}-2) a_n.
\$$
For any $$n>2$$ we have $$10^{n-1}-2 > 9$$ unless $$a_n = 0$$, which implies
that there is no $$N>2$$-digit number that can satisfy the requested
conditions.
In other words, only 2-digit numbers ($$N=2$$) can be equal to twice the
sum of their digits.

With $$N=2$$ the equality simplifies to
\$$
    \begin{align}
         & a_1 + 10a_2 = 2a_1 + 2a_2 \newline
        \Rightarrow \; & a_1 = 8a_2
    \end{align}
\$$
whose only acceptable solution is $$a_2 = 1$$, $$a_1 = 8$$, i.e., there is
only a single integer number that is equal to twice the sum of its digits,
and that number is $$18$$.

A simple numerical check can confirm that, for any given number $$A$$,
the sum of its digits grows much slower than $$A$$ itself, and there is
only one solution to the problem.

```julia
    A = 1:100
    y = @. 2 * sum(digits(A))
    sol = findall(A .== y)
```

```
1-element Vector{Int64}:
 18
```



```julia
    using Plots
    plot(A, A, lw = 3,
        xlabel = "A",
        label = "A",
        legend = :topleft, legendfontsize = 10,
        bgcolorlegend = :transparent,
        scale = :log10,
    )
    scatter!(A, y,
        m = :c, ms = 3, msw = 0,
        lab = "2*digitsum(A)"
    )

    scatter!(A[sol], y[sol],
        m = :r, ms = 6, msw = 0,
        lab = "solution"
    )
```

![](/assets/2022-08-26-integer-twice-sum-digits_2_1.png)
