# Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua
# divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores
# forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
# a: .half 30
# b: .half 5
# y: .space 4

.data
.half 30
.half 5
.space 4

.text
#carrega os valores da memoria
lui $t0, 0x1001
lh $t1, 0($t0)
lh $t2, 2($t0)

#se sao iguais, pula para multi
beq  $t1, $t2, multi
#se sao diferentes continua a execucao
div $t1, $t2
mflo $t3
#pula para o fim
j fim
multi: mul $t3, $t1, $t2
# gaurda na memoria
fim: sw $t3, 4($t0)
