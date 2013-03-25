---
author: alexandre
comments: true
date: 2012-10-28 01:18:16
layout: post
slug: programacao-pareada
title: Programação pareada
wordpress_id: 920
categories:
- Desenvolvimento
---

Acredito que 99.9% dos desenvolvedores ja ouviram falar de progamaçao pareada, e certamente quase todos, consciente ou inconscientemente, ja fez uso desta pratica de desenvolvimento. Meu objetivo neste _post_ nao e descrever esta tecnica, nem ensinar como aplica-la, mas sim relatar um pouco da minha experiencia "pareando", e o que tenho aprendido com ela.

Minha experiencia real com programaçao pareada e muito pequena, e se concentra especialmente nas ultima seis semanas, quando iniciei em um novo projeto na empresa em que trabalho. Antes disto, minha experiencia se resumia ha algumas vezes em que entrava em um novo projeto em andamento, e pareava para facilitar a imersao no novo codigo e novo dominio, e ao que chamo de pareamento inconsciente, que e quando voce nao sabe mais o que fazer para resolver um problema, e pede ajuda a alguem (e vice-versa).

Dada esta limitada experiencia, a ideia que tinha desta pratica e de que era util para:

  * facilitar a imersao em um projeto em andamento
  * auxiliar no aprendizado de desenvolvedores menos experientes
  * solucionar problemas que nao se consegue resolver sozinho

Eis que entao inicio neste novo projeto, em uma equipe pequena, e distribuida (2.2 desenvolvedores em Porto Alegre, 3 desenvolvedores em Boston, e 1 em Seatle), composta por desenvolvedores experientes. Alem disto, com expectativa de entregar a primeira versao do sistema em 3 meses. Dado este cenario, imaginava que parear nao seria de grande utilidade. Apenas no inicio, para realizar a imersao dos desenvolvedores de Porto Alegre no novo dominio (registros medicos eletronicos) e no framework utilizado ([OpenMRS](http://openmrs.org/)).

Mas durante este inicio de projeto, eis que me deparo com alguns desafios para os quais vi que a programaçao pareada tem se mostrado uma soluçao interessante.

O primeiro deles e manter as pessoas alinhadas com as atividades umas das outras: mesmo realizando _stand-ups_ diarios, havia um certo desconforto, pois nao estavamos sendo capazes de comunicar bem a evoluçao das atividades que cada um estava realizando, especialmente entre as equipes em diferentes localidades. Ao dispendermos mais esforços no pareamento remoto (agradecimentos ao [TeamViewer](http://www.teamviewer.com/) e ao Skype), este problema foi minimizado.

Outro problema, e que ha um certo desgaste em funçao de discussoes sobre arquitetura do sistema, abordagem a se seguir no desenvolvimento de uma estoria, entre outros. Estas discussoes acabam tomando tempo, e geram conflitos desnecessarios. Em uma certa estoria, apos uma serie de discussoes com um dos desenvolvedores sobre como implementar a estoria (que a principio eu desenvolveria com um terceiro), decidimos parear, e acabamos chegando a um consenso muito rapido sobre a implementaçao, tornando toda a discussao anterior inocua.

Em funçao desta experiencia pessoal, adiciono mais dois pontos a lista anterior de utilidades do pareamento:

  * melhorar o alinhamento entre os membros da equipe quanto ao progresso das atividades
  * diminuir as discussoes "teoricas" sobre arquitetura e abordagens de implementaçao

Continuo nao acreditando que parear 100% e vantajoso. Mas quem sabe, se no futuro eu acabar participando de um projeto com pareamento em tempo integral, e possivel que eu enxergue vantagens que eu nao consigo enxergar hoje.
