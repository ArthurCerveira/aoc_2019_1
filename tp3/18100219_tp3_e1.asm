#multiplica 256 e 4096
addi $t1, $zero, 256
addi $t2, $zero, 4096
mult $t1, $t2
mfhi $t1
mflo $t2

#multiplica -4095 e 4095
addi $t3, $zero, -4095
addi $t4, $zero, 4095
mult $t3, $t4
mfhi $t3
mflo $t4

#multiplica 65280 e -1
ori $t5, $zero, 65280
addi $t6, $zero, -1
mult $t5, $t6
mfhi $t5
mflo $t6

#multiplica 32768 e 4096
ori $t7, $zero, 32768
addi $t8, $zero, 4096
mult $t7, $t8
mfhi $t7
mflo $t8


# Operando 1 			256 					
# Bits Significativos 		0100000000				
# Operando 2 			4096 					
# Bits Significativos 		01000000000000				
# Produto (alta) 		0 ($t1) 				
# Produto (baixa) 		1048320 ($t2) 				
# Bits Significativos 		0100000000000000000000

# Operando 1 			-4095 		
# Bits Significativos 		1000000000001
# Operando 2 			4095 		
# Bits Significativos 		0111111111111 		
# Produto (alta) 		-1 ($t3) 	
# Produto (baixa) 		-16769025 ($t4) 	
# Bits Significativos 		1000000000001111111111111	

# Operando 1 			65280		
# Bits Significativos 		01111111100000000 		
# Operando 2 			-1 		
# Bits Significativos 		1 		
# Produto (alta) 		-1 ($t5) 	
# Produto (baixa) 		-65280 ($t6) 	
# Bits Significativos 		10000000100000000


# Operando 1 			32768		
# Bits Significativos 		01000000000000000 		
# Operando 2 			4096 		
# Bits Significativos 		01000000000000		
# Produto (alta) 		0 ($t7) 	
# Produto (baixa) 		134217728 ($t8) 	
# Bits Significativos 		01000000000000000000000000000 	
