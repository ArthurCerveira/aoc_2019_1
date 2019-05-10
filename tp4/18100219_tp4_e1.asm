# Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as três primeiras posições da memória .data para armazenar,
# consecutivamente, a, b e y, iniciando o código com:
# .data
# a: .word 3
# b: .word 5
# y: .space 4

.data
.word 3
.word 5
.space 4

.text
#instrucoes para pegar a($t1) e b($t2) da memoria
lui $t0, 0x1001 
lw $t1, 0($t0)
lw $t2, 4($t0)
#multiplica a e b, e desloca 5 bits para multiplicar por 32
mul $t3, $t1, $t2
sll $t3, $t3, 5
#carrega 3 em $t4, multiplica por a e subtrai de 32ab
ori $t4, $t4, 3
mul $t1, $t1, $t4
sub $t3, $t3, $t1
#carrega 7 em $t4, multiplica por b e soma a 32ab - 3a
ori $t4, $zero, 7
mul $t2, $t2, $t4
add $t3, $t3, $t2
#carrega 13 em $t4, subtrai de 32ab - 3a + 7b e guarda y na posicao de memoria
ori $t4, $zero, 13
sub $t3, $t3, $t4
sw $t3, 8($t0)