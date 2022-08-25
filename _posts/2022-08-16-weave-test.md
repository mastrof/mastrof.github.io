<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

# Test Weave.jl with Jekyll

Pellentesque ac est sodales lorem pretium molestie. Suspendisse congue tellus ac pulvinar convallis. Integer mollis egestas augue, quis rutrum tellus faucibus id. Aliquam erat volutpat. Curabitur tristique eu lectus eget laoreet. Integer vitae posuere quam, a scelerisque libero. Nullam suscipit a neque tempor consectetur. Donec aliquam libero eget fermentum sollicitudin. Sed vel convallis ex. Suspendisse eget ante erat. Sed ligula felis, vestibulum vitae gravida vel, efficitur sit amet lorem. 

Code block and figure
```julia
using Plots
x = range(0, 2π; length=1024)
plot(x, sinc.(x), lw=3, lab=false)
```

![](/assets/2022-08-16-weave-test_1_1.png)



Some text, greek letters: αβγ

Math: inline mode (`$$`) $$f(x) = \alpha_0 \exp(- x^2/(2\sigma^2))$$ 

display mode (`\$$`):
\$$
    F = m\dfrac{\text{d}v}{\text{d}t}
\$$


Second code block and figure
```julia
plot(x, [sin.(x) sin.(2 .* x)], lw=3, lab=false)
```

![](/assets/2022-08-16-weave-test_2_1.png)
