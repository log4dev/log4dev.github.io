---
theme:
  name: twitter
author: mgalves
comments: true
date: 2011-02-16 10:41:58
layout: post
slug: recomendacao-de-musica-por-analise-de-conteudo
title: Recomendação de música por análise de conteúdo
wordpress_id: 847
---

### Por Fabrício Barth


No ano de 2010 eu orientei o Trabalho de Conclusão de Curso do Renan de Almeida e Ricardo Aoyagi, ambos alunos do Centro Universitário SENAC (São Paulo – SP). O objetivo do trabalho deles era construir um sistema de recomendação de músicas baseado apenas na análise do conteúdo das mesmas.

Neste projeto, cada música do repositório, assim como as músicas pertencentes ao perfil do usuário, são representadas por atributos (i.e., MFCC, Chroma, Zero Crossings, Flux e Spectral Centroid) extraídos a partir dos sinais de áudio de uma música. Um perfil de usuário é representado por uma lista de músicas. A adição ou remoção de músicas do perfil do usuário é realizado pelo próprio usuário, manualmente, através de uma interface web.

Foram testados três métodos para a recomendação de músicas: (i) sugestão por proximidade; (ii) agrupamento com sugestão randômica, e; (iii) agrupamento com sugestão por proximidade. O método de sugestão por proximidade utiliza a equação da distância euclidiana para a calcular a distância de cada música existente no perfil do usuário com todas as outras músicas existentes no repositório. O método de sugestão por agrupamento com escolha randômica cria agrupamentos entre as músicas existentes no repositório e, consequentemente, no perfil do usuário. Neste caso, a recomendação consiste em selecionar aleatoriamente uma música dentro do mesmo agrupamento de cada música existente no perfil do usuário. O método de sugestão por agrupamento com escolha por proximidade cria agrupamentos entre as músicas existentes no repositório, recomendando a música mais próxima dentro do mesmo agrupamento para cada música existente no perfil do usuário. Neste caso, a música mais próxima é definida utilizando a equação da distância euclidiana.

Para cada método de recomendação foram utilizadas cinco playlists que representam o perfil de cinco usuários distintos. Foram medidos a precisão e o tempo de resposta de cada método de recomendação considerando uma base com três mil (3.000) músicas. O método de recomendação por proximidade obteve uma precisão média de 84%. O tempo de resposta médio deste método foi de 40 segundos por recomendação. O método de recomendação por agrupamento com sugestão randômica obteve uma precisão média de apenas 28% e um tempo de resposta médio igual a 250 milisegundos por recomendação, enquanto que o método de recomendação por agrupamento com sugestão por proximidade obteve uma precisão de 74% e um tempo de resposta médio igual a 1 segundo por recomendação.

Este trabalho ilustra que é possível desenvolver sistemas de recomendação baseados apenas no conteúdo das músicas. Através da implementação do método de recomendação por agrupamento com sugestão por proximidade constatou-se que é possível desenvolver métodos com uma taxa de precisão média alta (74%) e um tempo de resposta médio baixo (1 segundo por recomendação), o que torna viável o desenvolvimento deste tipo de sistema.

A monografia na íntegra pode ser acessada [aqui](http://fbarth.net.br/docs/tccs/recomendacaoMusicas-2010.pdf).

--

**Fabricio Barth é doutor em Engenharia Elétrica pela [Universidade de São Paulo](http://www.knoma.pcs.usp.br/) (2009), mestre em Engenharia Elétrica pela[Universidade de São Paulo](http://www.knoma.pcs.usp.br/) (2003) e graduado em Ciências da Computação pela [Universidade Regional de Blumenau](http://www.inf.furb.br/)(2000). Atualmente ocupa a posição de Search and Web Mining Analyst no [Apontador](http://www.apontador.com/) e é professor da [Faculdade de Tecnologia Bandeirantes (BandTec)](http://www.bandtec.com.br/). O post original foi publicado em [http://blog.fbarth.net.br/2011/02/15/recomendacao-de-musica-por-analise-de-conteudo/](http://blog.fbarth.net.br/2011/02/15/recomendacao-de-musica-por-analise-de-conteudo/)**
