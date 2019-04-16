#coloca os valores necessarios nos registradores
addi $t5, $zero, 2
addi $t1, $zero, 3
addi $t2, $zero, -5

#faz x*x e coloca em $t3
mult $t5, $t5
mflo $t3

#multiplica o valor de $t3 por 3 e coloca em $t6
mult $t3, $t1
mflo $t6

#multiplica o x por -5 e soma a $t6
mult $t5, $t2
mflo $t2
add $t6, $t6, $t2

#adiciona o 13
addi $t6, $t6, 13

#se addi for substituido por ori, x nao poderá ser negativo



