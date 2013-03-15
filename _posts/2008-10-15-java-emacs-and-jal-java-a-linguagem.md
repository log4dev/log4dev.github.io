---
title: Java, Emacs and JaL (Java, a Linguagem)
author: Alexandre Barbosa
layout: post
permalink: /2008/10/15/java-emacs-and-jal-java-a-linguagem/
dsq_thread_id:
  - 8926022
categories:
  - Uncategorized
tags:
  - Java Emacs
---
# 

![Real programmers][1]

 [1]: http://imgs.xkcd.com/comics/real_programmers.png

Comecei a utilizar **Emacs** no início da minha primeira iniciação científica, nos idos de 1999. Fui feliz durante muito tempo, escrevendo código em Perl e C, algumas páginas HTML, diversos relatórios em Latex … tudo muito tranqüilo, nenhuma reclamação com aquele ambiente de desenvolvimento.

Eis que por volta de 2002, ao definir a linguagem de programação que iríamos utilizar na [Scylla][2], optamos por **Java**, uma linguagem até então desconhecida para mim. Arregacei as mangas, peguei meu **Emacs**, e mandei bala. Tudo muito tranqüilo, afinal não tinha parâmetro de comparação. Até que fui apresentado ao **Eclipse**: *auto-complete*, *code-checking* durante a digitação, etc e tal – Como pude viver sem isso? – programar em Java ficou muito fácil.

 [2]: http://www.scylla.com.br

Tudo ia muito bem, até há pouco tempo atrás, quando por razões que nem o Padre Quevedo poderia explicar, a configuração de meu ambiente de desenvolvimento foi para o espaço, sem formas de recuperá-lo. Isto, associado à vontade dos orixás da conexão internet intermitente (vulgo péssima estrutura de TI), impediram que eu conseguisse baixar uma outra versão do meu querido **Eclipse**. Após falhar neste teste de paciência, decidi que tinha de voltar a trabalhar com o que eu tinha à mão. Resultado: tirei a poeira do **Emacs** e o coloquei para trabalhar.

O começo foi duro: vários impropérios foram proferidos por conta de erros de digitação que resultavam em erros de compilação; sem contar no aumento de caracteres que tive que passar a digitar – já não me lembrava mais que era preciso escrever imports (aliás, não lembrava que a classe *Connection* estava em *java.sql* e que a classe *DataSource* em *javax.sql* ?). Mas muitos xingos e litros de café depois, me adaptei a esta nova realidade.Neste instante, compreendi claramente a diferença entre [JaL e JaP – (Java a Linguagem x Java a Plataforma – veja os comentários)][3].

 [3]: http://log4dev.com/2007/09/27/viva-a-diversidade/

Não quero defender aqui que a verbosidade de Java, condenada veementemente por alguns, seja um impedimento ao uso da linguagem ( devagar com as críticas Lullis, por favor ![:-D][4] ), mas vejo esta verbosidade como um atributo para melhorar sua forma de programar. Agora, penso melhor no código que escrevo, procuro formas de reaproveitar o código … até mesmo os nomes das variáveis que utilizo são pensadas de forma a *evitar a fadiga*. Coisas que eu não tinha porque me preocupar, pois tudo era muito simples, graças ao poder do *Ctrl Enter*.

 [4]: http://log4dev.com/wp-includes/images/smilies/icon_biggrin.gif

Não defendo tampouco a aposentadoria de ferramentas como o **Eclipse**. Gostaria de voltar a utilizá-lo no futuro. Mas neste instante, pretendo continuar a utilizar o **Emacs** por um bom tempo, forçando-me a melhorar minhas práticas, e então sim, voltar para o **Eclipse**, que inegavelmente é uma ferramenta fantástica para aumento de produtividade.