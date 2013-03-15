---
title: 'Bricando com bits: Ponto flutuante'
author: Miguel Galves
layout: post
permalink: /2008/03/18/bricando-com-bits-ponto-flutuante/
dsq_thread_id:
  - 64842079
categories:
  - Desenvolvimento
  - Teoria
tags:
  - Algoritmos
  - Java
  - Linguagens de Programação
  - Teoria
---
# 

Nos últimos tempos tenho trabalhado na integração de dois sistemas, um em C (legado) e um e Java. A integração consiste em em ler mensagens enviadas pelo programa em C através de um socket e gerar objetos e ações correspondentes do lado Java. Nada de muito excepcional, é um cenário bastante comum. O divertido da coisa é que eu estou tendo que descer bem baixo na manipulação dos bits, e estou tendo que relembrar vários conceitos que aprendemos algum dia na faculdade e que consideramos como sendo inúteis pro resto da nossa vida, já que boa parte é resolvida por alguma API.

Ontem acabei de me deparando com um probleminha interessante, e que me fez relembrar o conceito de representação de números em ponto flutuante. Vou tentar explicar aqui a parte teórica da coisa, e no final apresento o problema e a solução. Se você não gosta de teoria, pode pular pro último parágrafo.

Muito bem. Suponha que você tenha o seguinte código em Java:

**int i = 15; float f = (float)i; System.out.println(i ”, “ f);**

O resultado da impressão será 15, 15.0.

Até aí nenhum novidade. O casting faz com que o número passe a ser tratado como ponto flutuante, mas mantém o valor inteiro. OK. Alguém aí já parou pra olhar como estes números são representados binariamente, por baixo do pano?

`
15 inteiro = 00000000  00000000  00000000  00001111
15 float   = 01000001  01110000  00000000  00000000
`

Para alguns talvez isto não seja novidade, e para outros uma descoberta. E para alguns como eu era algo que eu já imaginava, mas nunca olhei a fundo.

No caso do 15 inteiro, nenhuma novidade: **15 = 2^3 2^2 2^1 2^0 = 8 4 2 1 = 15.**

No caso do 15 float, é necessário entendermos o padrão que rege a representação dos números de ponto flutuante: [IEEE 754][1]. Resumindo: segundo o padrão, um número de ponto flutuante pode ser representado com precisão simples (32 bits, float em Java) ou precisão dupla (64 bits, double em Java). A IEEE define apenas a precisão de 32 bits como obrigatória, as outras sendo opcionais.

 [1]: http://en.wikipedia.org/wiki/IEEE_floating-point_standard

No caso da representação simples, o layout dos bits é o seguinte: o primeiro bit representa o sinal (0 positivo, 1 negativo), os 8 bits subsequentes representam o expoente e o restante (23 bits), a parte fracionária (chamada de mantissa). O desenho abaixo, obtido da wikipedia, ilustra este layout:

![][2]

 [2]: http://upload.wikimedia.org/wikipedia/commons/thumb/7/75/General_floating_point_frac.svg/490px-General_floating_point_frac.svg.png

O expoente pode mapear valores entre **-127 a 127** (no caso de um expoente de **8 bits**). Para evitar o uso de bit de sinal, que pode dificultar certas operações, foi definido que o valor armazenado seria **e 127**, onde **e** é o real valor a ser considerado.

A mantissa armazena um valor fracionario, e pode ser traduzido como **1.**. Se a nossa mantissa for **1000000 00000000 00000000**, é equivalente a **1.1000000 00000000 00000000**. Aqui vale ressaltar mais um ponto: estamos considerando números binários, portanto os valores após às virgulas podem ser considerados como potências negativas de 2 (assim como números fracionários na base 10). No caso do exemplo, **1.1** é equivalente à **1 2^(-1) = 1 0.5 = 1.5.**

Tendo estes elementos em mão é fácil calcular o resultado final: **f = (sinal) * 2^(e -127) * 1.**.

No caso do número 15, vamos ver como fica a coisa: 
*   sinal = 0 = ** 1**
*   expoente = `10000010 = 130`. Portanto **e = 130 – 127 = 3**.
*   mantissa = `1110000  00000000  00000000`, portanto **1.111 = 1 2^(-1) 2^(-2) 2^(-3)  = 15/8**
*   Resultado = ** 1 * 2^3 * 15/8 = 8 * 15/8 = 15**. Muito bem. Mas a pergunta: porquê eu estou me preocupando com isso???

Simples: eu tenho que ler um fluxo de bytes, seguindo um descritor de mensagem, e reconstituir certos tipos de dados (ints, booleanos, campos de bits, etc…). Como eu tenho que ler e extrair alguns campos de bits perdidos no meio de bytes, resolvi implementar uma estratégia de baixo nível, lendo byte a byte e concatenando quando necessário em tipos de dados maiores. Além disso, estou usando como repositório temporário destes bits uma variável do tipo long, que possui 64bits, o que é mais do que necessário para armazenar qualquer dado que eu receba. A operação é simples: recebo um byte, e “colo” ele no long usando operações SHIFT e OR binários.

Agora suponha que o programa em C me mande o número 15 em ponto flutuante de **32 bits**, como definido acima, e que eu armazene os bits recebidos em um long. Se ao final da leitura, eu pegar a variável temporária  e fizer um **casting para float** direto, a JVM vai pegar o valor do long (no caso **1097859072**) e simplesmente converter para o padrão **IEEE 754** correspondente, o que me resultaria num float com valor **1097859072.0**, o que definitivamente não me interessa. O que eu preciso é de uma função que receba um **long **ou um **int**, seja capaz de olhar para o dado apenas como um **repositório de bits** e gere o **float** o **double** correspondente. No caso, os métodos **Float.intBitsToFloat(int)** e **Double.longBitsToDouble(lont).**

PS: Quem estiver interessado em ter uma leitura mais teórica e aprofundada sobre o tema pode ler o artigo**[ What Every Computer Scientist Should Know About Floating-Point Arithmetic][3]**.

 [3]: http://docs.sun.com/source/806-3568/ncg_goldberg.html