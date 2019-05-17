# Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
# x: .word 7
# y: .space 4

.data
.word 7
.space 4

.text
#carrega o valor de x
lui $t0, 0x1001
lw $t1, 0($t0)
#carrega 1 para soma e 1 para controle
ori $s0, $zero, 1
ori $s3, $zero, 1
#faz o calculo de fibonacci
fib: or $s1, $s3, $zero
beq $t1, $s0, fim
add $s3, $s1, $s2
or $s2, $zero, $s1
addi $s0, $s0, 1
j fib
#guarda o resultado na memoria
fim: sw $s1, 4($t0)

