#escreve 0x12345678 em $t1
ori $t1, $t1, 1
sll $t1, $t1, 4

ori $t1, $t1, 2
sll $t1, $t1, 4

ori $t1, $t1, 3
sll $t1, $t1, 4

ori $t1, $t1, 4
sll $t1, $t1, 4

ori $t1, $t1, 5
sll $t1, $t1, 4

ori $t1, $t1, 6
sll $t1, $t1, 4

ori $t1, $t1, 7
sll $t1, $t1, 4

ori $t1, $t1, 8

#escreve 0xf0000000 em $t7
ori $t7, $t7, 15
sll $t7, $t7, 28


#inverte o numero


#coloca o 8 no lugar, deslocando $t1 para esquerda
sll $t2, $t1, 28

#coloca o 7 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x67800000 em $t3
sll $t3, $t1, 20

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 6 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x45678000 em $t3
sll $t3, $t1, 12

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 5 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x23456780 em $t3
sll $t3, $t1, 4

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 4 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x01234567 em $t3
srl $t3, $t1, 4

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 3 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x00012345 em $t3
srl $t3, $t1, 12

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 2 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x00000123 em $t3
srl $t3, $t1, 20

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3


#coloca o 1 no lugar
#desloca o $t7 para a direita
srl $t7, $t7, 4

#coloca 0x00000001 em $t3
srl $t3, $t1, 28

#faz um and de $t3 e $t7, assim sobrando apenas o numero desejado
and $t3, $t3, $t7

#faz um or com $t2 para colocar o numero no lugar
or $t2, $t2, $t3