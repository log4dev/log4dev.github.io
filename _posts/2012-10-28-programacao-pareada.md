---
title: Programação pareada
author: Alexandre Barbosa
layout: post
permalink: /2012/10/28/programacao-pareada/
dsq_thread_id:
  - 903709732
categories:
  - Desenvolvimento
---
# 

Acredito que 99.9% dos desenvolvedores já ouviram falar de progamação pareada, e certamente quase todos, consciente ou inconscientemente, já fez uso desta prática de desenvolvimento. Meu objetivo neste *post* não é descrever esta técnica, nem ensinar como aplicá-la, mas sim relatar um pouco da minha experiência “pareando”, e o que tenho aprendido com ela.

Minha experiência real com programação pareada é muito pequena, e se concentra especialmente nas última seis semanas, quando iniciei em um novo projeto na empresa em que trabalho. Antes disto, minha experiência se resumia há algumas vezes em que entrava em um novo projeto em andamento, e pareava para facilitar a imersão no novo código e novo domínio, e ao que chamo de pareamento inconsciente, que é quando você não sabe mais o que fazer para resolver um problema, e pede ajuda a alguém (e vice-versa).

Dada esta limitada experiência, a idéia que tinha desta prática é de que era útil para:

*   facilitar a imersão em um projeto em andamento
*   auxiliar no aprendizado de desenvolvedores menos experientes
*   solucionar problemas que não se consegue resolver sozinho

Eis que então inicio neste novo projeto, em uma equipe pequena, e distribuída (2.2 desenvolvedores em Porto Alegre, 3 desenvolvedores em Boston, e 1 em Seatle), composta por desenvolvedores experientes. Além disto, com expectativa de entregar a primeira versão do sistema em 3 meses. Dado este cenário, imaginava que parear não seria de grande utilidade. Apenas no início, para realizar a imersão dos desenvolvedores de Porto Alegre no novo domínio (registros médicos eletrônicos) e no framework utilizado ([OpenMRS][1]).

Mas durante este início de projeto, eis que me deparo com alguns desafios para os quais vi que a programação pareada tem se mostrado uma solução interessante.

O primeiro deles é manter as pessoas alinhadas com as atividades umas das outras: mesmo realizando *stand-ups* diários, havia um certo desconforto, pois não estávamos sendo capazes de comunicar bem a evolução das atividades que cada um estava realizando, especialmente entre as equipes em diferentes localidades. Ao dispendermos mais esforços no pareamento remoto (agradecimentos ao [TeamViewer][2] e ao Skype), este problema foi minimizado.

Outro problema, é que há um certo desgaste em função de discussões sobre arquitetura do sistema, abordagem a se seguir no desenvolvimento de uma estória, entre outros. Estas discussões acabam tomando tempo, e geram conflitos desnecessários. Em uma certa estória, após uma série de discussões com um dos desenvolvedores sobre como implementar a estória (que a princípio eu desenvolveria com um terceiro), decidimos parear, e acabamos chegando a um consenso muito rápido sobre a implementação, tornando toda a discussão anterior inócua.

Em função desta experiência pessoal, adiciono mais dois pontos à lista anterior de utilidades do pareamento:

*   melhorar o alinhamento entre os membros da equipe quanto ao progresso das atividades
*   diminuir as discussões “teóricas” sobre arquitetura e abordagens de implementação

Continuo não acreditando que parear 100% é vantajoso. Mas quem sabe, se no futuro eu acabar participando de um projeto com pareamento em tempo integral, é possível que eu enxergue vantagens que eu não consigo enxergar hoje.

 [1]: http://openmrs.org/ "OpenMRS"
 [2]: http://www.teamviewer.com/ "TeamViewer"