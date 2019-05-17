# Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 ≤ temp ≤ 40 e
# 60 ≤ temp ≤ 80.
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
# temperatura por um valor qualquer.

#carrega a temperatura
ori $t0, $zero, 90

#testa se é menor que 40
slti $s5, $t0, 41
beq $s5, $s1, mais40
j menos40


#testa se é menor que 20
menos40: slti $t1, $t0, 20
#testa se é menor que 40
slti $s0, $t0, 40
#se for menor que 40 $s0 vai ser 1, se for maior que 20 $t1 vai ser 0, logo faz um and para saber se esta no intervalo
and $t1, $s0, $t1
j fime



#testa se é menor que 60
mais40: slti $t1, $t0, 60
#testa se é menor que 80
slti $s0, $t0, 81
#se for maior que 80, $s0 será 0
beq $s0, $zero, inval
j fima
inval: ori $t2, $zero, 1
#se for menor que 80 $s0 vai ser 1, se for maior que 60 $t1 vai ser 0, logo faz um and para saber se esta no intervalo
fima: and $t1, $s0, $t1
fime:or $t1, $t2, $t1