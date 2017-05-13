---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-05-02 00:08:04
layout: post
slug: tabus-e-baixarias
title: Tabus e baixarias
wordpress_id: 289
categories:
- Desenvolvimento
- Opinião
tags:
- C
- Desenvolvimento
- Java
- Teoria
---

Nas últimas semanas tenho trabalhado em um projeto de integração entre um sistema em C e um sistema em Java: o sistema original, legado, é completamente em C, e a equipe na qual eu trabalho está reescrevendo algumas partes em Java, e eu tenho que fazer o sistema antigo conversar com o novo. O sistema em C utiliza um sistema de comunicação interna que consiste basicamente em serializar bytes e mandar via UDP. Isso torna o processo bem rápido e eficiente, mas torna a comunicação entre plataformas bem complicada, por causa de problemas como alinhamento de bytes, padding, little endian, big endian, ponto flutuante, e por aí vai.

Por isso tive que rever vários conceitos, além de relembrar várias coisas em C. Não trabalhava com C desde 2002, quando participei do projeto AURORA, organizado pelo [CenPRA](http://www.cenpra.gov.br/). O objetivo do Aurora era de construir um dirigível capaz de voar sozinho, usando dados de sensores, GPS e de câmeras de vídeo. Minha missão dentro do projeto foi de desenvolver a infraestrutura para captação de imagens através de barramento IEEE 1394 (firewire), processamento e extração de certos parâmetros em tempo real e envio de alguns frames para uma estação de controle em terra. Foi C na veia, e ainda tive que estudar IEEE1394, drivers para linux, formatos de vídeo, processamento de imagens, envio de pacotes via UDP, e muitos outros conceitos básicos. Me diverti muito nesta época.

Voltando ao projeto atual, uma das tarefas necessárias era de receber um fluxo de bytes e extrair informações seguindo um descritor da mensagem. Como meus campos de informação dentro do fluxo de bytes tinham posições e tamanhos pouco convencionais (12 bits, 3 bits começando no bit 4 do byte 2, e por aí vai), não consegui encontrar nenhuma lib que resolvesse meu problema de forma adequada (em particular, nenhuma lib de extração de dados trabalha corretamente com campos de bits). Por isso resolvi extrair os bits na mão, escrevendo algumas operações binárias: o resultado final ficou bastante bom e conciso. Mas várias pessoas me perguntaram porque eu fiz a loucura de implementar isso na mão. Segundo eles, deveria ter pesquisado mais, porque provavelmente algum engenheiro da Sun havia feito algo melhor e mais robusto.

Concordo que  seja possível que eu não tenha procurado o suficiente. Mas escrever algumas poucas linhas de operações binárias não me parece ser tarefa do outro mundo.  Talvez eu seja arrogante o suficiente para me achar melhor do que os engenheiros da Sun (ou pelo menos tão competente quanto). Mas talvez também os programadores estejam criando tabus em relação a alguns tópicos de computação, chamados por muitos de baixarias.

A evolução na computação se faz por meio de criação de camadas de abstração, que nos permitem trabalhar sem nos preocuparmos com certos problemas. Hoje em dia, quem programa em Java, Python, Ruby e outras linguagens similares não se preocupa mais em gerenciar memória, em perder ponteiros. ORMs permitem que a base de dados seja vista como um conjunto de objetos. RMI e RPC enviam objetos e estruturas de dados de uma máquina para a outra. E acreditem: eu adoro estas abstrações! Adoro trabalhar com dicionários, listas e tuplas em Python, adoro não ter que gerenciar ponteiros em Java. Mas duas ressalvas precisam ser feitas.

A primeira já foi feita pelo Joel, no artigo [The Law of Leaky Abstractions](http://www.joelonsoftware.com/articles/LeakyAbstractions.html): estas abstrações são ótimas, mas não são perfeitas e muitas vezes falham. E quando falham, é preciso conhecer os fundamentos daquilo que está por baixo. Quando sistemas de ORM retornam resultados esdrúxulos, é preciso entender que o sistema subjacente não trabalha com objetos, mas com tabelas. Quando struts não da conta de tratar uma requisição, é preciso entender que no fundo no fundo, um form é uma string de requisição HTTP. Pode parecer bobo, mas é incrível perceber a quantidade de programadores que simplesmente não entendem o que se passa por debaixo do pano. Tudo é mágico.

A segunda ressalva é o ponto que eu quero ressaltar neste texto: estas camadas de abstração criam tabus. Hoje as pessoas tem receio de escovar bits, ou processar um UDP na mão. Muito em breve, SQL será algo de outro mundo, uma vez que Hibernate, RoR e Django permitem que objetos sejam criados de forma direta. HTTP e CGI já são conceitos do passado: hoje temos forms, event handlers e componentes. Para tudo, se busca um framework, uma lib. Para tudo, se acha que o que é feito pelos engenheiros da Sun é melhor. Eu tive esta nítida impressão conversando com um colega de trabalho que já tem muiiiiitos anos de estrada. Ele tem uma boa experiência em programação de microcontroladores, e ele é da época em que C era novidade no mercado. E segundo ele, mexer com bits era algo trivial e corriqueiro naquela época.

Que fique bem claro: eu adoro não ter que mexer nestas coisas. Mas sei que problemas deste tipo podem aparecer na nossa frente de vez em quando, e quando aparecerem nós temos que  poder resolve-los. E para isso, não podemos ter medo de passar por cima das abstrações. Por isso, eu defendo que todo programador deveria mexer em algum projetinho em C de tempos em tempos (um ou dois meses a cada 5 anos por exemplo). Isso já seria suficiente para lembrar que o mundo computacional não é tão alto nível quando gostaríamos. E o prazer de voltar para nossas caixas pretas é incomensurável.
