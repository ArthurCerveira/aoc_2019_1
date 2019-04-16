#coloca os valores necessarios nos registradores
addi $t1, $zero, -4
addi $t2, $zero, 9
addi $t3, $zero, 2

#faz as multiplicacoes
mult $t2, $t1
mflo $t2
mult $t3, $t1
mflo $t3

#faz as somas
addi $t2, $t2, 7
addi $t3, $t3, 8

#faz a divisao
div $t2, $t3

#coloca o quociente e o resto no lugar
mflo $t2
mfhi $t3

#se x=-4, o divisor resulta em 0 e a divisao nao é realizada
#porem, o programa nao retorna erro e completa sua execuçao

