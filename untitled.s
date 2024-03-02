.global _start
_start:

//Inicializar os registradores

MOV R0, #0 //INICIANDO O PRIMEIRO NUMERO DA SEQUENCIA
MOV R1, #1 //INICIALIZANDO O SEGUNDO NUMERO DA SEQUENCIA
MOV R2, #0x2ac //Endereço de memoria onde armazenaremos os valores
MOV R3, #0x2b0 //Endereço de memoria pra a posição 02a8
MOV R4, #20 //Qtd de numeros da sequencia (Pode ser modificado quantas vezes precisa)


STR R0, [R2] //Armazena o valor atual na memoria (posição R2)
STR R1, [R3] //Armazena o valor atual na memoria (posição R3)

// Vamos começar os calclos do fibonacci
Calcular_Fibonacci:
ADD R5,R0,R1 // R5 = R0 + R1
STR R5,[R3,#4]! //Atualizar endereços de memoria para a proxima posição (avançando 4 bytes)


//calcular o proximo valor da Fibonacci
MOV R0,R1 //F(n0) = F (n-1)
MOV R1,R5 //F(n-1) = F(n)

SUB R4,R4,#1 //Decrementar o Contador de Interações
CMP R4,#0 //Se R4 = 0, sair do loop
BNE Calcular_Fibonacci //Verificar se ainda existe calculo a ser feito

//Sair do programa
//MOV R7, #1  //Codigo de saida do programa
//SWI 0       //Instrução que chama a interrupção do software para encerrar o programa     
