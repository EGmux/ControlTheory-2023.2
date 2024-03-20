#set heading(numbering: "1.")
=== 1. Pede-se para calcular *$V_o(s)/V(s)$*

#figure(image("assets/2024-03-19-16-51-41.png", width: 80%)) <fig-2024-03-19-16-51-41>

Aplicando análise nodal, temos

#math.equation(block: true, $1.  & (V-V_i)/R = V_i/(1/(s C)) + V_o/(1/(s C)) \
1.1 & (V-V_i)/R = (s C)V_i + (s C)V_o $)

#math.equation(block: true, $2.  & V_o/(1/(s C)) = (V_i - V_o)/(s L) \
2.1 & (s C)V_o = (V_i - V_o)/(s L) \ $)

e isolando *$V_i$* temos

#math.equation(block: true, $3. V_i = V_o (1 + s^2 C L) $)

e substituindo 3 em 1.1

#math.equation(block: true, $ 4.  & (V - V_i) = (s C R)(V_i + V_o) \
4.2 & V = (s C R)(V_i + V_o) + V_i \
4.3 & V = V_i (1 + s C R)+ V_o (s C R) \
4.4 & V = (V_o (1 + s^2 C L)) (1 + s C R)+ V_o (s C R) \
4.5 & V = V_o (1 + s C R + s^2 C L + s^3 C^2 R L + s C R)\
4.6 & V = V_o (1 + 2 s C R + s^2 C L + s^3 C^2 R L)\
4.7 & V_o/V_s =1/ (1 + 2 s C R + s^2 C L + s^3 C^2 R L)\ $)

=== 2. Equação estado espaço

#figure(image("assets/2024-03-19-17-56-17.png", width: 50%)) <fig-2024-03-19-17-56-17>

Como temos dois componentes de circuitos reativos então será necessário 2
variáveis de estado espaço.

#math.equation(block: true, $ X = mat(i_l;v_c) $)

e temos as seguintes relações

#math.equation(block: true, $1. & (v - v_l) = i_l + (v_l - v_c) \
2. & (v_l - v_c) = c (d v_c)/(d t) \ $)

note que via substituição podemos isolar $v_l$ em 2 e substitutir em 1 de tal
forma que 1 fica em função da entrada e $v_c$ que é variável de estado.

#math.equation(
  block: true, $3.   & v_l = accent(v_c, .)+v_c\
  3.1. & (v - ( accent(v_c, .) + v_c)) = i_l + (( accent(v_c, .) + v_c) - v_c) \
  3.2. & (v - ( accent(v_c, .) + v_c)) = i_l + accent(v_c, .) \
  3.3. & v - v_c - i_l =2 accent(v_c, .) \
  3.4. & accent(v_c, .) = i_l (-1/2) + v_c (-1/2) + v(1/2) \ $,
)

e como *$accent(i_l, .) = v_l $*, temos

#math.equation(
  block: true, $4.1 & accent(i_l, .) = ( i_l (-1/2) + v_c (-1/2) + v(1/2)) + v_c \
  4.2 & accent(i_l, .) = i_l (-1/2) + v_c (1/2) + v(1/2) \ $,
)

e teremos portanto a seguinte representação matricial.

#math.equation(
  block: true, $ mat(accent(i_l, .);accent(v_c, .)) = mat(-1/2, 1/2;-1/2, -1/2)mat(i_l;v_c) + mat(1/2;1/2)v(t) $,
)

e para saída *$v_o$* que é $v_o = v_c$, temos

#math.equation(block: true, $ y = v_o = v_c = mat(0, 1)mat(i_l;v_c) $)

=== 3. Função de transferência para equaçã estado espaço

#figure(image("assets/2024-03-19-18-28-23.png", width: 50%)) <fig-2024-03-19-18-28-23>

lembrar que é necessário tratar primeiro da função de transferência com
numerador 1 isto é em dois blocos onde o primeiro tem a seguinte função de
transferência
#math.equation(block: true, $ 1.   & Y(s)/R(s) = 1/(s^3 + 3s^2 + 3s + 1) \
1.1. & Y(s)(s^3 + 3s^2 + 3s +1) = R(s) \
1.2. & (d y^3)/(d t) + 3 (d y^2)/(d t) + 3 (d y^1)/(d t) + y = r \ $)

aplicando o seguinte mapeamento para as variáveis de estado

#math.equation(
  block: true, $   & y = x_1,\
    & (d y^1)/(d t) = x_2 = accent(x_1, .) \
    & (d y^2)/(d t) = x_3 = accent(x_2, .) \
    & (d y^3)/(d t) = x_4 = accent(x_3, .) = r - (3(d y^2)/(d t) + 3 (d y^1)/(d t) + y) = r - (3x_3 + 3 x_2 + x_1)\ $,
)

assumindo r como entrada, temos portanto a seguinte representação matricial

#math.equation(
  block: true, $ mat(accent(x_1, .);accent(x_2, .);accent(x_3, .)) = mat(0, 1, 0;0, 0, 1;-1, -3, -3)mat(x_1;x_2;x_3) + mat(0;0;1)r $,
)

temos agora a seguinte função de transferência, onde $Y(s)$ é a entrada

#math.equation(block: true, $2.   & C(s)/Y(s) = 2s + 1 \
2.1. & c = 2 (d y^1)/(d t) + y \
2.2  & c = 2x_2 + x_1\ $)

e portanto a saída é

#math.equation(block: true, $ c(t) = mat(1, 2)mat(x_1;x_2) $)

=== Conversão de estado espaço para função transferencia

#figure(image("assets/2024-03-19-18-50-56.png", width: 80%)) <fig-2024-03-19-18-50-56>

para chegar na formula desejada lembremos que a equação estado espaço e da forma
e aplicando a transformada de Laplace temos

#math.equation(block: true, $   & accent(X, .) = A X + B U\
  & Y = C X + D U =>\
  & s X = A X + B U \
  & Y = C X + D U \ $)
vamos isolar X

#math.equation(block: true, $   & X (I s - A) = B U \
  & X = (I s - A)^(-1) B U \
  & Y = C((I s - A)^(-1) B U) + D U \
  & Y/U = C(I s - A)^(-1) B + D\ $)

temos então
#math.equation(
  block: true, $1. & I s = mat(s, 0, 0;0, s, 0;0, 0, s) \
  2. & A = mat(0, 1, 0;0, 0, 1;-3, -2, -5) \
  3. & I s - A = mat(s, -1, 0;0, s, -1;3, 2, s+5) \
  4. & C(I s - A)^(-1)B = mat(1, 0, 0)mat(
    +mat(s, -1;2, s+5) -mat(-1, 0;2, s+5)+mat(-1, 0;s, -1);-mat(0, -1;3, s+5)+mat(s, 0;3, s+5)-mat(s, 0;0, -1);+mat(0, s;3, 2)-mat(s, -1;3, 2)+mat(s, -1;0, s)
  )mat(0;0;10) \ $,
)
note que apenas a linha 1 da matriz não é nula e mais ainda que apenas o último
termo de tal linha é não nulo, logo temos $10mat(-1, 0;s, -1)/det(I s - A)^(-1)$
e daí para calcular determinante, temos que

#math.equation(
  block: true, $ det(I s - A)^(-1) = s mat(delim: "|", s, -1;2, s+5) - (-1)mat(delim: "|", 0, -1;3, s+5) = s(s^2+5s+2) - (-1)(3) = (s^3+5s^2+2s +3) $,
)

e portanto a função transferência é:

#math.equation(block: true, $ Y/U = 10/(s^3+5s^2+2s+3) $)

=== 4. Considere um sistema de segunda ordem subamortecido com tempo de pico $T_p$ de 1s e tempo de acomodação $T_s$ de 1s. Apresente os polos do sistema que tem esses tempo de pico de acomodação.

