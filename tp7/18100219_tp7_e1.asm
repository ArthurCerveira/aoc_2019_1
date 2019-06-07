# Escreva um programa que remova os espaços de uma string. Por exemplo, a entrada
# .data
# string: .asciiz "Eu amo muito meu professor de AOC-I."
# deve produzir a string
# "EuamomuitomeuprofessordeAOC-I."
# Use apenas uma string (não use uma string de saída ou uma string auxiliar no seu
# programa). Não esqueça de terminar sua string com nulo (ver tabela ASCII para
# código do espaço e do \0 (null)).
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
string: .asciiz "Eu amo muito meu professor de AOC-I."

.text
#carrega space em $s0
ori $s0, $zero, 32
#carrega o endereco da string
la $t0, string
#carrega o char
loop: lbu $t1, 0($t0)
#se for igual a espaco pula
beq $t1, $s0 igualespaco
#vai para a proxima char
proxchar: addi $t0, $t0, 1
#testa se a string acabou
beq $t1,$zero, fim
#senao, volta o loop
j loop


#se for igual a espaco guarda null na posicao da memoria
igualespaco: sb $zero, 0($t0)
#volta para o loop
j proxchar


fim:nop

