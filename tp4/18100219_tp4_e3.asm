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