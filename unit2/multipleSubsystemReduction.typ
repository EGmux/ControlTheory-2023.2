#set heading(numbering:  "1.")
= Why do this?
==  Better  Complexity analysis
Whenever a system is analysed complexity must be the minimum required,by reducing multiple systems
into  a  "big one" is easier to analyze, such  pattern is called reduction,  and  that is achieved
by reducing each  transfer function to a  single transfer function 📔\
\
_ 💡 is that the big system is equivalent to the smaller ones_
=== Block
#rect(fill:rgb(255, 250, 148),width:20%,height:5%,inset:15pt)[
      #align(center)[G(s)]
]
With content.
#let shapes  =  (line(length:40pt),line(length:40pt))
#let transformy =  (rotate.with(90deg),rotate.with(90deg))
#let transformx =  (rotate.with(90deg),rotate.with(180deg))
#let  translations = (move.with(dx:0pt,dy:-20pt),move.with(dx:0pt,dy:-10pt)) 
#let  radialAxis =  shapes.zip(transformy,transformx,translations)
#let  radialFinal = radialAxis.map(((a,b,c,d)) =>  d(c(b(a))))
#radialFinal.at(1)
#radialFinal.at(0)
#let  radialObj =  ((radialAxis))

// #let crossCircle =  (circle(radius:21pt))
// #let  translations = (move.with(dx:0pt,dy:0pt),move.with(dx:1pt,dy:36pt),move.with(dx:2pt,dy:-35pt)) 
// #let  zipped = shapes.zip(transformy,transformx,translations)

// #let  final = zipped.map(
//   ((a,b,c,d)) => d(c(b(a)))
// )

// #crossCircle
// #final.at(1)
// #final.at(0)
// #final.at(2)
// bro




