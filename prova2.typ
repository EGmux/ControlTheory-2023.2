#set heading(numbering: "1.")

=== 1. Reduza o sistema abaixo para um único bloco

#figure(image("assets/2024-03-19-20-59-17.png", width: 80%)) <fig-2024-03-19-20-59-17>

#figure(image("assets/2024-03-19-21-08-59.png", width: 80%)) <fig-2024-03-19-21-08-59>

para o seguinte diagrama de blocos a redução pode ser computada algebricamente
como

#math.equation(block: true, $ 1. & R - A = B \
2. & B G = C \
3. & C H = A \ $)

substituindo 3 em 1 e 1 em 2, temos

#math.equation(block: true, $
  1. & (R - C H)G = C \
  2. & R G - C H G = C \
  3. & R G = C + C H G \
  3. & R G = C(1 + H G) \
  3. & R G/(1 + H G) = C \
$)

#figure(image("assets/2024-03-19-21-21-37.png", width: 80%)) <fig-2024-03-19-21-21-37>

para o diagrama de blocos acima, temos

#math.equation(block: true, $1. & R A = B && \
2. & B D = C && \ $)

substituindo 1 em 2, temos

#math.equation(block: true, $ 1. & (R A)D = C \
2. & R (A D) = C \
2. & R E = C \ $)

#figure(image("assets/2024-03-19-21-24-54.png", width: 80%)) <fig-2024-03-19-21-24-54>

note que temos as seguintes relações algébricas entre os blocos

#math.equation(block: true, $ 1. & R A = D \
2. & R B = F \
3. & D + F = C \ $)

logo substituindo 1 e 2 em 3, temos

#math.equation(block: true, $1. R A + R B = C \
2. R (A + B) = C \
2. R E = C \ $)

#figure(image("assets/2024-03-19-21-38-47.png", width: 80%)) <fig-2024-03-19-21-38-47>

note que se movermos o ponto de bifurcação entre $G_3$ e c para o ponto
imediatamente depois de $G_2$ o problema fica mais simples de resolver.

para fazermos isso é necessário preservar a entrada de $H_2$ que é $c$, e $c = B G_3$ tal
que $B$ seja saída de $G_2$.\
Ao movermos o ramo então teremos $B$ como valor, mas precisamos de $B G_3$ então
devemos multplicar por $G_3$, daí teremos o seguinte diagrama que multiplica $H_2$ e
como blocos em série são multplicados teremos $G_3H_2$ agora podemos simplificar
o ponto de soma, que está com alimentação negativa envolvendo $G_3 H_2 $ e $G_2$ assim
obtemos esse bloco $G_2/(1+G_2G_3H_2)$ agora temos $G_1$ em série como esse
bloco o que nos dá $(G_1G_2)/(1+G_2G_3H_2)$\
agora podemos temos outro caso de feedback e nesse caso teremos.

#math.equation(block: true, $ 1. & R + F = E \
2. & E G = C \
3. & C H =F \ $)

substituindo 3 em 1 e 1 em 2, temos

#math.equation(block: true, $1. & R + C H = E \
2. & (R + C H)G = C \
2. & R G = C(1 - H G) \
2. & R G/(1 - H G) = C \ $)
logo substituindo G por $(G_1G_2)/(1 + G_2G_3H_2)$ e $H = H_1$ temos $(G_1G_2)/(1+G_2G_3H_2)/(1-H_1((G_1G_2)/(1+G_2G_3H_2)))$ e
simplificando, temos

#math.equation(block: true, $ (G_1G_2)/(1+G_2G_3H_2 - H_1G_1G_2) $)

novamente temos ainda um bloco em série multiplicamos e obtemos
*$(G_1G_2G_3)/(1+G_2G_3H_2 - H_1G_1G_2)$*

e agora temos um único bloco e alimentação negativa, podemos considerar um bloco
unitário que não muda a entrada e fazendo as derivações obtemos

#math.equation(block: true, $1. & R - F = E \
2. & E G = C \
3. & C = F \ $)

daí substituindo, temos

#math.equation(block: true, $1 . & (R - C) = E \
2 . & (R - C)G = C\
3 . & R G/(1 + G) = C\ $)
logo o bloco final é *$(G_1G_2G_3)/(1+G_2G_3H_2-H_1G_1G_2 + G_1G_2G_3)$*

=== 2. Ache função transferência utilizando regra de Mason

#figure(image("assets/2024-03-19-22-01-33.png", width: 80%)) <fig-2024-03-19-22-01-33>

Primeiramente vamos encontrar os ganhos dos caminhos que vão de R até C que são
caminhos hamiltonianos.

#math.equation(block: true, $ 1. & G_1G_2G_3 \ $)

agora vamos encontrar todos os loop que não se tocam temos
#math.equation(block: true, $1. & G_1G_2H_1 \
2. & G_2G_3H_2 \
3. & G_1G_2G_3\ $)

não há loops 2 a dois que não se tocam, logo agora devemos computar o cofator
dos caminhos hamiltonianos existentes, como só temos um único só teremos um
único cofator , note que os loops isolados não existem, pois todos os vértices
do grafo se encontram no caminho hamiltoniano em questão, logo o cofator deverá
ser 1.

agora podemos computar com a regra de Mason a função transferência desejada

#math.equation(block: true, $ C(s)/R(s) = Sigma^n_k (P_k Delta_k)/Delta $)

com n =1, temos portanto
#math.equation(
  block: true, $ (P_1 Delta_1)/Delta = (G_1G_2G_3)/(1-(G_1G_2H_1+G_2G_3H_2+G_1G_2G_3)) $,
)

=== 3. Ache a representação de fluxo de sinal dada as equações estado espaço

#figure(image("assets/2024-03-19-23-02-35.png", width: 80%)) <fig-2024-03-19-23-02-35>

note que estado espaço é no domínio do tempo, mas fluxo de sinal é no domínio da
frequência, então precisamos aplicar transformada de Laplace.

#math.equation(block: true, $ 1. & s X_1 = X_1 + 2X_2 \
2. & s X_2 = 2X_2 + X_3 \
3. & s X_3 = -2X_3 + R \
3. & Y = X_1 + X_2 $)

portanto temos as seguintes funções transferências/ganhos

#figure(image("assets/2024-03-19-23-22-06.png", width: 80%)) <fig-2024-03-19-23-22-06>

=== 4. Dada a função transferência abaixo discurse sobre a estabilidade ou instabilidade do sistema

#figure(image("assets/2024-03-19-23-24-26.png", width: 80%)) <fig-2024-03-19-23-24-26>

Vamos fazer uso da tabela de Routh-Hurwitz para verificar a estabilidade do
sistema que tem T como função de transferencia

#math.equation(
  block: true, $ #table(
    columns: (30pt, auto, auto, auto,), inset: 10pt, align: horizon, $s^5$, $1$, $3$, $3$, $s^4$, $1$, $1$, $2$, $s^4$, $2$, $1$, $0$, $s^2$, $1/2$, $2$, $0$, $s^1$, $-7$, $0$, $0$, $s^0$, $2$, $0$, $0$,

  ) $,
)

note que como houve mudança de sinal de $s^2$ para $s^1$ então existe a presença
de dois polos no semiplano direito o que indica instabilidade

=== 5. Dada a função de transferência abaixo classifique o tipo de sistema quanto ao erro

#figure(image("assets/2024-03-20-08-07-19.png", width: 80%)) <fig-2024-03-20-08-07-19>

vamos computar as constantes de erro $K_p,K_v$ e $K_a$

lembrando que

#math.equation(block: true, $ 1. & e_u(∞) = 1/(1+K_p) \
2. & e_R(∞) = 1/K_v \
3. & e_P(∞) = 1/K_a \ $)

tal que as ctes's são obtidas como

#math.equation(block: true, $ 1. & K_p = "lim"_(s->0) G(s) \
2. & K_v = "lim"_(s->0) s G(s) \
3. & K_v = "lim"_(s->0) s^2 G(s) \ $)

para *$K_p$* temos

#math.equation(block: true, $ 1. & lim_(s->0)((s+8)/(s(s+1)(s+2)(s+20))) = ∞ \
2. & e_U(∞) = 1/(1+∞) = 0 \ $)

para *$K_v$* temos

#math.equation(
  block: true, $ 1. & lim_(s->0)(s((s+8)/(s(s+1)(s+2)(s+20)))) = 8/(1 dot 2 dot 20) = 1/5 \
  2. & e_R(∞) = 1/(1/5) = 5 \ $,
)

para *$K_a$* temos

#math.equation(block: true, $ 1. & lim_(s->0)(s^2((s+8)/(s(s+1)(s+2)(s+20)))) = 0 \
2. & e_P(∞) = 1/0 = ∞ \ $)

assim como *$K_p$* é 0, *$K_v$* é cte e *$K_a$* é infinito temos um sistema de
tipo 1 visto que *$K_v$* é fixo

=== 4. Dada a função transferência abaixo esboce o lugar das raízes, dê o esboço mais completo possível

assuma ausêne
