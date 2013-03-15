---
title: 'Startup Mantra I: Design é tudo que importa'
author: Raphael Lullis
layout: post
permalink: /2007/09/21/startup-mantra-i-design-e-tudo-que-importa/
dsq_thread_id:
  - 8933468
categories:
  - Design
tags:
  - Startup
---
# 

Já reparou que há algumas coisas no mundo de tecnologia que tiveram sucesso por solucionar um problema e empregavam milhares de pessoas, mas que hoje não são mais realmente *problema nem solução*? Já reparou também que esses mesmos produtos desenvolvidos por milhares de pessoas, mesmo quando são excelentes obras de engenharia, não caem no gosto do público?

Por exemplo: sistemas operacionais. POSIX ganhou há tempo. O Windows XP é um sistema que está longe de ser perfeito, mas ele se mantém **utilizável** e **estável** o suficiente para boa parte das pessoas. Ele resolveu um problema que um sistema operacional deve resolver: permitir que uma pessoa possa rodar seus programas e oferecer suporte básico de operações de computador.

E o Windows Vista? Bem, pode até ser que alguns tarados que tenham olhado as fotos das telas, gritado “Shiny Boxes!” e saído correndo para fazer o upgrade. Com certeza a máquina de marketing de Microsoft vai funcionar a ponto de convencer muitas pessoas que *elas têm que ter janelas translúcidas *e que elas têm que estar prontas para um mundo de 64 bits. Mas isso é uma grande bobagem. E isso se refletiu nas diversas análises que foram feitas. “Não há nada que justifique o upgrade”. “O maior ponto do Windows que precisa ser corrigido, a segurança, já está abalado pelas novas ameaças.” Não foram poucos os casos que escutei de pessoas que compraram um computador com Vista e voltaram atrás. Certamente a Microsoft vai conseguir com que o Vista se pague em pouco tempo, e seus acionistas vão adorar. Mas com certeza, a dominação que a MS tem não vai ser ampliada em função de seu novo produto.

Outro exemplo? Videogames. Um mercado bilionário, com MS e Sony se debatendo sobre formatos, preços, exclusividade de títulos, tamanho do HD… e quem está levando a parada é a Nintendo. Com certeza os fanboys do PS3 e do XBOX sairam correndo para as lojas gritando “Shiny Boxes!”, vitimados pela máquina de marketing. Mas depois da euforia, o que sobrou?

O Léo com certeza vai deixar um comentário falando que a estratégia da Sony e da MS era outra, de dominar a central de entretenimento da casa. Ele tem razão. Mas o engraçado é que a liderança de mercado ficou com a empresa que não se preocupou em ser a líder de mercado. O grande diferencial da Nintendo é que ela se propôs a fazer algo que fosse da vontade do público consumidor, não da vontade dos acionistas.

A lição que se tira dessa observação: na Economia Digital, não é a tecnologia, per se, que adiciona valor na cadeia de produção. O que adiciona valor é a **forma com que a tecnologia (nova ou já existente) é usada para resolver um problema**. Com a comoditização tanto de software (graças ao Open Source) quanto de Hardware (graças a lei de Moore), o único ponto de valor agregado está no serviço prestado.

E o que isso implica para aqueles que trabalham com o desenvolvimento de tecnologia? Significa que não basta mais saber *como* programar, é necessário também ser capaz de saber *o quê* programar.

Design é tudo que importa para separar os bons desenvolvedores dos operários de luxo.

Se você é um desenvolvedor de verdade, e não um simples digitador de luxo, daqueles que recebe uma especificação pronta e tem que transformar diagramas UML em código Java, você já aprendeu que a parte realmente difícil de se fazer certinho em um software está no design. Não é na implementação, tampouco a parte de debugging. É claro que há os dias que gastamos horas e horas tentando resolver aquela porcaria de bug que nem o seu ursinho de pelúcia ajuda, mas isso é o trabalho *braçal* da coisa, e não o trabalho *difícil* da coisa. O trabalho que justifica o salário estratosférico que te pagam e os bônus de fim de ano e a máquina de café expresso que colocaram no escritório só para te manter acordado é o trabalho difícil, que *só você, campeão, pode dar conta.*

Com as linguagens de alto nível, com poder de hardware sobrando nas máquinas de hoje, com bibliotecas que resolvem problemas já conhecidos e com o Google tendo informação sobre os HOW-TOs de praticamente qualquer coisa já bolada no mundo, a parte de implementação em um projeto de software é muito mais um processo de encaixar peças de quebras-cabeças do que de realmente construção propriamente dita. Ainda não chegamos na fase de “Lego Programming”, mas essa é uma tendência clara.

O que resta? O design. O design é aquela fase onde o analista precisa fazer uma coisa esquisita: sair da frente da IDE e *conversar com o cliente*. Para efeito de ilustração, cliente pode ser traduzido como “o cara que tem que aprovar o software se eu quiser continuar com o salário estratosférico que me pagam e os bônus de fim de ano e a máquina de café expresso que colocaram no escritório só para me manter acordado durante um trabalho difícil, que *só eu, o campeão, posso dar conta.*

A fase do design é justamente a fase dos requisitos. É a fase onde o cliente vai te pedir que o sistema seja simples, mas que tenha um monte de recursos. Que seja capaz de resolver todos os 13795 problemas que ele acha que tem ao toque de um botão. Um *único* botão. Que todos os usuários possam acessar o sistema sem precisar de formas complexas de autenticação, ao mesmo tempo que o sistema precisa proteger o arquivo que seja eventualmente apagado por uma secretária estressada, vingativa e sem aumento há mais de 2 anos.

Design é a arte de saber **encontrar soluções adequadas para requisitos conflitantes**. E os processos e metodologias para desenvolvimento de software acabam se dividindo em dois campos: os que assumem que não vão encontrar uma solução ótima, e trabalham por aproximações sucessivas (as metodologias agéis), e os que tentam investir tempo e dinheiro para descobrir o ponto ótimo antes mesmo de tocar em uma linha de código (o pessoal das escolas **Big M** de metodologias: CMM, RUP e outras sopas de letrinhas).

O ponto maior desse post que já está ficando longo: não há metodologia ou processo de software que vá te ensinar a *encontrar os requisitos*, muito menos um método que vá te mostrar qual é o melhor ponto para cruzar os requisitos conflitantes.

Nas empresas do Brasil que lidam com outsourcing, muito se fala da concorrência de empresas da China e Índia, onde a mão-de-obra é mais barata.

Deixe eu reescrever o paŕágrafo acima: em *qualquer lugar do mundo* se fala da China e da Índia, por ser um lugar com mão-de-obra barata.

E realmente, a Índia é um lugar onde impera a Ditadura do Processo. É lá que se concentram o maior número de empresas com CMM nível 4 e 5. É para lá que vão os grandes call-centers de empresas multinacionais. É para lá que vão os projetos de software com baixo valor agregado. Se você quiser algo feito com baixo custo e com controle de qualidade absoluto, a Índia é o lugar.

Até a indústria de cinema deles é assim. Bollywood produz 800 filmes por ano, mas é um processo tão maduro e estabelecido que você poderia jurar que é o mesmo filme, feito 800 vezes. É ISO 9000 em película: música maluca, mocinha em perigo, mocinho que salva a mocinha depois de fazer uma coreagrafia tirada de algum clipe do Menudo, mocinho salva a mocinha da maldição. Mais músicas e coreografias de Ricky Martin. Créditos do filme. *Próóóóóximo…*

Domínio do processo é um passo inicial, importante. Mas se pararmos aí, ficamos sempre dependentes de alguém que possa nos dar ordens e indicar o que devemos fazer. A pergunta: o que vai ser da Índia e da China quando a tecnologia de geração de código chegar num nível elevado o suficiente para que tenhamos o “Lego Programming”? O que será dos milhões de profissionais treinados em resolver problemas que já foram resolvidos?

Eu sei que o leitor do log4dev é inteligente e provavelmente já sabe que design é o que realmente importa, mas quero deixar essa idéia bem clara e justificada para um próximo post, com outras idéias: que senso de design é algo que pode aprimorado, que design é o único ponto onde uma startup pode se preocupar, e que o design está nos detalhes.