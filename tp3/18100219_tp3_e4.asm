#coloca os valores necessarios nos registradores
addi $t1, $zero, 160 
addi $t2, $zero, 120
addi $t3, $zero, 2

#multiplica base e altura
mult $t1, $t2
mflo $t1

#divide esse resultado por 2
div $t1, $t3
mflo $t3