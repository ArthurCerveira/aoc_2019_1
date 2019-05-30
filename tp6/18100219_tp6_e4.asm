#Escreva um programa que calcule o fatorial de n.
#O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
#ser escrito na posição seguinte na memória (0x10010004).

.data
.word 6
.space 4

.text
lui $t0, 0x1001
lw $t1, 0($t0) #carrega n em t1
or $s0, $zero, $t1 #faz uma copia de n em s0
ori $s1, $zero, 1 #carrega 1 em s1 para armazenar o resultado
loop: mul $s1, $s0, $s1
addi $s0, $s0, -1
beqz $s0 fim
j loop
fim:sw $s1, 4($t0)

