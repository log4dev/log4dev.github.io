---
theme:
  name: twitter
author: laggarcia
comments: true
date: 2007-10-18 23:48:49
layout: post
slug: turing-completeness-pra-que-linguagens-de-programacao
title: Turing completeness (Pra que linguagens de programação?)
wordpress_id: 198
categories:
- Desenvolvimento
- Humor
- Teoria
tags:
- Hardware
- Linguagens de Programação
---

Pessoal, primeiro queria me desculpar por minha ausência neste blog nos últimos tempos... Infelizmente eu acho que eu sou o colaborador mais esparso por aqui e não tenho grandes perspectivas de melhorar minha taxa :-/ De qualquer forma, como o Miguel ainda não me expulsou, continuo na ativa para a felicidade (ou não) dos dois leitores deste blog (não fossem os comentários de outras pessoas e as estatísticas do blog eu chegaria a acreditar piamente que só o Raphael e o Bruno lêem este blog nos últimos tempos... obrigado pela participação de todos!). :)

Como todos devem saber, o Raphael e o Bruno vêm há algum tempo em uma discussão (às vezes) quase religiosa com dezenas de comentários sobre o artigo "[Viva a diversidade!](http://log4dev.com/2007/09/27/viva-a-diversidade/)" do Miguel. Muita gente deve estar cheia de ler os comentários deles! Eu, inclusive, já passei por uma fase assim, mas acabei lendo todos os comentários em batch depois. Acho que é isto que levou o Miguel a "censurar" (será?) os dois. :) De qualquer forma, acho que este blog deve ser um meio livre de expressão. Se eles querem se matar discutindo um assunto que, a meu ver, não tem muito sentido, deixa eles lá.

De certa forma, discussões grandes como esta acabam gerando ligações com assunto muitas vezes nada a ver com a discussão principal. E foi exatamente isso que me chamou a atenção [neste comentário](http://log4dev.com/2007/09/27/viva-a-diversidade/#comment-4022) do Raphael. Mais especificamente, a seguinte parte me chamou a atenção: "Em última análise, TODAS as linguagens são possíveis de se fazer QUALQUER tipo de construção lógica. Se não fosse assim, elas não seriam Turing-Complete, tampouco mereceriam o nome “Linguagem de Programação”."

Isso me lembrou de um fato que eu aprendi há muito tempo e que é uma daquelas coisas que não mudam sua vida porque provavelmente você nunca mais vai ter que lembrar dele no seu dia-a-dia mas fazem com que tudo  faça sentido (se um dia você estiver buscando a essência das coisas, como eu acho que o Raphael estava quando ele escreveu esta frase).

Turing completeness é um conceito que, na verdade, estrapola linguagens de programação. Qualquer máquina abstrata ou linguagem de programação que seja capaz de executar qualquer tarefa computacional é classificada como turing complete.

Quando você desce o nível, das linguagens de programação de alto nível para as coisas mais essenciais, como assembly e linguagem de máquina, você vai descobrir que ser turing complete nada mais é do que [ser capaz de executar pouco mais de meia dúzia de instruções](http://www.rdrop.com/~cary/html/minimal_instruction_set.html). Descendo mais o nível, veríamos que para projetar um circuito lógico capaz de executar todo este conjunto de instruções você precisaria de apenas um tipo de portas lógicas: ou só [NANDs](http://hyperphysics.phy-astr.gsu.edu/hbase/electronic/nand.html#c1) ou só [NORs](http://hyperphysics.phy-astr.gsu.edu/hbase/electronic/nor.html#c1). Você não vai precisar de mais que dois transistores para fazer cada uma destas portas lógicas. Duvida? [Aqui](http://hyperphysics.phy-astr.gsu.edu/hbase/electronic/trangate.html#c3) e [aqui](http://hyperphysics.phy-astr.gsu.edu/hbase/electronic/trangate.html#c5).

Desta forma, eu acho que toda esta discussão sobre qual linguagem de programação é melhor realmente é inócua. Parodiando o [célebre post](http://groups.google.com/group/comp.os.minix/msg/2194d253268b0a1b) de Linux Torvalds, homens de verdade precisam apenas de máquinas turing complete. Nada mais!

E é por isso que eu conclamo todos vocês a largarem toda esta porcariada de frameworks, modelos de programação, orientação à objeto, programação funcional, lambdas e o escambal e passemos todos a projetar tudo que precisamos fazer em termos de NANDs (por um gosto pessoal eu prefiro o NAND ao NOR, mas, para não parecer inflexível, acho que podemos liberar o NOR também). Caso alguém realmente precise de algo de mais alto nível, são permitidos [os instructions set mínimos](http://www.rdrop.com/~cary/html/minimal_instruction_set.html) ou, já que eu sou uma pessoa benevolente, o uso da linguagem [Whitespace](http://compsoc.dur.ac.uk/whitespace/), que, segundo o artigo sobre instruction set mínimo, chega perto de algo minimalista (mas não deixa de ser uma linguagem de alto nível, na minha opinião, então use com parcimônia). Coisas como [Path language](http://pathlang.sourceforge.net/) nem pensar. Elas não são suficientemente minimalistas, por mais que a home page dela te faça pensar o contrário.

Com estas tecnologias (e apenas com elas!) acho que daqui há uns 200 anos conseguiremos chegar num nível tecnológico suficiente para termos blogs funcionando novamente. Quem sabe assim eu não ganho tempo suficiente para pensar no meu próximo artigo... :)

Nota: Antes que alguém me acuse de reacionário: esta é uma obra de ficção. Qualquer relação dela com seu autor ou com qualquer outra pessoa é azar deles.
