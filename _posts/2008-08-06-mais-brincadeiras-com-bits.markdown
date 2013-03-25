---
author: mgalves
comments: true
date: 2008-08-06 23:54:42
layout: post
slug: mais-brincadeiras-com-bits
title: Mais brincadeiras com bits
wordpress_id: 341
categories:
- Teoria
tags:
- Algoritmos
- Desenvolvimento
- Teoria
---

Há algum tempo atrás, escrevi aqui algumas curiosidades sobre [Ponto Flutuante, bits afins](http://log4dev.com/2008/03/18/bricando-com-bits-ponto-flutuante/). Semana passada, tive que corrigir alguns pequenos bugs no meu código de leitura de buffers de bytes, e descobri outra curiosidade com operação de bits em Java. Resolvi compartilhar com vocês, apesar de saber que a grande maioria dos programadores hoje em dia considera este tipo de conhecimento inútil, já que raramente se trabalha diretamente com bits. Verdade, raramente. Mas se aconteceu comigo, pode acontecer com qualquer um. E conhecimento nunca é demais.

Vamos lá!

Em Java, todo tipo primitivo de dados (byte, short, int, long, float e double) é sinalizado, o que significa que seus valores podem ser positivos ou negativos. Um byte pode ter valor de -128 a 127, um short varia de -32768 a 32767, e assim por diante.

Já em C, tipos primitivos podem ser sinalizados ou não sinalizados. Um byte sinalizado em C pode assumir os mesmos valores que um byte em Java, mas um byte não sinalizado pode assumir valores entre 0 e 255.

Assim sendo, quando se escreve um programa em Java que deve ler dados gerados por um programa em C, é importante saber se estes dados são sinalizados ou não. O mais divertido disso tudo é que não existe forma de saber isso apenas analizando os dados, porque eles são idênticos: um byte sinalizado continua tendo 8bits e podendo armazenar 255 valores.

Neste ponto me parece interessante explicar como um número negativo é armazenado em um tipo básico. Primeiro conceito: em tipos sinalizados, o bit mais a esquerda indica o sinal: 0 positivo, 1 negativo. Mas para se obter o inverso de um número, não basta apenas mexer no bit mais a esquerda. É necessário usar um segundo conceito: complemento de 2! Para se obter o complemento de 2 de um número, basta inverter os bits e somar 1. Por exemplo, se N = 7 = 00000111, o seu complemento de 2 será 11111000+1 = 11111001. **Para se obter a representação binária de um número negativo, basta gerar o complemento de 2 da representação binária do seu valor positivo!**  Assim sendo, -7 em binário é representado por 11111001.

Este mecanismo foi criado para facilitar as operações aritméticas nos processadores, pois elimina a necessidade de um circuito específico para subtração: o processador precisa calcular apenas o complemento de 2 do subtraendo, e efetuar a soma. Por exemplo

7 - 2 = 0111 - 0010 = 0111 + 1110 = 0101 .

Muito bem, voltemos portanto ao problema original...

Quando passamos um valor sinalizado de C para Java, não há problemas. Se eu leio um byte gerado pelo programa em C em um byte em Java, ou em um short (16 bits), ou em um int (32 bits), ou em um long (64 bits), o resultado será exatamente o esperado. Agora, se queremos ler um valor não sinalizado gerado por um código em C em um programa Java, é necessário escrever os bits em um tipo primitivo de tamanho maior.

Para escrever bits em um tipo primitivo, existem dois mecanismos: ou fazemos um AND binário com o endereço de destino contendo somente bits com valor 1, ou fazemos um OR binário com o endereço de destino contendo apenas bits com valor 0.

00000000 | 0110 = 00000110
11111111111 & 0110 =11110110

Por exemplo, supondo byte 11111001. Já vimos anteriormente que esta sequência de bits corresponde ao valor -7, mas também correspondeao valor 249 em um byte não sinalizado. Se quisermos obter o valor 249 em Java, teremos que gerar uma variável igual ou maior que um short.

**E agora vem a curiosidade que motivou este texto (sim, todo o resto era apenas preparação, espero que tenha sido proveitoso)** .

Pelo o que eu disse acima, para gerar o short com o valor 249, ambos os códigos abaixo seriam equivalentes:

short s1 = 0x0000 | 0xF9

ou

short s2 = 0x00FF & 0xF9

correto?

Errado!

Se eu mandar imprimir s2, o resultado será 249, mas se eu mandar imprimir s1, verei que o resultado será -7. Porque???

Simples: antes de efetuar uma operação binária, a JVM efetua um casting implícito de todas as variáveis para int. Como Java não entende tipo não sinalizado, ele faz casting do nosso byte levando em conta o valor -7, que em um int de 32 bits fica sendo 0xFFFFFFF9. O short 0x0000 passa a ser 0x00000000, e o short 0x00FF passa a ser 0x000000FF. Assim sendo, as operações descritas acima na verdade são:

short s1 = 0x00000000 | 0xFFFFFFF9 = 0xFFFFFFF9 = -7

e

short s2 = 0x000000FF & 0xFFFFFFF9 = 0x000000F9 = 249

-------------------------------------------------------

Adendo do autor:

Para aqueles que tenham dificuldades de entender notação hexadecimal, e como converter isso para binário e vice-ver, eis uma dica:  um símbolo em hexa pode assumir 16 valores (0,1,2,3,4,5,6,7,8,9,A,B,C,D,F,). Sendo assim, cada símbolo em hexa corresponde exatamente ao valor de 4 bits, e portanto são necessários dois símbolos em hexadecimal para descrever um byte.
