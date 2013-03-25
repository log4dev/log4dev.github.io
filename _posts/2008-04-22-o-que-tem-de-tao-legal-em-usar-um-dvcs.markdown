---
author: lullis
comments: true
date: 2008-04-22 01:59:09
layout: post
slug: o-que-tem-de-tao-legal-em-usar-um-dvcs
title: O que tem de tão legal em usar um DVCS?
wordpress_id: 278
categories:
- Design
---

Contrariamente aos desejos do nosso editor-chefe, este blog ainda não é o seu ponto único de informação sobre tecnologia.  Se fosse, você estaria perdendo muita informação interessante que foi produzida em outros lugares. Por exemplo: muitas pessoas estão passando a adotar **software para gerenciamento distribuído de código e controle de versão**. Tendo em vista que nosso editor-chefe é um usuário de CVS e SVN, não faz muito sentido para ele acompanhar as experiências das pessoas que estão adotando sistemas que se fundamentam em outra arquitetura básica, logo ele terá pouca oportunidade para escrever a respeito.

Esse não é um texto para falar sobre as vantagens técnicas de usar sistemas distribuídos de versão (Distributed Version Control System - DVCS) como o [Git](http://git.or.cz/), [Darcs](http://darcs.net) ou [Mercurial](http://www.selenic.com/mercurial). Já existe muito material que você pode encontrar por aí, como por exemplo uma [apresentação em vídeo do próprio Linus Torvalds](http://video.google.com/videoplay?docid=-2199332044603874737) sobre o Git e suas vantagens. O que eu quero é justamente comentar sobre os princípios que levaram Torvalds a desenvolver um sistema completamente novo. De acordo com Linus, sistemas distribuídos não são melhores por questões tecnológicas ou de engenharia avançada, mas são melhores por princípios da arquitetura: "Com sistemas centralizados", diz ele, "o desenvolvedor tem que lidar com questões que podem se tornar problemas políticos - saber quem pode ter acesso ao sistema; quem pode ter acesso de escrita; quem vai ser o responsável por determinados subsistemas, etc. Em sistemas distribuídos, isso não acontece. Cada desenvolvedor é dono do seu próprio repositório e decide livremente de quem ele irá puxar suas alterações. Não existe um repositório canônico, oficial. O meu repositório de código é tão bom quanto o dos desenvolvedores que estão trabalhando em repositórios de quem eu colaboro."

Uma outra questão -  fundamentalmente importante - é a questão da confiança. Diz Torvalds: "Eu não preciso mais ficar verificando a qualidade de cada patch que entra na minha árvore de código. Eu posso puxar qualquer coisa que venha da árvore de Andrew Morton (desenvolvedor principal da versão 2.6 do kernel do Linux) sem medo de causar prejuízo em meu código, pois eu _confio em Andrew_."

Esse é um argumento estranho, mas muito poderoso: nós podemos confiar em uma, duas, dez pessoas. Mas não podemos confiar em _centenas ou milhares_ de pessoas. **Confiança não é escalável**. Podemos até confiar em alguém desconhecido indiretamente (o amigo do meu amigo...) mas esse critério não resiste por muitas iterações. É esse o ponto que torna sistemas que se baseiam em arquiteturas distribuídas melhores.

Não importa o quão superior ou madura seja a implementação de um sistema centralizado, ele jamais terá "trabalhe apenas com as pessoas em que você confia" como uma feature. É impossível obter isso em um sistema centralizado, _por design_. A killer feature de um DVCS é a possibilidade de gerenciar seus projetos usando o seu grau de confiança nas pessoas.
