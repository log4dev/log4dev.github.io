---
author: laggarcia
comments: true
date: 2009-09-06 22:15:19
layout: post
slug: desenvolvendo-o-eclipse-construindo-seu-primeiro-plug-in
title: Desenvolvendo O Eclipse - construindo seu primeiro plug-in
wordpress_id: 633
categories:
- Desenvolvimento
- Ferramentas
- Linux
tags:
- Desenvolvimento
- Eclipse
- Ferramentas
- Linguagens de Programação
- Linux
- Software Livre
---

Escutamos muito as pessoas falarem em desenvolvimento no Eclipse, utilizando esta ferramenta poderosa como plataforma de desenvolvimento. Para mim o Eclipse é a melhor plataforma de desenvolvimento genérica na qual eu já trabalhei. E, certamente, é uma das melhores plataformas de desenvolvimento para Java (para mim A melhor) e C/C++ (com certeza não A melhor) que eu já usei.

Opiniões pessoais a parte, eu passei três anos, de 2006 a 2008, não apenas utilizando o Eclipse como plataforma de desenvolvimento mas também como produto final do meu trabalho. Ou seja, eu não só desenvolvi no Eclipse. Eu desenvolvi O Eclipse.

Muitas pessoas escutam falar que o Eclipse é uma plataforma extensível. Afinal de contas, se fosse diferente, certamente não teríamos os incontáveis plug-ins para Eclipse que adicionam inúmeras funcionalidades interessantes. O que talvez nem todo mundo saiba é que extender o Eclipse é muito fácil! E talvez por não saberem disso, acabam achando que é algo difícil e não se aventuram por este mundo interessante.

O melhor de tudo é que para extender o Eclipse a única coisa que você precisa é do própio Eclipse! Ou seja, a melhor ferramenta para desenvolver o Eclipse é o próprio Eclipse.

Neste artigo vou abordar o passo-a-passo de como criar um plug-in simples para o Eclipse.

Primeiramente, alguns conceitos. O Eclipse possui o que chamamos de pontos de extensão (extension points). Estes são arquivos XML que possuem configurações que definem possíveis extensões do Eclipse. A plataforma básica já fornece uma série de pontos de extensão que podem ser facilmente utilizados para extender as funcionalidades já disponíveis (por exemplo, neste mini-tutorial iremos criar um novo menu com uma ação específica). À medida em que você for ganhando mais traquejo na implementação de pontos de extensão, você vai naturalmente notar a necessidade de você mesmo criar seus próprios pontos de extensão a partir de coisas que você extendeu anteriormente da plataforma básica (espero falar disso em um post futuro).

Mas vamos ao que interessa a este tutorial. Para começar você vai precisar ter instalado uma máquina virtual Java. Sugiro as da IBM ou da Sun, já que elas funcionam muito bem com o Eclipse. Um aviso aos usuários de Linux: as máquinas virtuais que veem com as distros (GCJ ou iced-tea) em geral não funcionam corretamente e possuem bugs em funcionalidades básicas, tornando difícil ou impossível rodar o Eclipse com elas. Se você já roda o Eclipse como plataforma de desenvolvimento você certamente já possui uma máquina virtual Java instalada.

Depois é necessário instalar o Eclipse SDK. Outro aviso aos usuários Linux: também não recomendo os empacotamentos de Eclipse SDK que vem com as distros. Em geral são ligeiramentes diferentes em relação ao Eclipse distribuído pela Eclipse.org e, muitas vezes, possuem bugs que não existem na versão original.

Quando usado como plataforma de desenvolvimento para Java ou C/C++ não é necessário ter o Eclipse SDK instalado. Basta o runtime do Eclipse. Para instalar o Eclipse SDK basta certificar-se de que você baixou o pacote com o nome Eclipse SDK do site Eclipse.org ou que você tenha instalado a feature "Eclipse Project SDK" através do Update Manager do Eclipse runtime.

Bom, feito isso, siga os seguintes passos:

1) Crie um novo projeto de desenvolvimento de Plug-In para Eclipse.

1.1) Clique no menu _File -> New -> Project..._.

1.2) Selecione a opção _Plug-in Development -> Plug-in Project_ na janela que se abrir e clique no botão "Next".

1.3) Dê um nome para seu projeto, por exemplo `org.eclipse.test` e clique no botão "Next".

1.4) Clique no botão "Next" no próximo passo do Wizard, chamado de "Content".

1.5) No passo de escolha de Templates, selecione o template "Hello, World". Clique no botão "Next".

1.6) No último passo do wizard, não altere nada e clique no botão "Finish".

2) O Eclipse irá perguntar se você deseja alterar a Perspectiva atual para a Perspectiva de desenvolvimento de plug-ins. Clique em "Yes".

3) O Eclipse abrirá o editor no arquivo `MANIFEST.MF`. Este arquivo define as características de seu plug-in como, por exemplo, de quais outros plug-ins ele depende, quais pacotes ele exporta, quais extension points ele extende, quais extension points ele provê e outras configurações. Não vou me ater a este arquivo pois ele não será realmente importante para o desenvolvimento deste caso simples.

4) Utilizando este Template "Hello, World", você verá que o Eclipse criou uma pasta `src/org.eclipse.test.actions` com uma classe `SampleAction.java`. Abra esta classe no editor dando um duplo clique no arquivo.

5) Esta classe possui um método `public void run(IAction action)` que define qual ação será executada ao se clicar no menu que estamos criando. No caso deste template, a ação executada é bem simples: abre-se uma janela com uma mensagem de "Hello, Eclipse world".

6) Para ver seu plug-in em ação numa instância de Eclipse não é necessário instalá-lo, ainda. O Eclipse provê uma funcionalidade através da qual, de dentro do Eclipse, você pode lançar um novo Eclipse que carregará os plug-ins que você está desenvolvendo no seu workspace. Para fazer isto você terá que "executar" seu plug-in de maneira semelhante ao que você já faz para suas aplicações Java ou C/C++.

6.1) Clique no menu _Run -> Run Configurations..._.

6.2) Dê dois cliques em "Eclipse application" no lado esquerdo da janela que se abrir. O Eclipse criará um novo launcher para aplicação Eclipse que, por padrão, a incluirá os plug-ins que estão no seu workspace.

6.3) Clique no botão "Run".

7) Um novo Eclipse será executado. Note que nele aparecerá um menu novo, que não existia na instância anterior de Eclipse, com o nome "Sample Menu". Clique em _Sample Menu -> Sample Action_.

8) Uma janela será aberta com a frase que você definiu na classe `SampleAction.java`.

Parabéns! Você acaba de criar um plug-in para Eclipse ao extender o extension point que permite a adição de novas opções de menu ao Eclipse.

Um tutorial semelhante a este pode ser acessado de dentro do próprio Eclipse através das "Cheat Sheets" providas pelo Eclipse SDK. Clique em Help -> Cheat Sheets... e depois selecione a opção Plug-in Development -> Creating an Eclipse Plug-in na janela que se abrir. Selecione "Create a plug-in" na view que se abrir e siga os passos descritos na tela. Este tutorial, apesar de estar em inglês, possui uma quantidade bem legal de informações sobre como criar plug-ins para Eclipse com links explicando vários conceitos relacionados. Vale a pena!
