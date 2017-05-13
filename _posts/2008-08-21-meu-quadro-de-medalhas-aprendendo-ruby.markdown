---
theme:
  name: twitter
author: bart
comments: true
date: 2008-08-21 02:01:33
layout: post
slug: meu-quadro-de-medalhas-aprendendo-ruby
title: 'Meu Quadro de Medalhas: Aprendendo Ruby'
wordpress_id: 347
categories:
- Desenvolvimento
tags:
- Desenvolvimento
- Formação
- Linguagens de Programação
- Ruby
---

O Sorô [escreveu há um tempo atras](/2008/06/11/gerenciamento-pessoal/) sobre como conseguir motivação pra aprender algo novo, como uma linguagem de programação. Desde a primeira vez em que ouvi falar de Ruby, la em 2001, eu estou tentando achar algum jeito de aprender a linguagem, mas a procrastinação sempre fala mais alto. Acho que o único jeito que encontrei pra aprender uma nova linguagem é ter um projeto, alguma coisa prática de verdade, nem que seja algo meio sem sentido mesmo, só pra ter um objetivo concreto e ir aprendendo com as necessidades que vão surgindo. Como não tava tão inspirado pra criar um novo job4dev (que foi o "projetinho" do miguel), e estamos em tempos de Olimpíadas, eu resolvi aprender um pouco de Ruby escrevendo um programa pra gerar meus próprios quadros de medalhas.

Eu sempre tive uma certa ressalva com esses quadros de medalhas olímpicos. Em geral eles colocam medalhas de ouro acima das de prata, e essas acima das de bronze. Isso faz com que um país que tenha uma mísera medalha de ouro fique na frente de um outro que tenha 10 de prata, o que eu acho meio que injusto. É claro que agora com os EUA perdendo da China nos ouros, a TV americana tá colocando o ranking baseado no total de medalhas. Mas daí você tá dizendo que uma medalha de prata vale o mesmo que uma de ouro, o que não é a verdade. Uma solução seria colocar pesos pra cada tipo de medalha.

Outra coisa meio injusta é que na China tem muito mais gente que na Austrália, então um ranking baseado em população também seria interessante. E mais ainda, um atleta como o Michal Phelps consegue 8 medalhas numa olimpíada, mas um time completo de futebol consegue no máximo 1. Porque não multiplicar o valor da medalha pelo numero de atletas na equipe (titular, pelo menos)?

Então a idéia inicial que eu tive foi a seguinte. Estamos em plena Web2.0, então eu devo conseguir alguns serviços que provenham os dados necessários e eu faco uma espécie de mash-up, calculando meus rankings. Eu precisaria de 2 serviços, um com os dados sobre as medalhas e esportes, e outro com dados sobre as populações dos países.

Infelizmente logo na minha primeira tarefa eu já encontrei problemas. Informação é dinheiro, e foi impossível encontrar algum site na Web que disponibilizasse as informações sobre as medalhas. Existem vários sites mostrando tabelas ou disponibilizando RSS com noticias, mas uma API pras medalhas não existe. Acabei descobrindo que existe uma tal de World News Press Association que tem o monopólio das feeds sobre os eventos olímpicos e eu teria que pagar pra conseguir acesso (como o [google fez](http://maps.google.com/help/maps/2008summergames/)).

A minha solução foi criar um programinha em Ruby que fizesse parser das paginas do UOL. Primeiro eu baixo a pagina do [quadro geral de medalhas](http://olimpiadas.uol.com.br/2008/quadro-de-medalhas/index.jhtm), daí eu recursivamente baixo as paginas de cada pais (que tem no combo box). Não é exatamente uma solução elegante, mas graças as boas tags no fonte da UOL e ao [HPricot](http://code.whytheluckystiff.net/hpricot/) (uma biblioteca pra fazer parse de HTML) não foi tao difícil agregar os dados e gerar um CSV. Porem, surgiram dois problemas. Primeiro que eu tive que abandonar minha idéia de multiplicar as medalhas pelo numero de atletas no esporte, pois essa informação seria muito chata de conseguir. Depois que eu tive que criar uma tabela traduzindo os nomes dos países de português pra inglês, já que eu queria apresentar as tabelas em inglês, e os dados de população também estariam em inglês.

O segundo passo seria conseguir informações sobre população. Eu achei um tal de [Population Reference Bureau](http://www.prb.org/Datafinder/Topic/Bar.aspx?sort=v&order=d&variable=1) com as informações necessárias, só que de novo esbarrei em problemas. Primeiro que eles não tem um RSS ou um web service, então eu tive que fazer copy e paste da tabela. E segundo que algumas informações relativas aos países são diferentes da pagina da UOL, ou tem que ser agregadas (por exemplo, tive que adicionar a população de varias colonias francesas na da França). Pra alguns países estranhos (como "Ilhas Virgens Americanas"), que não tinham informação no Bureau, eu tive que pegar no wikipedia mesmo.

Finalmente, com todos os dados em arquivos, eu pude criar um outro programinha em Ruby pra analisar os dados e gerar meus rankings. Eh claro que como isso é just for fun, a interface deixa muito a desejar. Mas pra quem tiver interesse, alguns rankings que eu gerei estão [nesse diretório](http://bielsko.uwaterloo.ca/~ttonelli/rankings/). Eu atualizo os dados usando o parser uma vez por dia. Os cabeçalhos dos rankings descrevem o que foi usado pra gerar os"values" pras medalhas (counters) e pro valor total (aggregators) a partir do numero de medalhas, e por quais campos ordenar os países.

Bom, lições aprendidas:
	
* realmente o melhor jeito pra aprender uma linguagem de programação é usando. Eu não posso dizer que agora sou um programador Ruby, mas aprendi um monte de detalhes e foi bem melhor do que qualquer tutorial.
* apesar de existir muita informação pela web, o mais chato (e difícil) é conseguir agregar a informação de varias fontes que em geral são "um pouquinho diferentes". Por exemplo, não teria como automatizar o matching dos nomes dos países em diferentes línguas, nem como programar a intuição de "somar as populações das colonias", a não ser que você tenha muito mais meta-informação, ou recorra a heurísticas.
* a China nem é tao boa assim se a gente considerar o tamanho da população ;-)
* o Brasil continua ruim, em qualquer ranking mais ou menos razoável que se faça.


O proximo passo seria aprender Ruby on Rails e fazer uma interface em que os usuarios pudessem escolher como fazer os rankings. Mas como eu teria que instalar outro servidor web e um banco de dados,  e eu to meio sem tempo, vai ter que ficar pra depois... e se interessar a alguem eu mando os dados.
