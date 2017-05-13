---
theme:
  name: twitter
author: laggarcia
comments: true
date: 2007-08-04 22:06:00
layout: post
slug: foldinghome-e-ps3-ou-%e2%80%9cos-video-games-e-a-inovacao-na-computacao-parte-3%e2%80%b3
title: Folding@HOME e PS3 (ou “Os vídeo-games e a inovação na computação - parte 3″)
wordpress_id: 160
tags:
- Bioinformatica
- Hardware
- Jogos
- Linux
- Pesquisa
- Video-games
---

Andei meio distante deste blog nos últimos três meses por diversos motivos mas voltando a escrever, queria falar de um mesmo assunto sobre o qual eu estava falando da última vez que eu escrevi aqui: Os vídeo-games e a inovação na computação. Para quem tiver interesse em ler os dois primeiros artigos sobre este assunto eles estão [aqui](http://log4dev.wordpress.com/2007/04/09/os-video-games-e-a-inovacao-na-computacao/) e [aqui](http://http://log4dev.wordpress.com/2007/04/16/wii-ou-os-video-games-e-a-inovacao-na-computacao-parte-2/).

Desta vez queria falar sobre como todo o poder de processamento dos novos vídeo-games podem ser usados para... não rodar jogos! Mas, se não formos rodar jogos em vídeo-games, o que faremos com eles?

Bom, como disse no primeiro artigo sobre este assunto, pelo menos dois dos vídeo-games desta nova geração, o PlayStation 3 e o XBox 360, na minha opinião, tem como objetivos se tornarem as centrais de entertenimento da casa, gerenciando conteúdo e conectando todos os dispositivos multimídia de uma casa. Mas além disso, pelo menos o PlayStation 3, já nasceu como um computador completo. Desde que foi lançado era possível conectar um teclado e um mouse a ele, rodar Linux e, com isso, usá-lo como um desktop. Vá lá que não é um desktop lá grandes coisas porque a pouco memória (só 256 MB) e o mal uso do processador Cell pela maior parte dos aplicativos do sistema operacional, que utilizam apenas um dos nove núcleos dele, tornam a experiência não muito boa.

No entanto, se bem usados todos os núcleos do processador Cell eles podem entregar até 200 GFlops, o que é muito se comparado com os cerca de 15 GFlops de um Athlon 64, por exemplo. No caso do processador Cell, as aplicações que tiram maior proveito deste poder de processamento são aquelas que possuem grande parte do seu trabalho concentrado em processamento matemático pesado e intenso.

E daí? E daí que se as aplicações forem bem escritas, podem usufruir de todo este poder de processamento e se tornarem muito poderosas. Um bom exemplo disso são as aplicações do BOINC. Para quem não conhece o BOINC, ele é um projeto criado pela Berkeley University. BOINC significa "Berkeley Open Infrastrucutre for Network Computing".  Ou seja, é basicamente um projeto que cria aplicações clientes para diversas plataformas que utilizam o tempo de processamento ocioso em computadores distribuídos em rede (na Internet, por exemplo) para processar coisas que um computador sozinho levaria milhares de anos para processar, mesmo que ele fosse bem poderoso. A rede criada pelo BOINC já possui diversas aplicações e uma das mais antigas e populares é o Folding@Home. O Folding@HOME utiliza a infra-estrutura do BOINC para fazer cálculos poderosos sobre como átomos e moléculas se juntam para formar proteínas. A formação de proteínas é um processo complexo e a forma espacial das moléculas de proteínas é importantíssima na função que elas exercem nos organismos vivos. O Folding@Home realiza cálculos para tentar entender como se dá o processo de empacotamento e desempacotamento das moléculas de proteínas e qual é a influência destes processos no desenvolvimento de doenças. Para quem quiser saber mais sobre o BOINC e o Folding@Home, pode ver [aqui](http://boinc.berkeley.edu/) e [aqui](http://folding.stanford.edu/).

As aplicações do BOINC são um exemplo prático de aplicações que necessitam de grande poder de processamento. E, pensando nisso, o pessoal do Folding@Home ficou de olho grande no poder de processamento do processador Cell presente no PlayStation 3 e desenvolveu um cliente específico para esta plataforma para utilizar o poder de processamento ocioso dos vídeo-games! Ou seja, se você não estiver jogando, vai poder ajudar pesquisas importantes para o avanço da humanidade. Para se ter uma idéia da "ajudinha" que os PlayStation 3 estão dando para o Folding@Home, eles representam cerca de 10% dos processadores sendo utilizados de forma distribuída por esta aplicação, mas, por outro lado, entregam mais da metade do poder de processamento atual! Para maiores informações sobre isso, basta clicar [aqui](http://fah-web.stanford.edu/cgi-bin/main.py?qtype=osstats). Uma ajuda e tanto vindo de vídeo-games! Quem poderia imaginar algo assim há algum tempo atrás?

O ponto importante disso tudo é que o nível de convergência que estamos vivendo atualmente das várias tecnologias e mídias de distribuição de conteúdo estão fazendo com que coisas antes centradas apenas em entertenimento, como vídeo-games, já estão sendo pensadas hoje também como componentes centrais de sistemas distribuídos em todo o mundo. E, como vimos, não estou falando de jogos online.
