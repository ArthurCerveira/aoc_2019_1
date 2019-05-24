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