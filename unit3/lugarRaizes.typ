#set heading(numbering: "1.")

=== Root locus
\

Every pole of a system whenever we want a specific gain

#figure(image("../assets/rootMethod.png", width: 80%), caption: []) <fig-rootmethod>

=== Definition
\

- for k between the poles and zero, it is guaranteed to be stable
- for k above zero, unstable
- for k equal to zero , marginally stable

=== Scratch
\

==== Symmetry
\

==== num of branches
\

==== segmentation
\

==== start/end
\

==== asymptotic behavior
\

==== Refining the scratchwork
\

#math.equation(block: true, $ T(S) = ()/(1+K G(S)H(S)) $)

#math.equation(block: true, $ 1 + K G(S)H(S) = 0 $)
#math.equation(block: true, $ K = (-1)/(G(S)H(S)) $)

then derive

#math.equation(block: true, $ ("dK")/("dS") = 0 $)

🚨 to classify a point, check if between zeros or poles

==== intersection with imag axis
\

because the poles are located in the left semiplane the intersection tells the
region where the system operation is stable, such point would be in the boundary

for instance

#math.equation(block: true, $ T(S) = (K(S+3))/(S^4+7S^3+14S^2+(8+k)S + 3K) $)

then create the Routh-Hurwitz table

#table(
  columns: (1fr, auto, auto, auto), inset: 10pt, align: horizon, [], [], [], [], $s^4$, $ 1$, "14", "3k", "s^3", "7", $8+k$, "0", "s^2", "90-k", "21k", "0", "s^1", $(-k^2-65k + 72)/(""-k)$, "0", "0", "s^0", "21+k", "0", "0",
)
k = 9,65

