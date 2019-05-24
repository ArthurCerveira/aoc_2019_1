#Reescreva o seguinte código C em MIPS Assembly:
#int i;
#int vetor[8];
#for(i=0; i<8; i++) {
#	if(i%2==0)
#		vetor[i] = i * 2;
#	else
#		vetor[i] = vetor[i] + vetor[i-1];
#}
#Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a
#partir da posição 0x1001000 da memória.

.data
.word 0, 1, 2, 3, 4, 5, 6, 7

.text
#carrega os valores na posicao
ori $s0, $zero, 8
ori $s1, $zero, 2
ori $s2, $zero, 0 #i
lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 0($t1)
#inicia o programa
#testa se i<8
loop:slt $s7, $s2, $s0
#caso seja, vai para o fim do programa
beq $zero, $s7, fim
#senao, testa se i%2 == 0
div $s2, $s1
mfhi $s7
#se for 0, vai para label par
beq $s7, $zero, par
#senao, vai para impar
j impar
#vetor[i] = i * 2;
par: sll $t1, $s2, 1
j aposif
#vetor[i] = vetor[i] + vetor[i-1];
impar: add $t1, $t1, $t2
#quando sair do if, armazena na memoria os valores e faz i++
aposif: mul $s3, $s2, $t1
sw $t1, $s3($t0)
lw $t2, $s3($t0)
addi $t2, $t2, 4
mul $s3, $s2, $t1
lw $t1, $s3($t0)
j loop
fim: 

