.data
x: .word 150
y: .word 230
z: .word 991
r: .word 0

.text
# carrega valores da memoria
lw $t0, x
lw $t1, y
lw $t2, z
lw $t3, r
# vai para o main do programa
j main


soma3n:
# coloca ra na pilha
addiu $sp, $sp, -4
sw $ra, ($sp)
# chama a subrotina soma
jal soma
# coloca o resultado da soma e o parametro 3 nos registradores
move $a0, $v0
move $a1, $a2
# chama a subrotina soma
jal soma
# recupera o ra da pilha
lw $ra, ($sp)
addiu $sp, $sp, 4
# retorna para a execucao
jr $ra


soma:
# soma os dois parametros e armazena em v0
add $v0, $a0 $a1
# retorna para a execucao
jr $ra


main:
# coloca os parametros nos registradores
move $a0, $t0
move $a1, $t1
move $a2, $t2
# vai para a subrotina soma3n
jal soma3n
# atribui o retorno a resultado
move $t3, $v0