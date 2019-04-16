addi $t7, $zero, 0x70000000
add $t7, $t7, $t7
#o resultado será 0xE0000000
#está incorreto pois esse numero representa um negativo em complemento de 2
#se substituir addu por add, a soma resultará em overflow e não será realizada