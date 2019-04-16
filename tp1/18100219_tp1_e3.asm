#coloca 1 no end $t1
ori $t1, $zero, 0x01

#coloca 1 no end $t2 e $t3
or $t2, $zero, $t1
or $t3, $zero, $t1
or $t4, $zero, $t1

#usa shift para colocar 8 em $t1, 4 em $t2 e 2 em $t3
sll $t1, $t1, 3
sll $t2, $t2, 2
sll $t3, $t3, 1

#soma os valores ate chegar a f
or $t1, $t1, $t2
or $t1, $t1, $t3
or $t1, $t1, $t4

#coloca $f em $t5
or $t5, $t1, $zero

#desloca f em $t5 e coloca em $t1 ate completar metade
sll $t5, $t5, 4
or $t1, $t1, $t5

sll $t5, $t5, 4
or $t1, $t1, $t5

sll $t5, $t5, 4
or $t1, $t1, $t5

#coloca o valor de $t1 em $t6
or $t6, $t1, $zero

#desloca $t1 para o final do end
sll $t1, $t1, 16

#une $t1 e $t6 com um or
or $t1, $t1, $t6
