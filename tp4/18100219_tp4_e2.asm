# Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a^3 - 5a^2 + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as duas primeiras posições da memória .data para armazenar,
# consecutivamente, a e y, iniciando o código com:
# .data
# a: .word 3
# y: .space 4
# Observe como o método de Horner é mais eficiente (faz menos operações) que
# calcular o polinômio de forma sequencial.

.data
.word 3
.space 4

.text 
#instrucoes para pegar a($t1) na memoria
lui $t0, 0x1001 
lw $t1, 0($t0)
#metodo de horner
addi $t7, $t7, 5

mul $t2, $t7, $t1
addi $t3, $t2, 7
add $t7, $t7, $t3

addi $t4, $t2, 15
add $t7, $t7, $t4
#guarda y na memoria
sw $t7, 4($t0)
