.data
forma: .space 20

.text
le_input:
# recebe input do usuario
li $v0, 8
la $s1, forma
move $a0, $s1
li $a1, 2
syscall
# carrega a 1a letra da string
lbu $t0, forma
# testa se a primeira letra eh c
# se for, calcula area da circunferencia
beq $t0, 99, circunferencia
# testa se eh t
# se for, calcula area do triangulo
beq $t0, 116, triangulo
# testa se eh r
# se for, calcula area do retangulo
beq $t0, 114, retangulo
# se nao for nenhum, le novamente o input
j le_input


circunferencia:
# recebe raio do usuario
li $v0, 5
syscall
# carrega pi arrediondado nos registradores
li $t1, 3
# calcula r na potencia de 2
mul $t2, $v0, $v0
# multiplica pi vezes o raio ao quadrado e guarda em s0
mul $s0, $t2, $t1
j imprime


triangulo:
# recebe base do usuario
li $v0, 5
syscall
or $t1, $zero, $v0
# recebe altura do usuario
li $v0, 5
syscall
or $t2, $zero, $v0
# multiplica b*a
mul $s0, $t1, $t2
# divide por 2 e guarda em s0
div $s0, $s0, 2
j imprime


retangulo:
# recebe base do usuario
li $v0, 5
syscall
or $t1, $zero, $v0
# recebe altura do usuario
li $v0, 5
syscall
or $t2, $zero, $v0
# multiplica b*a
mul $s0, $t1, $t2
j imprime


imprime:
# imprime resultado
li $v0, 1
move $a0, $s0
syscall
