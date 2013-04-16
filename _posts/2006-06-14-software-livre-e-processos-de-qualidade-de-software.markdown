---
author: laggarcia
comments: true
date: 2006-06-14 09:24:00
layout: post
slug: software-livre-e-processos-de-qualidade-de-software
title: Software livre e processos de qualidade de software
wordpress_id: 70
tags:
- Software Livre
- Engenharia de Software
- Qualidade de Software
---

A idéia deste post surgiu das duas reclamações que o Miguel já fez neste blog a respeito da falta de documentação em projetos de Software Livre (uma destas reclamações está [aqui](http://log4dev.blogspot.com/2006/05/comunidades-software-livre.html)) e de algumas conversas que tive com ele sobre este assunto baseadas na recente experiência que estou tendo no meu trabalho.




Bom, antes de mais nada, concordo com o Miguel de que falta documentação na maior parte dos projetos de software livre que eu já vi. Quer dizer, depende do que nós estamos acostumados a chamar de documentação. O meu referencial de documentação de um projeto vem dos conhecimentos de Engenharia de Software que eu tenho e da vivência com outras Engenharias. Deste ponto de vista, na minha opinião, documentação é tudo aquilo que te ajuda, de alguma forma, a explicar um sistema, como ele funciona, quais são suas funcionalidades e, talvez o mais importante, como usá-lo de uma maneira correta e eficiente, ou seja, para que o sistema serve.




Acho que a grande falha neste sentido para muitos projetos de software livre está no fato de que muitas pessoas da comunidade acreditam que a documentação é o código-fonte, afinal, que melhor maneira haveria para obter informações a respeito de um sistema do que simplesmente poder ver como o sistema funciona nos mínimos detalhes? A falha neste pensamento, comparado ao que eu disse no parágrafo anterior, está na palavra "ajuda". A documentação deveria ajudar a entender o sistema e olhar o código fonte nem sempre ajuda muito no início. Em sistemas grandes como o Eclipse, pode-se demorar uma semana ou mais para se pegar o "jeito" e conseguir, a partir de então, obter informações relevantes do sistema a partir do código-fonte. Em projetos grandes, uma semana pode não ser muito tempo, mas isto inibe, por exemplo, que uma pessoa que nunca tenha feito um plugin para Eclipse se aventure a fazer um plugin que lhe pareça útil... simplesmente porque o tempo que ela vai gastar para entender a arquitetura do sistema lhe dá apenas duas opções: ou ela vai utilizar uma parte do seu tempo livre para entender o funcionamento do sistema ou vai se virar sem a funcionalidade que ela queria implementar e, provavelmente, distribuir gratuitamente para uso-fruto do resto da comunidade.




Outra questão importante é: se há documentação, muitas vezes ela não é de fácil acesso. É muito comum os sites que hospedam projetos de software livres terem estruturas complicadas, pouco amigáveis. Apesar de eu achar este um detalhe menor, é importante citá-lo também, pois isso leva com que pessoas que trabalham com software livre se comportem de uma maneira diferente de pessoas que, por exemplo, trabalham com software proprietário.




Quando eu programava em tecnologias proprietárias, minha maior fonte de referência não era o Google. Era muito mais fácil achar referências e soluções para meus problemas na própria documentação gerada pela empresa desenvolvedora do sistema. Tive esta experiência, por exemplo, com Visual Basic 6. Não quero aqui discutir as virtudes ou não desta linguagem e muito menos as virtudes ou não da Microsoft (isto dariam vários outros posts e este já vai ficar grande o suficiente). No entanto, a Microsoft fornece uma documentação muito completa, rica em exemplos e de fácil navegação e busca. Simplesmente isto fazia com que eu dificilmente recorresse a sites específicos a respeito de VB6, ou a fóruns ou ao próprio Oráculo, digo, Google. Isto também faz com que VB6 seja, ainda hoje, uma das linguagens mais conhecidas e mais utilizadas no desenvolvimento de sistemas, mesmo com todas as suas limitações e com o fim de suporte oficial da Microsoft à linguagem.]




Em compensação, todas as vezes que eu trabalho com software livre, "Google is my friend!". Gosto das listas de discussão também, mas acho que elas são mais complicadas  de serem utilizadas, pois existe toda uma etiqueta para participação de listas, o que inclui a leitura dos FAQs e perguntas antigas das listas, o que geralmente eu não tenho muita paciência para fazer. De qualquer forma, poderíamos dizer que neste caso a documentação não está escrita formalmente. Se ela existe, é difusa e esta mal catalogada (por melhor que o Google seja, ele não pode ser utilizado como catálogo de nada, até porque o objetivo dele não é este, por enquanto). Isto, na minha opinião, acaba inibindo alguns novos desenvolvedores a experimentarem o software livre. A filosofia de que a documentação é o código-fonte, para estas pessoas, não funciona.




Os mais puristas em relação ao modelo de desenvolvimento do software livre poderão pensar que eu estou exagerando, e talvez esteja mesmo. Mas eu queria chamar atenção para o fato de que talvez um processo mais elaborado de geração de documentação poderia fazer com que projetos de software livre fossem mais bem vistos por desenvolvedores de uma forma geral e pelas corporações também (afinal, hoje grandes empresas também têm papel decisivo no desenvolvimento de projetos de software livre).




Não estou dizendo também que se deva adotar um processo formal de qualidade de software no desenvolvimento de software livre. Este esquema, na minha opinião, não funciona com o modelo de desenvolvimento criado pelas comunidades de software livre. Um processo exagerado de documentação certamente desmotivaria os colaboradores dos projetos livres, mas alguns controles, como os criados, por exemplo, pelo [Gforge](http://www.gforge.com/), poderiam ser interessantes. Isto sem levar em conta alguns argumentos interessantes da comunidade de software livre para a ausência total de documentação nos projetos de software livre. Algumas que eu acho interessante e faço questão de comentar:






	
  * Software de qualidade não necessariamente é feito com processos de qualidade e nem todo software feito com processo de qualidade tem qualidade. Isto é uma verdade indiscutível.

	
  * Processos de qualidade de software como o CMMI focam boa parte do trabalho na definição dos processos pois se a empresa ou o grupo de desenvolvimento tiverem os processos bem definidos, isto significa que, teoricamente, a saída de uma pessoa do grupo e a sua substituição por outra pessoa não deveria interferir na qualidade do software produzido. Isto faz com que as pessoas sejam transformadas em meros recursos, o que, definitivamente, não é a idéia das comunidades de desenvolvedores de software livre, onde os desenvolvedores são os principais atores.

	
  * Espera-se que a comunidade de software livre tenha colaboradores bons. E uma pessoa que não seja boa o suficiente para ler um código-fonte e entendê-lo não agregará nenhum valor ao movimento. Isto, na minha opinião, é uma verdade pela metade. Uma das grandes batalhas de um dos principais representantes do mundo de software livre, o Linux, é que ele seja um sistema operacional mais aceito e utilizado mundialmente. E, para que isto aconteça, é necessário, antes de mais nada, que o sistema seja fácil de usar e seja entendido por pessoas que não fazem nem idéia do que seja um código-fonte. Qual é a melhor maneira de se fazer entender neste caso? Eu acho que uma boa documentação poderia ajudar bastante nesta hora.

	
  * Na comunidade de software livre, boa parte dos problemas que seriam resolvidos com processos de qualidade de software são resolvidos pelo mantenedor do projeto. Sem dúvida nenhuma, o mantenedor é uma figura crucial em projetos de software livre e ele é o responsável, como o próprio nome diz, pelo bom andamento do projeto. Dizer que o processo de desenvolvimento de software livre não possui nenhum processo formal de qualidade pode até ser verdade, mas isso não significa que o mantenedor e seus colaboradores não tenham que definir funcionalidades, recursos, estimar tempo de desenvolvimento e definir milestones e releases do produto. Tudo isto também acontece com software livre.




Em suma, acho que o que talvez falte para o software livre seja pegar algumas poucas idéias dos processos complexos de qualidade de software e tentar aplicar estas idéias de uma forma apropriada à sua realidade. Sei que cada projeto é um caso diferente e que as regras não seriam universais, mas alguns conceitos poderiam ser usados para tentar ajudar a vida não só dos desenvolvedores, mas também dos usuários comuns que queiram propagar a filosofia de ser livre.
