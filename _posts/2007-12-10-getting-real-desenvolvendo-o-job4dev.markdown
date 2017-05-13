---
theme:
  name: twitter
author: mgalves
comments: true
date: 2007-12-10 23:34:43
layout: post
slug: getting-real-desenvolvendo-o-job4dev
title: 'Getting Real: desenvolvendo o Job4Dev'
wordpress_id: 223
categories:
- Desenvolvimento
- Design
tags:
- Desenvolvimento
- Design
- job4dev
---

"_True artists ship_", artistas de verdade produzem.

Esta frase, atribuida ao Steve Jobs, me foi dita pelo Raphael. Confesso que ela mexeu comigo. Sempre admirei pessoas que desenvolvem seus projetos computacionais, e fazem deles coisas interessantes. Eu estou numa fase de tentar transformar os meus projetos em coisas reais. Se eles estão se tornando coisas interessantes, é outro papo. O primeiro foi este blog, que com muita perserverança está se transformando em um repositório de textos bem interessantes. Depois, coloquei no ar a [JuiceLib](http://code.google.com/p/juicelib), que está num processo bem lento de desenvolvimento. Falta tempo e ajuda. E eu trabalho por lotes....

Mas daí, veio a idéia do job board. O interessante neste caso é que este lance do jobboard, antes de ser um projeto de desenvolvimento, era algo que me martelava a cabeça. Me frustrava não encontrar no Brasil um jobboard que me desse prazer de visitar. E depois de um tempo de maturação, cheguei à conclusão de que se ele não existisse, eu teria que criar um. Lembrei de um cara chamado [Richard Stallman](http://en.wikipedia.org/wiki/Richard_Stallman) que não encontrou nenhum editor de textos com os recursos que ele procurava, e daí ele escreveu o [Emacs](http://www.gnu.org/software/emacs/). Citando uma outra referência mais moderna, o livro [Getting Real](http://gettingreal.37signals.com/toc.php) do pessoal da [37 Signals](http://www.37signals.com/):


> A great way to build software is to start out by solving your own problems. You'll be the target audience and you'll know what's important and what's not. That gives you a great head start on delivering a breakout product.


Muito bem. Eu tinha um problema a resolver. Resolvi atacá-lo de frente. E de quebra, poderia me aprofundar mais em Python. Restava definir o resto do meu ambiente. O editor seria o Emacs, por ser extremamente versátil, ter uma quantidade incrível de ferramentas úteis e poderosas, e ser bem leve. O banco de dados escolhido foi [PostgreSQL](http://www.postgresql.org/), por ser um banco free, de ótima qualidade, com portes para Linux, Windows e Mac (ambiente primário de desenvolvimento) e pelo fato de eu ter trabalhado com ele por muito tempo.

O mais difícil foi definir um framework/lib de desenvolvimento web. Comecei avaliando o [Turbogears](http://turbogears.org/). No início achei interessante, mas  por vários motivos não gostei de como ele evoluiu. O Raphael tentou me convencer a me usar o [web.py](http://webpy.org/), uma lib bem leve de desenvolvimento web, que eu acabei não escolhendo por achar a doc bem fraquinha. Daí eu descobri o [Django](http://www.djangoproject.com), que possuia uma documentação bem completa, um conceito bem legal de oferecer muitos recursos para minimizar a parte CRUD do sistema e um ótimo case de implementação: o site [washingtonpost.com.](http://code.djangoproject.com/wiki/DjangoPoweredSites#Sites/featuresatTheWashingtonPost)

O desenvolvimento se deu em 3 grandes blocos de trabalho.

O primeiro foi a parte de design de base de dados e entidades, além de primeiros contatos com o ambiente de desenvolvimento. Demorou 3 dias mais ou menos. Boa parte da demora foi pelo fato de eu estar descobrindo o Django ao mesmo tempo que fazia o design da solução. Neste ponto, eu sabia muito bem o que eu queria obter, e sobretudo sabia o que eu NÃO queria! Citando mais uma vez o Getting Real:


> Sometimes the best way to know what your app should be is to know what it shouldn't be. Figure out your app's enemy and you'll shine a light on where you need to go.


O segundo bloco de trabalho foi a integração com o design gráfico. E nesta fase aconteceu uma coisa interessante. O Raphael fez um design que se encaixou perfeitamente naquilo que eu tinha em mente. E ao mesmo tempo ele tinha feito uma versão funcional do board em web.py. Rolou então uma competição saudável: roubei o design dele, e durante alguns dias desenvolvemos o mesmo sistema em  ambientes diferentes e em paralelo. O que um fazia, o outro corria atrás para fazer melhor. Um impulsionou o outro. Nesta fase, foram feitas as telas principais, o sistema de submissão, e o primeiro RSS. Foram dois ou três dias de trabalho bem intenso, e confesso que fazia muito tempo que não me divertia tanto escrevendo um software. O meu deadline era segunda feira dia 26 de novembro. Neste dia tínhamos um demo rodando.

Foi aí que veio o terceiro bloco de trabalho. Chamamos amigos e conhecidos para serem beta testers. A meta: colocar o site no ar, para o público, com domínio próprio e tudo mais no dia 3 de dezembro. Nesta semana, várias pessoas testaram o sistema, acessando a listagem, as páginas de anúncios, submetendo anúncios novos  e sobretudo reportando bugs e mais bugs. Este era o objetivo. Nos final de semana anterior à minha data limite de "lançamento", passei horas e mais horas escrevendo código, debugando, testando.

No dia 3, o [Job4Dev](http://job4dev.com) estava no ar. O [Log4Dev ganhou um irmãozinho](http://log4dev.com/2007/12/03/log4dev-voce-ganhou-um-irmaozinho-job4dev/), e eu ganhei mais um filho. Como disse anteriormente, fazia muito tempo que não tinha tanto prazer em fazer algo relacionado a software. Não pela complexidade do sistema em si, mas pelo fato de ter uma meta a ser alcançada, e de produzir um sistema pequeno, leve, eficiente e útil. E sobretudo de ter a sensação de ter gerado algo que pode ser útil para resolver um problema real.
