---
author: laggarcia
comments: true
date: 2007-12-07 21:47:27
layout: post
slug: otimizacao-fina-de-codigo
title: Otimização fina de código
wordpress_id: 10
tags:
- Uncategorized
---

Há um tempo atrás num [post](http://log4dev.com/2007/09/27/viva-a-diversidade/) polêmico do Miguel (ando falando demais no passado né? mas tem coisas que não dá pra deixar passar...) o Raphael escreveu um comentário que me incomodou:


> Performance? Dane-se! Python é mais lento que Java? Sem dúvida. Mas performance pura _não importa_ hoje em dia. Hardware hoje já é tão barato que pouco importa se eu tenho que ter 1, 2 ou 3 máquinas para rodar o sistema. O que não pode é ter uma plataforma tão lenta que me obrigue a comprar 20 ou 30, que seria o caso do Ruby. Questão de ordem de grandeza.


É claro que eu tenho plena conciência que o Raphael não acredita 100% na afirmação acima e que ele estava envolvido numa discussão (quase) sem sentido com o Bruno... :P Prova disso é que mais pra frente, em outro comentário ele escreveu:


> Eu quero uma stack de protocolo de comunicação SIP que atenda 100 mil usuários simultâneos


Que vai exatamente contra o que ele tinha dito antes! Afinal de contas, neste exemplo desempenho é primordial ou nada funciona. Talvez por isso eu estivesse achando a discussão (quase) sem sentido... Mas... vamos ao que (me) interessa!

O fato é que  desempenho importa sim em muitos casos. Em algumas áreas ele é, eu diria, primordial. Mais essencial até que uma boa interface homem computador. Duvida? Pense então em criptografia.

Quase todo mundo hoje em dia sabe o que é criptografia e quase ninguém duvida que ela é essencial para nossa (falsa?) segurança na Internet. O fato que pouca gente sabe é que ainda hoje algoritmos criptográficos são exageradamente pesados. Aliás, para o desespero de alguns, é exatamente aí que está o segredo: não existe, ainda hoje, nenhuma prova formal de que algoritmos criptográficos sejam realmente seguros. O que todo mundo sabe é que é muito difícil quebrá-los com o que se conhece de teoria matemática hoje em dia. E é nessa dificuldade que é baseada boa parte da segurança das comunicações mundiais. Parece frágil isso, não? Definitivamente! E olha que eu nem comecei a falar nas técnicas não-matemáticas para se quebrar um algoritmo criptográfico... Mas isso não é conversa para este post.

Neste post, antes que eu perca o fio da meada de novo, quero falar de desempenho! Como algoritmos criptográficos ainda hoje são muito pesados, é muito comum você achar artigos e artigos na Internet de autores se vangloriando por terem achado um novo método revolucionário de implementar um algoritmo criptográfico que traz um ganho de desempenho de incríveis 5%! Ou ainda pesquisadores gastando meses fazendo testes para descobrir a combinação de flags de otimização a serem usadas no gcc para fornecer um ganho de 3%!

E é ai que eu queria chegar. Estudando um pouco sobre criptografia este semestre eu aprendi com o professor Julio López da Unicamp um método de otimização de código capaz  de fazer com que um código rode consideravelmente mais rápido. Pense no seguinte trecho de código, bastante comum em algoritmos criptográficos:
`
if (a & 0x80)
r ^= b;
`
Basicamente o que se deseja fazer é testar um bit da variável `a`. Se este bit for 1 faz-se uma operação de soma em aritmética módulo 2 (um `XOR`) da variável `b` sobre um acumulador da resposta `r`. Este tipo de código, apesar de simples, costuma ser executado de forma muito ineficiente em processadores de propósito geral modernos. Isso porque este processadores são muito rápidos mas não são adivinhos. Para simplificar bastante o assunto, podemos dizer que antes de eles terem idéia do resultado do `if` eles já estão tentando executar a instrução em seguida (a soma). No entanto, eles podem descobrir alguns ciclos de relógio depois que a soma não deveria ser executada pois o `if` deu falso. Neste caso eles tem que voltar atrás e desfazer o deslocamento.

Os processadores modernos até tentam adivinhar qual caminho é o certo, mas nem sempre isso dá certo. Descobrir que o que ele estava fazendo estava errado e voltar atrás é algo que penaliza muito o processador. Perde-se às vezes dezenas de ciclos de relógio com isso... Tempo suficiente para executar talvez de 6 a 10 instruções, dependendo do processador. Ou seja, se conseguíssemos eliminar este `if` do código poderíamos ter um ganho. O código para eliminar o `if` acima é o seguinte:
`
r ^= b & (-((a & 0x80) >> 7));
`
Alguém vai dizer: "Ora bolas, mas agora ao invés de um `if`, que é em geral uma comparação e um salto condicional, e um `XOR` eu estou fazendo um `XOR`, dois `AND`, um deslocamento e uma inversão de sinal!" Por incrível que pareça isso, muitas vezes, é mais rapido, pois elimina qualquer possibilidade do processador ter que voltar atrás e jogar fora processamento, perdendo dezenas de ciclos de relógio de execução.

É este tipo de truque de programação que muitos pesquisados da área de criptografia passam meses tentando descobrir. Este truque, aliás, é bem conhecido. Ele é muitos outros podem ser vistos no livro [Hacker's Delight](http://www.amazon.com/Hackers-Delight-Henry-Warren-Jr/dp/0201914654). Nunca olhei o livro profundamente mas ele já me foi muito bem recomendado.

E você tem algum truque bacana destes pra nos ensinar?
