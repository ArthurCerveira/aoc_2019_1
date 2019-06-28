.data
palavra: .asciiz "abacate"
input: .space 16
resultado: .asciiz "_ _ _ _ _ _ _"
caractere: .space 1
# caracteres auxiliares
barra_n: .asciiz "\n"
espaco: .asciiz " "

.text
# carrega enderecos das palavras nos registradores
la $s0, palavra
la $s1, input
la $s2, resultado
la $s3, barra_n
la $s4, espaco
la $s5, caractere
# carrega a posicao de input em t0
or $t0, $s1, $zero
# carrega a posicao da palavra em t1
or $t1, $s0, $zero

#========================
# recebe input do usuario
#========================
# carrega codigo para syscall
ori $v0, $zero, 8
# carrega argumentos
or $a0, $zero, $t0
ori $a1, $zero, 1
syscall
# vai para proxima posicao de memoria
addi $t0, $t0, 1


#====================================
# compara string com input do usuario
#====================================



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
# imprime cada caracter separado por um espaco
# carrega o caractere no espaco caractere
imprime_input:
ori $s5, $t0, 0
# imprime o caractere
or $a0, $zero, $s5
syscall
# imprime o espaco
or $a0, $zero, $s4
syscall
# vai para o proximo caractere
addi $t0, $t0, 1
# se for num, acaba a funcao
beqz $t0, fim_imprime_input
j imprime_input
fim_imprime_input:
ori $t0, $s1, 0
