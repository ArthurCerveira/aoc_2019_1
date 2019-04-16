#aqui seriam indicados os valores de x, y e z e colocados nas respectivas posicoes

#multiplica x por 4
sll $t7, $t1, 2

#multiplica y por 2
sll $t2, $t2, 1

#diminui 2y de 4x
sub $t7, $t7, $t2

#multiplica z por 4
sll $t4, $t3, 2

#4z - z= 3z
sub $t3, $t4, $t3

#soma 3z com (4x - 2y)
add $t7, $t3, $t7
