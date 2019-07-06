# carrega n em t0
li $t0, 5
# carrrega t0 como parametro
move $a0, $t0
# vai para subrotina fatorial
jal fatorial
j fim


fatorial:
# testa se o parametro eh 1
beq $a0, 1, igual_um
# senao for continua a execucao
j diferente_um
igual_um:
# se for 1 coloca o resultado em v0
move $v0, $a0
# retorna a funcao
jr $ra
diferente_um:
# atribui o parametro a t0
move $t0, $a0
# diminui 1 do parametro
addi $a0, $a0, -1
# coloca ra na pilha
addiu $sp, $sp, -4
sw $ra, ($sp)
# coloca t0 na pilha
addiu $sp, $sp, -4
sw $t0, ($sp)
# chama a funcao recursivamente
jal fatorial
# recupera t0 da pilha
lw $t0, ($sp)
addiu $sp, $sp, 4
# multiplica o retorno com o t0
mul $v0, $v0, $t0
# recupera o ra da pilha
lw $ra, ($sp)
addiu $sp, $sp, 4
# retorna o resultado da multiplicacao
jr $ra

fim: nop