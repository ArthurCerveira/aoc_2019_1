.data
palavra: .asciiz "abacate"
input: .space 32
resultado: .asciiz "_ _ _ _ _ _ _"
# caracteres auxiliares
barra_n: .asciiz "\n"

.text
# carrega enderecos das palavras nos registradores
la $s0, palavra
la $s1, input
la $s2, resultado
la $s3, barra_n
# carrega a posicao de input em t0
or $t0, $s1, $zero
# carrega a posicao da palavra em t1
or $t1, $s0, $zero
# carrega a posicao de resultado em t5
or $t5, $s2, $zero
# registrador auxiliar para carregar espaco em asccii
ori $t2, $zero, 32

inicio:
# imprime o \n
li $v0,4 
or $a0, $zero, $s3
syscall
#========================
# recebe input do usuario
#========================
# carrega codigo para syscall
ori $v0, $zero, 8
# carrega argumentos
or $a0, $zero, $t0
ori $a1, $zero, 2
syscall


#====================================
# compara string com input do usuario
#====================================
# carrega o ultimo input
lbu $t3, 0($t0)
# carrega caractere da palavra
loop:
lbu $t4, 0($t1)
# compara caractere com input
beq $t3, $t4, char_igual_input
j char_dif_input
# se for igual resultado recebe o caractere na posicao equivalente
char_igual_input:
sb $t3, 0($t5)
# vai para o proximo caractere
char_dif_input:
addi $t1, $t1, 1
# resultado vai para posicao equivalente
addi $t5, $t5, 2
# se for null termina o loop
beq $t4, $zero, fim_loop
# senao volta para o loop
j loop
# retorna os valores originais
fim_loop:
or $t1, $s0, $zero
or $t5, $s2, $zero 


#========================
# formata string do input
#========================
# adiciona um espaco na string
addi $t0, $t0, 1
sb $t2, 0($t0)
# vai para proxima posicao de memoria
addi $t0, $t0, 1


#============================
# imprime string do resultado
#============================
# imprime o \n
li $v0,4 
or $a0, $zero, $s3
syscall
# imprime a string
or $a0, $zero, $s2
syscall


#=========================
# imprime input do usuario
#=========================
# imprime o \n
li $v0,4 
or $a0, $zero, $s3
syscall
# imprime a string
or $a0, $zero, $s1
syscall

j inicio
