.data
str: .space 32

.text
# pega a string da memoria
la $s0, str
# le a string
# carrega codigo de input para syscall
ori $v0, $zero, 8
# carrega argumentos
or $a0, $zero, $s0
ori $a1, $zero, 32
syscall
# t0 percorre a string
loop:
lbu $t0, ($s0) 
# testa se eh null
beqz $t0, fim_str
# testa se é menor que 'z'
ble $t0, 122, letra
# senao, nao eh letra
j atualiza
letra:
# testa se eh maior que 'a'
bge $t0, 97, minusculo
# se for menor que 'a', testa se eh maior que 'Z'
# se for maior que 'Z', nao eh letra
bge $t0, 90, atualiza
# se eh menor que 'Z', testa se eh maior que 'A'
# se for maior q 'A', eh maiusculo
bge $t0, 65, maiusculo
# se for menor que 'A', nao eh letra
j atualiza
minusculo:
addi $t0, $t0, -32
j atualiza
maiusculo:
addi $t0, $t0, 32
atualiza:
sb $t0, ($s0)
addi $s0, $s0, 1
j loop
fim_str:
la $a0, str
li $v0, 4
syscall