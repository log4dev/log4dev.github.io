---
title: 'Casa de ferreiro&#8230;'
author: Miguel Galves
layout: post
permalink: /2008/02/17/casa-de-ferreiro/
dsq_thread_id:
  - 64846390
categories:
  - Desenvolvimento
tags:
  - Base de Dados
  - Ferramentas
  - job4dev
---
# 

A bruxa estava solta no final de semana. Passou pelo [Job4Dev][1] e apertou o botão *FODA-SE SISTEMA* (uma variante do botão [*FODA-SE Rubinho*, ][2]muito usado pela Ferrari).

 [1]: http://job4dev.com
 [2]: http://miguelcomenta.wordpress.com/2006/12/23/botao-vermelho/

Na sexta, o sistema de markdown parou de funcionar. Sem mais nem menos. Nada foi mexido no sistema. Ele funcionava, e depois deixou de funcionar. Foi resolvido: era uma simples questão de path. Mas mesmo assim eu pergunto: como alguém ainda pode dizer que a computação é uma ciência exata?

Tá bom, provavelmente este vai ser mais um daqueles bugs misteriosos cujo computador é o primeiro a levar a culpa (“eu tenho certeza que funciona, não tem como não funcionar, a culpa é deste micro lazarento que não sabe nem processar um if decentemente”), e que depois a gente percebe que a culpa é do desenvolvedor. Esta constatação em geral é seguida por um “Ahhhhhhhh..”

Logo em seguida, um erro de operação (famosa problema de interface cadeira-teclado) fez com que a base de dados fosse pro beleléu. E obviamente, em casa de ferreiro espeto de pau: isto aconteceu logo depois de eu escrever um [post sobre a importância do backup][3]. E obviamente eu não tinha um backup local configurado. **OBVIAMENTE**.

 [3]: http://log4dev.com/2008/02/10/backup-ear-e-preciso/

Não querendo esperar o pessoal do [webfaction][4] encontrar o backup no meio de toneladas de arquivos, tomei duas decisões: 
1.  Restaurar os anúncios mais importantes/mais recentes na mão e aproveitar pra fazer uma limpeza geral no sistema.
2.  Montar um sistema de backup local. Os mais astutos perceberão que o [post sobre o pgpass][5] foi fruto desta tarefa. Estamos no ar novamente, e agora com um sistema muito mais rápido, estável, confiável e a prova de manipulações desastrosas.

 [4]: http://www.webfaction.com/?affiliate=mushroom
 [5]: http://log4dev.com/2008/02/16/pgpass/