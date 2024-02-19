#set heading(numbering: "1.")
= Why do this?
== Better Complexity analysis
Whenever a system is analysed complexity must be the minimum required,by
reducing multiple systems into a "big one" is easier to analyze, such pattern is
called reduction, and that is achieved by reducing each transfer function to a
single transfer function 📔\
\
_💡 is that the big system is equivalent to the smaller ones_

=== The Block Diagram aprroach

#figure(
  image("../assets/blockDiagram.png", width: 80%), caption: [A block diagram],
) <fig-blockdiagram>
#cite(<cabm>)

#figure(
  image("../assets/subsystems.png", width: 80%), caption: [A subsystem and it reduction to the equivalent transfer function],
) <fig-subsystems>
#cite(<cabm>)

=== How to deal with parallel/series subsystems blocks

#figure(
  image("../assets/pa.png", width: 80%), caption: [Parallel and series cases],
) <fig-pa>
==== Parallel
if the current block is a parallel , do this, assuming each G(s) to be the
transfer function

- For each ramification add to a term and multiply by the input
*i.e*: X(s) = $(R(s)G_1(s),R(s)G_2(s),R(s)G_3(s))$ -> $C(s) = [plus.minus G_1(s)plus.minus G_2(s) plus.minus G_3(s)]R(s)$

_Note that transfer function is $Y(s)/X(s)=F(s)$, thus Y(S) $=$ C(s) $=$ X(s)
consequently by factoring the common terms we obtain the above expression_

==== Series

- Just sum each transfer function

==== Dealing with feedback

#figure(
  image("../assets/plant.png", width: 80%), caption: [Dealing with feedback],
) <fig-plant>
#cite(<cabm>)

=== Trick cases

Note that any subystem the same way it can be reduced we can also do the inverse
and decompose it

_Sometimes the decomposition is not obvious:_

Suppose a system with *n-inputs* exists, then some of the input has a transfer
function connected to it, other's don't well the topology changed! We might have
something like the following equation shows

#math.equation(block: true, $ sum_(i) G_i(s)R_i(s) plus.minus X_i(s) $)
note that can also be rewritten as
#math.equation(block: true, $ sum_(i) (G_i(s)R_i(s) plus.minus X_i(s)/G_i(s))G_i(s) $)
*That is equivalent to each input without a transfer function having the $1/G_(s)$ as
transfer function*

#figure(image("../assets/bloc.png", width: 80%), caption: [A tricky system]) <fig-bloc>
#cite(<cabm>)

_ 💡 is that input shouldn't be modified only the transfer functions should be
manipulated_

=== Even trickier case

Now consider the case where the system is a n-bifurcation of a single input, $R(s)$ for
instance

_So to analyze with easy is better to see each branch as a non modified branch,
if you were to put the $G(s)$ in the starting point, each branch would have to
be adapted to not be affected by the transfer function, thus a $1/G(s)$ T.F
would be needed to preserve the final behavior_

#figure(image("../assets/tryick.png", width: 80%), caption: [Very trick case]) <fig-tryick>
#cite(<cabm>)

=== The trickiest case

Now consider a starting point with a block and bifurcations without block,
ignore the bifurcation what would you expect?

_ 💡 note that after passing through the block the bifurcation point is
essentially $C(s)$ thus each ramification s essentially $C(s)$ appearing more
than once_

#math.equation(block: true, $ C(s)/R(s) = G(s)$)

#figure(
  image("../assets/trioek.png", width: 80%), caption: [A multibranch subystem],
) <fig-trioek>
#cite(<cabm>)

=== Challenger 1

#figure(
  image("../assets/abigsystem.png", width: 80%), caption: [A really big system],
) <fig-abigsystem>
#cite(<cabm>)

So where to start with this beast of a system 😱?

_ 💡 back to basics: parallel, series and feeback_

- Note that the region next to $C(s)$ is effectively a series reduction of $G_2(s),G_3(s)$

#math.equation(block: true, $ G_a(s) = G_2(s)+G_3(s) $)

- Consider now two possibilities either a parallel or feedback, what to choose 🤔?

*It's wrong to assume multiple feedback reductions exist! So we can only choose
the parallel*

_ For a feedback consider the block signal to be the negative of what is
currently showing_

#math.equation(block: true, $ H_a(s) = [H_3(s)-H_2(s)+H_1(s)] $)

- Combining with our previous reduction:

#math.equation(block: true, $ D_a(s) = G(s)/(1+H_a(s)G(s)) $)

- To end we sum with $G_1(s)$

#math.equation(block: true, $ F_a(s) = G_1(s)D_a (s) $)

_Note: we use \* because that's the sink operator, could be a + as well, really
depedent on the system behavior_

=== Challenger 2

Now consider the below system

#figure(
  image("../assets/syste2.png", width: 80%), caption: [A very complicated system],
) <fig-syste2>

_We need to find a starting point, note that the middle is very hard_

- Consider the rightmost side, apply feedback strategy

#math.equation(block: true, $ D_a (s) =(G_3(s))/(1+G_3(s)H_3(s)) $)

- Now we have a connection from $(V_4(s),V_3(s))->D_a (s)$ but they are not in
  parallel

_ 💡 because the process is non linear we now need to look at the middle point and
try to find a reduction_

- Note that $V_3(s)$ has an "annoying" connection that make it hard to analyze, we
  could put in the the right and do some manipulations to mantain the equivalence

  *to do so note that would imply $V_4(s)=V_3(s)G_2(s)$ to compensate we multiply
  the new connection with the TF $1/G_2(s)$*

  - Now we could apply the parallel strategy to deal with $1/G_2(s),V_4(s)$ and
    remove another annoying wire

#figure(
  image("../assets/checkpoint.png", width: 80%), caption: [What we currently have],
) <fig-checkpoint>
#cite(<cabm>)

#math.equation(block: true, $ D_b (s) = 1/G_2(s) + V_4(s) $)

_ 💡 note that techinnically each section of the system is being dealt separately,
whenever a section becomes a block we go to the immediatelly left block_

*_💡 😱 note that the output of each subsystem is being ignored, not the input
though!_*

- Now we move $G_1(s)$ inside the feedback to it's right, by doing this a direct
  connection between $V_1(s),V_2(s)$ will appear and we can apply the parallel
  strategy.

*This stuff is trick notice that by moving $G_1(s)$ we have to deal with two
branches at the same time, now ask this question, if you had a single branch
what would you do?*

- Suppose we had only $G_2(s)$ then $G_1(s)$ would be multiplying it, notice that $V_1(s)$ is
  the input in this case that by multipying $G_1(s)$ give us $V_2(s)$, thus we
  deduce that

#math.equation(block: true, $ V_4(s) = V_2(s)G_2(s)$)

#math.equation(block: true, $ V_4(s) = G_1(s)V_1(s)G_2(s) $)

_We mantain $V_1(s)$, thun we only need to multiply by $G_1(s)$_

-For the other connection we see a case of the previous, thus we divide by $G_1(s)$

#math.equation(block: true, $ sum_(i) (G_i(s)R_i(s) plus.minus X_i(s)/G_i(s))G_i(s) $)

#bibliography("./bibliography.bib")
