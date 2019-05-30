#Escreva um programa que encontre a mediana de três valores lidos da memória. A
#mediana deve ser salva na posição 0x1001000C da memória.
#Exemplos:
#.data
#a: .word 3
#b: .word 2
#c: .word 6
#Mediana = 3
#.data
#a: .word 19
#b: .word 9
#c: .word 6
#Mediana = 9

.data
a: .word 19
b: .word 9
c: .word 6
.space 4

.text
#carrega valores da memoria
lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
#descobre a mediana
slt $s0, $t1, $t2
beq $s0, 0, t1maiort2
slt $s0, $t2, $t3
beq $s0, 0, t2maiort3
# t1 < t2 < t3
sw $t2, 12($t0)
j fim

t1maiort2: slt $s0, $t1, $t3
beq $s0, 0, t1maiort3
# t2 < t1 < t3
sw $t1, 12($t0)
j fim

t2maiort3: slt $s0, $t1, $t3
beq $s0, 0, t3maiort1
# t3 < t1 < t2
sw $t1, 12($t0)
j fim

t1maiort3: slt $s0, $t2, $t3
beq $s0, 0, t3menort2
# t2 < t3 < t1
sw $t3, 12($t0)
j fim

# t1 < t3 < t2
t3maiort1: sw $t3, 12($t0)
j fim

# t3 < t2 < t1
t3menort2: sw $t2, 12($t0)

fim:




