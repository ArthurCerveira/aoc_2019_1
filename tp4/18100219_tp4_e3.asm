# Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx^3 - cx^2 + dx - e
# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado
# y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado
# (.space 4). Utilize as sete primeiras posições da memória .data para armazenar,
# consecutivamente, a, b, c, d, e, x e y, iniciando o código com:
# .data
# a: .word -3
# b: .word 7
# c: .word 5
# d: .word -2
# e: .word 8
# x: .word 4
# y: .space 4

.data
.word -3
.word 7
.word 5
.word -2
.word 8
.word 4
.space 4

# - (-3)*4^4 + 7*4^3 - 5*4^2 + (-2)*4 - 8 = 1120
# - 8 + 4(-2 + 4(- 5 + 4(7 + 4 *3)))
.text
# instrucoes para pegar os numeros na memoria
lui $t0, 0x1001 
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
lw $t4, 12($t0)
lw $t5, 16($t0)
lw $t6, 20($t0)

#inverte o sinal de acordo com a expressao
not $t1, $t1
addi $t1, $t1, 1

not $t3, $t3
addi $t3, $t3, 1

not $t5, $t5
addi $t5, $t5, 1

# faz o calculo
# $t2 = (7 + 4 * 3)
mul $t1, $t6, $t1
add $t2, $t2, $t1

# $t3 = (- 5 + 4(7 + 4 *3))
mul $t2, $t6, $t2
add $t3, $t3, $t2

# $t4 = (-2 + 4(- 5 + 4(7 + 4 *3)))
mul $t3, $t6, $t3
add $t4, $t4, $t3

# $t5 = - 8 + 4(-2 + 4(- 5 + 4(7 + 4 *3)))
mul $t4, $t6, $t4
add $t5, $t5, $t4

# guarda o resultado na memoria
sw $t5, 24($t0)