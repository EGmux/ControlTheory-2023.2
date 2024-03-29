#set heading(numbering: "1.")

exp1:
#math.equation(block: true, $ (k(S^2 - 4S + 20))/((S+2)(S+4)) $)

#figure(image("../assets/exp1.png", width: 80%), caption: []) <fig-exp1>

transform the system to type 1

but the root locus changes, rework will be needed

=== how it works
\

Given a system, create a compensator such that

- root locus is somewhat preserved
- performance characteristics are preserved
- improve the stationary state error
- improve transient respones, $T_p, T_s$

==== 2nd order subsystem representation
\

#math.equation(block: true, $ G(S) = (w_n^2)/(S^2 + 2 zeta w_n + w_n^2) $)
#math.equation(block: true, $ S_"1,2" = zeta W_n + j W_n root(2, 1-zeta^2) $)

==== type of compensators
\

===== improvement in response
\
- PI
#math.equation(block: true, $ G_"PI" = (S+z)/(S) "where z is close to origin"$)
- forward phase (LEAD)

===== improvement in error and response
\
- PID
- LEAD-LAG

💡 what it means to add a pole in the origin?

#math.equation(
  block: true, $ theta_p = Sigma(angle.acute("zeros")) - Sigma(angle.acute"poles") $,
)
#math.equation(block: true, $ theta_p_2 = theta_p - (angle.acute(o)) $)

💡 place an approximate zero to the origin, won't change the root locus that
much, note that the integrator can be seem as pole in the origin

