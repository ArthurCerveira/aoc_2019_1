.data
v1: .space 20
v2: .space 20
v3: .space 40
espaco: .asciiz " "

.text
# carrega o endereco do v1
la $s0, v1
# inicializa o contador em 0
li $t0, 0
le_vetor_um:
# carrega o codigo do syscall
li $v0, 5
# le o inteiro
syscall
# guarda na memoria
sw $v0, ($s0)
# vai para prox pos de memoria
addi $s0, $s0, 4
# add +1 ao contador
addi $t0, $t0, 1
# testa se o contador chegou a 5
beq $t0, 5, fim_le_vetor_um
# senao volta pro loop
j le_vetor_um
fim_le_vetor_um: nop


# carrega o endereco do v2
la $s0, v2
# inicializa o contador em 0
li $t0, 0
le_vetor_dois:
# carrega o codigo do syscall
li $v0, 5
# le o inteiro
syscall
# guarda na memoria
sw $v0, ($s0)
# vai para prox pos de memoria
addi $s0, $s0, 4
# add +1 ao contador
addi $t0, $t0, 1
# testa se o contador chegou a 5
beq $t0, 5, fim_le_vetor_dois
# senao volta pro loop
j le_vetor_dois
fim_le_vetor_dois: nop


# carrega os vetores nos registradores
la $s1, v1
la $s2, v2
la $s3, v3
# inicia o contador
addi $t0, $zero, 0
vetor_um:
# carrega inteiro do v1
lw $t1, ($s1)
# guarda inteiro em v3
sw $t1, ($s3)
# vai pra prox posicao de v1
addi $s1, $s1, 4
# vai pra prox posicao de v3
addi $s3, $s3, 4
# add +1 ao contador
addi $t0, $t0, 1
# testa se se o vetor acabou
beq $t0, 5, fim_vum
# senao retorna pro loop
j vetor_um
fim_vum:
# retrona o contador
addi $t0, $zero, 0
vetor_dois:
# carrega inteiro do v2
lw $t1, ($s2)
# guarda inteiro em v3
sw $t1, ($s3)
# vai pra prox posicao de v2
addi $s2, $s2, 4
# vai pra prox posicao de v3
addi $s3, $s3, 4
# add +1 ao contador
addi $t0, $t0, 1
# testa se se o vetor acabou
beq $t0, 5, fim_vois
# senao retorna pro loop
j vetor_dois
fim_vois:


# carrega o v3 no registrador
la $s3, v3
#inicializa o cont em 0
addi $t0, $zero, 0
# imprime o inteiro
imprime:
#carrega o codigo de print em v0
li $v0, 1
lw $a0, ($s3)
syscall
li $v0, 4
la $a0, espaco
syscall
# vai para prox posicao
addi $s3, $s3, 4
# add+1 ao cont
addi $t0, $t0, 1
# testa se acabou o vetor
beq $t0, 10, fim_imprime
# senao volta pro loop
j imprime
fim_imprime: nop
