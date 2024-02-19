#set heading(numbering: "1.")

=== Basic systems
\

#figure(
  image("../assets/unit.png", width: 80%),
  caption: [],
) <fig-unit>

compute E(T) when T $-> infinity $, where E is the error function

==== Big picture of error computation
\

do Laplace transform for this

$e(∞) = lim_"t->∞"e(t)$

and then arrive at this

$f(∞) = lim_"s->0" s F(s)$

expanding

$e(∞) = lim_"s->0" {R(s)[1-T(s)]$

for any function this is the error computation 💡, that is error is computed in function
of starting signal and transfer function.

==== System with feedback
\

==== Computing the error
\

$e(∞) = lim_"s->0" s E(s)$ and $E(s) = R(S)/(1 + G(S))$

thus in this case $G(S) -> ∞$ allows $e(∞) = 0$

==== Looking at the error from multiple input families
\

===== step function as input
\

$e(∞) &= lim_"s->0" s (R(S))/(1+G(S))   && \
  &= (1)/(1+lim_"s->0" G(s))   && \ $

thus we conclude that $e(∞) -> 0 => lim_"s->0" G(S) -> ∞$ , $G(S)$must have at least a _single integrator_

===== saw tooth function as input
\

$e(∞) &= lim_"s->0" s 1/s^2 (1)/(1+G(s)) && \
&= lim_"s->0" s^2 G(S)  && \ $

thus we conclude that , $G(S)$ must have at  least 2 _integrators_

===== parabola function as input
\

$e(∞) &= lim_"s->0" s (1)/(s^3) (1)/(1+G(S))  && \
&= lim_"s->0" s^2 G(S)  && \ $

thus we conclude that $G(S)$ must have at least 3 _integrators_

==== What to analyze to compute error in practice
\

Compute the limit $lim_"s->0" s^n G(S)$ where _n_ refers to number of _integrators_

for instance

  $G(S) = (120(S+2))/((S+3)(S+4)) $ compute the following limits

  - $lim_"s->0" G(S)$ = 20
  - $lim_"s->0" s G(S)$ = 0
  - $lim_"s->0" s^2 G(S)$ = 0

🚨  expect easy computations when doing the tests, if numbers appear "strang" then you're doing something wrong!

💡 error only make sense on stable systems, otherwise analysis is useless

=== Static error constant
\

#math.equation(block:true,
$K_p := e_"step" &= (1)/(1+lim_"s->0" G(S))   && \ $
)
#math.equation(block:true,
$K_r := e_"step" &= (1)/(1+lim_"s->0" s G(S))   && \ $
)

#math.equation(block:true,
$K_a := e_"step" &= (1)/(1+lim_"s->0" s^2 G(S))   && \ $
)

==== The stationary error table 
\


// #table( // TODO: fix this
//   columns: (1fr, auto, auto),
//   inset: 10pt,
//   align: horizon,
//   [],[*Input*], [*Error*], [*Type 0*] , [*Type 1*], [*Type 2*],
//   "Degrau",
//   ,
//   [
//     $h$: degrau \
//     $D$: outer radius \
//     $d$: inner radius
//   ],
//   $ sqrt(2) / 12 a^3 $,
//   [$a$: edge length]
// )


==== Inferences from this classification
\

Suppose  a system has _$K_v$_ = 1000

- System must be stable
- System must be type 1, due to _$K_v$_ is contant
- The input was a sawtooth
- can also compute the error easily

===== A practical problem
\

#figure(
  image("../assets/eu.png", width: 80%),
  caption: [the system],
) <fig-eu>

- $G(S) = (K(S+5))/(S(S+6)(S+7)(S+8)) $
- $e(∞) = 10%$

#math.equation(block:true,
  $ K_p &= lim_"s->0" G(s) => K_p -> ∞ => e_"step" (∞) = 0  && \  $
)

#math.equation(block:true,
  $ K_v = lim_"s _> 0" s G(s) = "CTE" $
)

#math.equation(block:true,
  $ K_a = lim_"S->0" s^2 G(S) = 0 => e_"parabola"(∞) = 0 $
)

🚨 what looks like a 'G(s)' in the diagram is actually 'C(s)'

===== Generic system with feedback
\


#figure(
  image("../assets/generic.png", width: 80%),
  caption: [],
) <fig-generic>

🚨 using _$K_{a,p,v}$_  is only applicable to $G(S$, not $T(S)$

reduces to 

#math.equation(block:true,
  $ (G(S))/(1 + G(S)[H(S) - 1])  $
)
