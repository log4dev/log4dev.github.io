---
title: Vazamento de memória em Java
author: Miguel Galves
layout: post
permalink: /2008/10/25/vazamento-de-memoria-em-java/
dsq_thread_id:
  - 8925992
categories:
  - Desenvolvimento
tags:
  - Java
---
# 

**Isso existe?!**

Sim….

Uma das grandes coisas que Java trouxe para o mundo do desenvolvimento foi uma moderna JVM, e um Garbage Colector eficiente, que foi se aprimorando ao longo dos anos. Com isto, o desenvolvedor pode deixar de se preocupar com questões de alocação e liberação de memória, fontes de perdas de cabelos e noites de sono perdidas de muitos programadores C/C .

Nestas linguagens, um vazamento de memória se caracteriza como sendo uma região do heap alocada pelo desenvolvedor em algum momento do ciclo de vida de um software, cujo ponteiro se perde. Assim sendo, fica impossível (ou pelo menos extremamente difícil) recuperar esta área de memória para uso futuro. O efeito imediato é que o consumo de memória vai aumentando com o tempo, até tornar o sistema inviável.

É fato que este tipo de situação não existe em Java, uma vez que em última instância, a JVM sempre terá uma referência para uma área de memória alocada pelo desenvolvedor, e cuidará de fazer a limpeza caso necessário. Mágica? Não, tecnologia. Explicando de forma beeeeeeeeeeem resumida, o GC mantém uma contagem de quantas referências criadas pelo desenvolvedor apontam para um determinado objeto. Quando este contador chega a zero, está na hora de limpar a memória, pois com certeza esta não será mais útil.

Fica claro então que áreas de memória nunca serão perdidas em Java.

**Miguel, você bebeu? Como é que vazamentos podem ocorrer então? **

Bom, quem nunca perde a referência é a JVM.  Mas é possível perder o controle das referências para um objeto. Como eu disse antes, o GC coleta objetos sem referência. Mas e se você esquecer que tem referências perdidas no código e não zerá-las? Aí o objeto nunca será removido, e podemos ter um vazamento de memória, segundo Java. Para apaziguar certos ânimos, passarei a chamar este problema de **Travamento de memória**.

A boa notícia é que é bem mais fácil consertar em Java, e isto só se torna um problema real em grandes projetos que criam muitos objetos ao longo do tempo. Se você desenvolve exclusivamente para Web usando servidores de aplicação como JBoss, provavelmente pode fechar este artigo e voltar às suas atividades cotidianas.

A má notícia é que como se criou o mito de que este tipo de situação é impossível, ninguém hoje em dia se preocupa mais com isso. Não que isto seja ruim por si só. O problema é que quando suspeitamos de que isso pode estar acontecendo, consertar pode ficar mais complexo.

Uma situação clássica que pode gerar travamentos é o uso de Observers/Observables. Suponha que você tenha um objeto A do tipo Observable, e que ao longo da vida do seu software, você crie constantemente novas intâncias de objetos do tipo B que se cadastram com observadores de A. Nesta arquitetura, A contém referências a todos as intâncias de B, de forma não explícita (ou seja, contém referências à interface Observer). Basta alguém esquecer de limpar a referência da lista de observers e pronto…memória travada!

Como resolver isso? Bem, tentar racionalizar o processo de criação e limpeza de objetos, centralizando estes processos em pontos bem controlados. O processo de “limpeza” de recursos é muito importante, sobretudo quando a árvore de objetos e referências for grande.

==========================

Nota do dia 26/10

Como bem lembrado pelo leitor Thiago, uma outra possível solução é o uso de WeakReferences em Java. Um objeto deste tipo funciona como uma referência normal em Java, mas não trava o GC: caso um objeto seja referenciado apenas por WeakReferences, ele será coletado normalmente. Vale a pena olhar este artigo:

[http://www.ibm.com/developerworks/java/library/j-jtp11225/index.html ][1]

 [1]: http://www.ibm.com/developerworks/java/library/j-jtp11225/index.html