---
author: mgalves
comments: true
date: 2009-12-07 13:56:28
layout: post
slug: codigo-fluente
title: Código fluente
wordpress_id: 690
categories:
tags:
- Desenvolvimento
- Linguagens de Programação
- Qualidade de Software
---

Com o advento e crescimento dos projetos Open Source, se intensificou o conceito de que em última instância a melhor documentação de um projeto é o seu próprio código fonte. Concordo plenamente com isso! Em projetos ativos, manter uma documentação sobre arquitetura completamente atualizada é uma tarefa ingrata (sobretudo se seguirmos os moldes de artefatos exigidos pelas metodologias waterfall), e documentação errada é a pior coisa que pode existir.

Em projetos Open Source, onde os recursos são muitas vezes escassos e não se pode dar o luxo de manter uma pessoa apenas para manter tudo atualizado, a necessidade de uma documentação simplificada impera. E a necessidade de um código organizado também.

O problema é que muita gente levou ao pé da letra esse conceito, e chegou-se à conclusão de que comentários são supérfluos, afinal o próprio CÓDIGO é a documentação. Resultado: tenho cada vez mais visto toneladas de linhas de código sem um puto de um comentário.

Ah, mas com nomes incrivelmente sugestivos: **apagaORegistroDoUsuarioEMandeMensagemdeDesolePraEle**.

Senhores e Senhoras, o código fluente!

Plagiando um exemplo que eu peguei no [iMasters](http://imasters.com.br/artigo/15134/java/a_importancia_do_codigo_fluente_em_java/):

    Vendedor.deNome("Abreu").
        vende().
        paraCliente("Rafael").
        oProduto("Mouse Verde").
        oProduto("Teclado de Pano").
        comDescontoDe(20).
        mostrandoDetalhes();


Não posso dizer que não entendo o que este código faz! Até minha avó de 92 anos entenderia. Lindo.

O problema é que por mais que se empacote todas as funções com nomes extremamente sugestivos, que se crie DSLs para se esconder a complexidade, que as variáveis sejam extremamente bem nomeadas, alguma hora os detalhes sórdidos do código vão começar a aparecer: bases de dados, queries, estruturas de dados, rede, integrações com outra bibliotecas, etc...

(Aaaaaaaaa, você não trabalha com bibliotecas, nem com BD, nem com rede, e apenas integra código fluente? Meus pêsames, o mundo da computação é bem mais interessante e divertido do que isso. Próximo...)

E na hora que chegamos aos detalhes sórdidos, por mais que o nome do método explique o que está se fazendo, pode ficar a dúvida: **porque o método faz isso desta forma? **E entender o porque das coisas é essencial se você está tendo que corrigir/modificar/aprimorar/integrar/analisar código legado. Sim, porque o que torna o código legado tão infernal de se mexer é justamente entender O QUE SE PASSAVA PELA CABEÇA DO DESGRAÇADO QUE ESCREVEU AQUILO!

Exercício: pegue um código que você escreveu há 6 meses atrás, de um projeto do qual você não participa mais, e tente entender todas as minúcias....foi sofrido? Imagino que sim. Agora imagine o pobre coitado do estagiário que está tendo que resolver um bug que ocorre naquele trecho!

Muito se fala por aí que código tem que ser escrito para ser lido por seres humanos e não por máquinas. Uma máquina apenas interpreta aquilo que escrevemos, e não está nem aí se faz sentido ou não. Ao contrário de seres humanos. Todos ficamos muito felizes quando entramos no javadoc da Sun, e encontramos alguns detalhes de implementação interessantes de métodos cujos nomes muitas vezes são bem explicitos. Como por exemplo o _remove(String key)_ de uma _Collection_. Ninguém tem dúvidas do que ele faz, mas o que acontece se eu passar um valor nulo? Ou se passar um objeto que não existe?

Comentários são uma ferramenta muito útil, presente em qualquer linguagem, e que fazem parte do código. Devem ser utilizados com inteligência, para facilitar a vida de todo mundo, tornar o código realmente uma documentação completa e inteligente e poupar horas, cabelos e neurônios de desenvolvedores cansados, estressados ou que simplesmente não querem passar horas decifrando a mente alheia.
