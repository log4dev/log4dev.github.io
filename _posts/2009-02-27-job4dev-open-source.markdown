---
theme:
  name: twitter
author: lullis
comments: true
date: 2009-02-27 03:54:09
layout: post
slug: job4dev-open-source
title: Job4Dev Open Source
wordpress_id: 451
categories:
- Desenvolvimento
- Meta
---

Esse é auto-explicativo. Vamos colocar em breve o código do Job4Dev disponível sob uma licença open-source. A razão é simples: nós gostamos do projeto, mas não temos _manpower_ suficiente para fazer ele crescer na velocidade que gostaríamos.

Seria inocência achar que basta tornar o projeto open-source e automaticamente hordas de desenvolvedores promoverão a evolução do sistema. Eu mesmo, que sempre tive acesso ao servidor e ao repositório de código, só passei a trabalhar quando fui chamado para uma entrevista de emprego`*` em que os projetos são feitos em Python/Django, e decidi usar o Job4Dev como instrumento de aprendizado.


Mas há alguns benefícios em abrir o código:

- **O que é algo enfadonho para mim pode ser o talento de outro. **Eu acrescentei um monte de features interessantes ao código original e fiz uma re-estruturação significativa do código, mas não atualizei a versão de produção por detalhes que eu não quero ter que lidar. Exemplo: uma das coisas que eu quero adicionar ao Job4Dev é a possibilidade de procurar vagas/empresas por localização, permitindo buscas como "ordenar vagas por distância da minha casa" ou "tempo de percurso feito de carro". Por mais que o back-end esteja (quase) implementado, a quantidade de detalhes no front-end é grande. E eu não tenho tempo (nem talento, nem mesmo saco) para lidar com eles. Essa seria uma excelente oportunidade para algum webdesigner aprendendo a fazer mashups e integração com o Google Maps de forma não-trivial.

- **Nos força a fazer aquilo que é necessário para amadurecer o produto.** O Job4Dev é fruto de pessoas que não tinham experiência anterior com Django. Isso não significa que você vá encontrar [pérolas](http://log4dev.com/2008/08/10/perolas-do-mundo-java/) no código, mas é um sinal de que nossa preocupação não era a de fazer uma aplicação usando melhores práticas. Ponto para ilustração: precisamos começar a escrever testes.

- **Pode ser um meio de descobrir gente disposta e talentosa com a qual nunca trabalhamos. **Esse é o ponto mais estratégico de toda a jogada. Agora que estou vivendo em Boston e "amarrado" a um emprego full-time, participar de uma startup como founder/desenvolvedor é virtualmente impossível. Mas é fácil, entretanto, arrumar e fazer conexões, uma ponte lógica entre pessoas da costa leste americana e programadores talentosos (e com melhor custo-benefício) do Brasil.  Também imagino que eu possa vir a investir em um grupo de recém-formados que sejam talentosos e dispostos a quebrar a banca. Se aparecer _uma_ pessoa talentosa e competente para desenvolver o Job4Dev, já considero o projeto um sucesso.




## A situação atual e o futuro do Job4Dev



O Job4Dev, como é hoje, funciona. Da mesma forma que o [Craigslist](http://www.craigslist.org), é um serviço que depende muito mais de ter uma base de usuários do que da tecnologia envolvida. Precisaríamos de poucas mudanças no código se a quantidade de vagas/usuários aumentasse 100 vezes do dia para a noite.

É nítido, entretanto, que o nosso tráfego não vai apresentar esse crescimento enquanto o site for apenas um serviço de classificados. E nada das coisas que o editor-chefe andou adicionando (integração com o Google Connect, por exemplo) provê alguma feature que adiciona valor suficiente ao serviço que aumente seu poder de "venda". Ficamos num dilema esquisito. Adicionar integração ao Google Connect é masturbação de computeiro, "feels good for a while but doesn't get anything done". Por outro lado, se deixamos o sistema como está, apenas esperando que os usuários "peguem" a idéia, ele provavelmente morrerá por inanição.

Há várias possibilidades que podem ser exploradas. Podemos expandir horizontalmente - usar a mesma base de código e criar sites de empregos em outros setores específicos. Podemos fazer uma ferramenta mais verticalizada - fazer do job4dev uma ferramenta de recrutamento interno de empresas, com cadastro de currículos, voltada para o RH de empresas pequenas e médias.

Outra possibilidade é mais audaciosa e mais interessante: transformar o Job4Dev em um sistema que use alguma forma de inteligência para indicar às empresas quais são os candidatos mais adequados para um determinado tipo de projeto, bem como indicar aos profissionais quais são as vagas/empresas que serão mais compatíveis com os interesses da pessoa.

(Aliás, fica o desafio: se há alguém quiser provar que eu estou errado ao afirmar que [não há verdadeira inovação no modelo de desenvolvimento open-source](http://log4dev.com/2008/04/24/como-financiar-a-producao-de-uma-economia-onde-o-consumo-e-livre/), então que traga alguma nova idéia para a mesa e trabalhe no projeto.)

Se você está curioso, o código atual usa Python, Django e PostgreSQL (mas pode ser mySQL ou qualquer servidor suportado pelo ORM do Django) no back-end. No front-end estou usando [jQuery](http://jquery.com/) para desenvolvimento Javascript e [960gs](http://960.gs/) para layout e grid CSS.

Espero que até o início da semana que vem nós tenhamos definido qual esquema vamos adotar para deixar o código disponível.


* * *


(`*`) Não, eu não menti na entrevista. Falei que tinha experiência com Python, com aplicações web e que trabalhei com sistemas feitos em Django apenas de forma superficial. Sim, é esse o lugar onde estou trabalhando agora.
