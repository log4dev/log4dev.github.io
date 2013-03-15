---
title: Java.io.File
author: Leonardo Garcia
layout: post
permalink: /2006/09/16/javaiofile/
dsq_thread_id:
  - 
categories:
  - Desenvolvimento
tags:
  - Java
---
# 

Outro dia estava desenvolvendo um programa em Java e precisei manipular alguns arquivos. Até ai, tudo bem. Java, para variar, possui um conjunto de classes em sua API padrão específica para tratamento de arquivos no pacote java.io.

Mais especificamente, eu estava usando a classe java.io.File, que possui uma abstração para acesso de arquivos independente do sistema operacional. Foi ai que tive um problema inesperado quando precisei de criar um link simbólico.

Para aqueles que não estão acostumados com o conceito, um link simbólico é, simplificadamente, um arquivo especial que no fundo só é um apontador para outro arquivo. Quem quiser maiores informações pode ler [aqui][1]. Este conceito de arquivo é muito usado em sistemas *nix, mas hoje ele está presente em outros sistemas também, como o Windows.

 [1]: http://http://www.blogger.com/img/gl.link.gif

Apesar de ser um conceito muito bem difundido, para meu espanto, a classe java.io.File não consegue criar um link simbólico! O engraçado é que ela faz várias outras coisas: cria arquivos, cria diretórios, apaga arquivos, renomeia arquivos… Mas não cria links simbólicos!

Imaginei que poderia haver alguma outra forma de se criar um link simbólico em Java, mas após uma pesquisa rápida não achei nenhuma solução prática que não fosse a execução direta no sistema operacional do comando que cria links simbólicos, o que não é uma solução muito boa pois é dependente de sistema operacional e, se estamos programando em Java, uma das coisas que provavelmente estamos buscando é portabilidade (e, no meu caso, isto é verdade).

Para aumentar ainda mais minha perplexidade, achei um bug aberto no bug tracker da Sun descrevendo este problema em 1997. Só que o bug continua aberto e sendo atualizado com informações. Um dos últimos posts neste bug diz que talvez no Java 7 (que ainda está meio longe de aparecer, ainda estamos no Java 5) a interface para manipulação de arquivos em Java irá mudar (http://bugs.sun.com/bugdatabase/view*bug.do;:YfiG?bug*id=4042001 e http://bugs.sun.com/bugdatabase/view*bug.do;?bug*id=4313887).

Provavelmente esta funcionalidade foi deixada de lado na classe Java.io.File para que Java pudesse manter compatibilidade com todos os sistemas operacionais que rodam Java. No entanto, por ser uma funcionalidade muito aceita e muito útil, acho que o certo seria termos uma interface Java.io.IFile que possuisse todos os métodos e, cada sistema operacional teria sua implementação especifica desta interface. Estes detalhes, inclusive, poderiam ser totalmente abstraídos para o desenvolvedor, que poderia continuar usando a classe Java.io.File. A única coisa é que se ele tentasse criar um link simbólico em um sistema de arquivos que não suportasse isso, uma exceção seria gerada.

É pitoresco como uma linguagem muito utilizada como Java possui uma deficiência grave como esta. Alias, na minha opinião, a interface de manipulação de arquivos como um todo em Java é bem fraca. Não existe, também, um mecanismo atômico para copia de arquivos. Se alguém quiser copiar um arquivo, acho que a melhor solução será abrir um streaming para ler um arquivo, criar um novo arquivo e abrir outro streaming copiando todo o conteúdo do arqiuvo original. Algo muito mecânico se comparado com algumas outras grandes facilidade proporcionadas pela plataforma Java.

Enfim, apesar de Java ter muitas facilidades, é necessário algumas evoluções am alguns campos ainda. Apesar da minha reclamação, de certa forma isto é natural. Se todos os sistemas que existissem não precisassem de evolução a computação por si só perderia sentido.