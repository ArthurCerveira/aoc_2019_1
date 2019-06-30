.data
palavra: .asciiz "tamandua"
tamanho_palavra: .word 8
input: .space 32
resultado: .asciiz "_ _ _ _ _ _ _ _"
# caracteres auxiliares
barra_n: .asciiz "\n"
# strings auxiliares
numero_acertos: .asciiz "\nnumero de acertos: "
numero_erros: .asciiz "\nnumero de erros: "
ganhou_str: .asciiz "Voce ganhou"
perdeu_str: .asciiz "Voce perdeu"
palavra_aux: .asciiz "A palavra era "

.text
# carrega enderecos das palavras nos registradores
la $s0, palavra
la $s1, input
la $s2, resultado
la $s3, barra_n
la $s4, numero_acertos
la $s5, numero_erros
#carrega o tamanho da palavra em s6
lw $s6, tamanho_palavra
# carrega o numero maximo de erros em s7
li $s7, 6
# carrega a posicao de input em t0
or $t0, $s1, $zero
# carrega a posicao da palavra em t1
or $t1, $s0, $zero
# carrega a posicao de resultado em t5
or $t5, $s2, $zero
# registrador auxiliar para carregar espaco em asccii
ori $t2, $zero, 32
# inicializa em 0 contadores
# t8 armazena numero de acertos
or $t8, $zero, $zero
# t9 armazena numero de erros
or $t9, $zero, $zero


jogo_inicio:
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
# t6 controla se houve um acerto e eh inicializado em 0
or $t6, $zero, $zero
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
# soma +1 acerto
addi $t8, $t8, 1
# sinaliza para t6 que houve um acerto
ori $t6, $zero, 1
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
# testa se houve um acerto
beqz $t6, errou
j nao_errou
# se nao houve um acerto, soma +1 erro
errou:
addi $t9, $t9, 1
# continua a execucao
nao_errou: nop


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


#=============================
# imprime mensagens auxiliares
#=============================
# imprime a msg de acertos
li $v0, 4
or $a0, $zero, $s4
syscall
# imprime numero de acertos
li $v0, 1
or $a0, $zero, $t8
syscall
# imprime a msg de erros
li $v0, 4
or $a0, $zero, $s5
syscall
# imprime numero de erros
li $v0, 1
or $a0, $zero, $t9
syscall
# imprime o \n
li $v0,4 
or $a0, $zero, $s3
syscall


#=======================
# testa se o jogo acabou
#=======================
# testa se o numero de acertos eh igual ao tamanho da palavra
beq $t8, $s6, ganhou
# testa se o numero de erros eh igual ao numero maximo de erros
beq $t9, $s7, perdeu
# senao volta para o inicio do jogo
j jogo_inicio
#se ganhou carrega mensagem de vitoria
ganhou:
la $s1, ganhou_str
j fim_jogo
#se perdeu carrega mensagem de derrota
perdeu:
la $s1, perdeu_str
fim_jogo:
# imprime a mensagem
or $a0, $zero, $s1
syscall
# imprime o \n
or $a0, $zero, $s3
syscall
# carrega e imprime auxiliar da palavra
la $s1, palavra_aux
or $a0, $zero, $s1
syscall
# imprime a palavra original
or $a0, $zero, $s0
syscall
