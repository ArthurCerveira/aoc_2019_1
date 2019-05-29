#Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido da
#posição 0x10010000 da memória no início do programa. O valor de A deve ser
#escrito na memória no fim do programa, na posição 0x10010004.
#i=0 até n, produtorio: n+(i/2)
#OBS: considere a divisão inteira

.data
.word 5
.space 4

.text
#carrega valores que serao utilizados
lui $t0, 0x1001
lw $t1, 0($t0)

ori $s0, $zero, 1
ori $s1, $zero, 0
ori $t2, $zero, 2

somatorio: div $s1, $t2 #i/2
mfhi $t3
add $s2, $t1, $t3 #n+(i/2)
mul $s0, $s0, $s2 #produtorio
addi $s1, $s1, 1 #i++
beq $t1, $s1, fim #se i=n termina o somatorio
j somatorio
fim: sw $s0, 4($t0)
