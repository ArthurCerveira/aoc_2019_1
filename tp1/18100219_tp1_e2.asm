#Coloca os 8 'A's
ori $t1, $t1, 0xaaaa
sll $t1, $t1, 16
ori $t1, $t1, 0xaaaa


#Faz um shift de um bit a direita e coloca no $t2
srl $t2, $t1, 1

#Or em $t3, and $t4, xor em $5
or $t3, $t1, $t2
and $t4, $t1, $t2
xor $t5, $t1, $t2

#em t3, o resultado será F pois 1010(A) or 0101(5) é 1111(F), 1 v 0 = 1
#em t4, o resultado será 0 pois os bits são todos inversos, 1 ^ 0 = 0
#em t5, será igual a t3 pois sempre que um dos bit for 1 o outro será 0


