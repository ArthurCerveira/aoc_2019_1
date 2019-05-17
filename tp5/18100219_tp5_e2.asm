# Escreva um programa que calcule:
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
# código com:
# .data
# y: .space 4
.data
.space 4

.text
lui $t0, 0x1001 
#carrega 333 para comparação
ori $t1, $zero, 334
#carrega 1 para controle
ori $s0, $zero, 1
#adiciona 1 ao controle e o resultado no total
loop: add $s1, $s0, $s1
addi $s0, $s0, 1
#testa se chegou no 333, senao volta ao inicio
beq $s0, $t1, fim
j loop
#guarda o resultado na memória
fim: sw $s1, 0($t0)

