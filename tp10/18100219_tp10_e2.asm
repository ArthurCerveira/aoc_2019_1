.data
vetor: .space 64
espaco: .asciiz " "

.text
la $t9, 2
la $s0, vetor
# t8 conta os pares
la $t8, 0
# t7 guarda a soma
la $t7, 0
# le a quantidade de numeros
li $v0, 5
syscall
move $s1, $v0
# inicializa o contador em 0
li $t0, 0
loop:
# chama funcao de ler numeros
jal le_num
# chame funcao de soma
jal soma_par
# add+1 no contador e vai pra prox pos de memoria
addi $s0, $s0, 4
addi $t0, $t0, 1
# testa se leu tudo
beq $s1, $t0, leu_tudo
# senao volta pro loop
j loop


# le numero
le_num:
li $v0, 5
syscall
sw $v0, ($s0)
jr $ra


# soma parest
soma_par:
div $v0, $t9
mfhi $t1
beqz $t1, igual_dois
jr $ra
igual_dois:
addi $t8, $t8, 1
add $t7, $v0, $t7
jr $ra


leu_tudo: 
li $v0, 1
move $a0, $t7
syscall
li $v0, 4
la $s7, espaco
move $a0, $s7
syscall
li $v0, 1
move $a0, $t8
syscall