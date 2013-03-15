---
title: Call to arms
author: Raphael Lullis
layout: post
permalink: /2009/05/14/call-to-arms/
dsq_thread_id:
  - 64842345
categories:
  - Desenvolvimento
  - Produto
tags:
  - Brasil
  - Comunidade
  - Django
  - job board
  - Open Source
  - Python
---
# 

O pessoal que lê o blog já deve conhecer o [Job4Dev][1] e já sabe que ia virar um [projeto open source para um serviço de anúncios de empregos][2]. Então não vou ficar batendo nessa tecla.

 [1]: http://job4dev.com
 [2]: http://github.com/lullis/jobboard/tree/master

O que eu quero tratar nesse texto é que, mesmo não tendo feito nenhuma promessa, eu não quero que esse projeto tenha o mesmo destino do Duke Nukem Forever. Como o editor-chefe adora dizer: “Real Artists Ship”.

E finalmente está chegando a hora de lançar o novo Job4Dev. Para os mais curiosos, temos uma versão de testes rodando [aqui][3]. Vou tentar acabar com os bugs mais óbvios e pretendo colocar essa versão no ar até o fim dessa semana. 

 [3]: http://new.job4dev.com

O motivo para esse post, então, é fazer um chamado a qualquer um que tenha vontade de participar em um projeto open source, *independente de experiência,área de competência ou grau de comprometimento*. Não importa se você só trabalha com Javascript em client-side, ou se o que você quer usar o código no Google App Engine, ou se você só tem uma hora por mês livre; **qualquer contribuição e participação será bem-vinda**. Na verdade, se tudo que você quiser fazer for me enviar bug report com o comentário “Your code sux”, será bem vindo – se vier junto com repro steps. ![;)][4] 

 [4]: http://log4dev.com/wp-includes/images/smilies/icon_wink.gif

O código está no Github, e temos um [espaço no assembla][5] para a gerência do projeto. 

 [5]: http://www.assembla.com/spaces/mushroomlabs_jobboard

Cabe apontar que uma das coisas que mais me tomou tempo foi o fato de que eu transformei uma aplicação em duas e abri espaço para uma terceira.

Para os que não estão familiarizados com o Django: o Django trabalha com a idéia de “aplicações”, módulos plugáveis que podem compor o seu site. Se antes tinhamos uma única aplicação, para lidar com “vagas”, agora temos uma aplicação para “vagas” e “empresas”. O objetivo é criar um banco de dados das empresas, conhecer empresas de um mesmo mercado, concorrentes, coletar comentários de pessoas que trabalham e/ou trabalharam lá, etc.

A terceira aplicação ainda está desativada: é uma aplicação destinada aos profissionais, estejam procurando emprego ou não. 

Com uma descrição sucinta assim, fica difícil deixar o pessoal entusiasmado em participar de um projeto, vou então só dar algumas idéias de features que eu gostaria de ver funcionando:

*   Mais detalhes com informações sobre as empresas: imagine que você acabou de ser chamado para uma entrevista ou recebeu uma proposta de emprego, seria legal ter um site onde você pudesse comparar benefícios comumente oferecidos, tempo médio de permanência da pessoa na empresa (*turnover rate*), plano de carreira, links sobre a situação da empresa e do mercado que ela faz parte, etc.

*   Algoritmo para indicar “compatibilidade” entre profissional e empresa: uma relação profissional não deixa de requerer afinidade. Há quem prefira um salário menor em um ambiente com menos pressão. Há quem prefira empresas maiores, multinacionais, mundo corporativo. Se um profissional for capacitado e em alta demanda, um sistema que sirva para classificar as vagas de acordo com a “compatibilidade” pode ser bastante valioso, e atrair muitos usuários

*   Um serviço para o gerenciamento de processo de recrutamento: ir além de um simples banco de curriculos. Que tal manter informações sobre as pessoas após uma entrevista? Que tal um espaço onde o líder técnico pode deixar registrado as notas sobre um candidato? Que tal um sistema tão simples que permita a empresas pequenas e médias que o processo de recrutamento seja feito *diretamente* pelas pessoas que vão trabalhar no projeto?

Chega. Já escrevi demais. Se quiser participar, entrar em contato é fácil. Comentários aqui, ou email para {raphael e/ou miguel}@log4dev.com.