---
title: 'Sobre Frameworks&#8230;'
author: Raphael Lullis
layout: post
permalink: /2007/12/21/sobre-frameworks/
dsq_thread_id:
  - 64842027
categories:
  - Desenvolvimento
  - Design
  - Teoria
---
# 

Eu odeio frameworks. Não um ódio assim que faz pensar em mandar emails ameaçadores ao criador do ASP.NET, nem um ódio que me faça pensar colocar um vírus no computador de algum líder do projeto Jakarta que só permita que ele edite seu código usando Notepad (ou edlin) para o resto da vida. É um ódio de quem tem a sensação de que **algo está fundamentalmente errado na forma como os desenvolvedores produzem e consomem frameworks de software.**

Quando eu digo isso, a reação tradicional é: “Lullis, você quer o quê? Que todo mundo reinvente a roda? O que você sugere?”

Só posso responder com uma outra pergunta: ***você conhece o Método Socrático? Maiêutica?***

Se você sabe, ótimo. Como eu não tenho como conferir sua resposta, vou tentar dar a minha explicação: o método socrático é um modo de tentar produzir novas idéias (complexas) a partir de um jogo de perguntas e respostas para conceitos mais simples que pertencem ao mesmo contexto.

Por exemplo, suponha que você esteja querendo ensinar cálculo de potências para uma criança. Como um matemático “formal” tentaria transmitir esse conhecimento? Apresentando uma série de colorários, princípios gerais e tentando mostrar todas as definições para a criança, até que ela consiga repetir todos os métodos utilizados pelo seu professor na obtenção de respostas para os problemas pré-estabelecidos.

Um professor que estivesse usando o método socrático certamente começaria fazendo perguntas para as quais os alunos já soubessem. “Usando notação matemática, como vocês fariam para escrever ‘quatro vezes quatro vezes quatro’”? “E se eu quisesse repetir a multiplicação 10 vezes?”. “E se eu quisesse multiplicar infinitamente?”. “E se eu quiser dividir repetidas vezes, ao invés de multiplicar?”. “Quanto é 1 multiplicado por 1?” “Quanto é 1 multiplicado por 1 multiplicado por 1… 100 vezes? E 1000 vezes? E 10?”. Ao deixar as crianças responder essas perguntas, elas mesmas passam a observar os princípios gerais por trás das fórmulas matemáticas. Através da **intuição**, elas desenvolvem quase que por conta própria uma nova “unidade de conhecimento”, ao invés de tê-la transmitida através de um mestre. Um professor socrático atua muito mais como um guia, do que como uma bússola.

Qual sistema é melhor? Muito depende do seu objetivo. Alunos das duas escolas conseguirão responder que A^(-x) é igual (1/A^x). Um o fará quase que por instinto, condicionamento mental. O outro pode até não ter isso cravado em sua cabeça, mas chegará à resposta se tiver desenvolvido a *habilidade de saber fazer as perguntas certas*. “Se ao incrementar o expoente eu multiplico a base, o que aconteceria se eu diminuísse?” 
### Computadores são inúteis. Eles só sabem dar respostas. No espiríto do Método Socrático, eu pergunto: o que acontece numa situação em que as perguntas não possuem uma resposta catalogada?

Provavelmente, o aluno de métodos mais tradicionais (digamos, alguém que passou tempo demais estudando Kumon) vai *travar*, ou voltar para o seu mestre, na esperança de obter as respostas que faltam. Ainda que ele seja capaz de responder por reflexo a equações derivadas de segundo grau, ele não saberá por onde começar caso tenha que jogar [Petals around the Rose][1]. 
### Certo. E o que isso tem a ver com frameworks? Escreva “define: framework” no Google. Um dos termos que você encontrará é “sistema de regras, idéias ou princípios que é usado para planejar ou decidir algo.”

 [1]: http://www.borrett.id.au/computing/petals-bg.htm

Olha só que interessante: ao tentar explicar para você sobre o Método Socrático, eu acabei achando uma das melhores formas de explicar o meu desgosto por frameworks de desenvolvimento.

Frameworks, em sua essência, acabam sendo um “pacote fechado” de soluções prontas para alguém que tem um problema a ser resolvido. “Se você está desenvolvendo um aplicativo e precisa de uma integração Web, use o framework XYZ que te dá autenticação de usuários, geração de código HTML a partir dos seus dados, servidor HTTPS e no fim do dia ainda te faz uma massagem nas costas”. “Se você quer desenvolver software para sistemas embarcados, use o nosso DevKit e você terá um emulador em seu computador, configuração de diversos setups em software, cross-compiler e no fim do dia ainda te daz uma massagem nas costas.”

Se ao menos as promessas de massagem fossem verdade…

O problema, ao meu ver, é que alguém (indivíduo ou grupo associado) que decide implementar um framework se coloca na posição de detentor de um pilha de conhecimento como se fosse “a única verdadeira solução”, quando na verdade esse alguém possui apenas uma compilação de regras e receitas usadas na resolução dos problemas dele. Ou, pior, é uma empresa que está tentando criar a solução definitiva. E, devemos saber, [isso não existe][2].

 [2]: http://en.wikipedia.org/wiki/No_Silver_Bullet

Outra coisa a se pensar – ao menos para os desenvolvedores web – é que a velocidade do surgimento de tecnologias é muito rápida. Mais rápida até do que a capacidade do grupo de assimilar e sedimentar qualquer forma de conhecimento que possa se transformar em um “pacote fechado.” Aí, logo depois que qualquer sistema começa a se consolidar, já haverá parte do grupo tentando forçar a adoção das novas tecnologias e paradigmas, levando ou a um sistema que é abandonado e preterido em favor da Próxima Grande Tecnologia, ou haverá um produto torto, sem identidade. Jack of all trades, Master of none.

E os desenvolvedores que são usuários desses frameworks, meu Deus? Passam tanto tempo aprendendo a lidar com os problemas, aprendem todas as formas de contornar as falhas de design, decoram tantos lotes de informação que, no fundo, acabam tendo que reaprender sistemas inteiros. Tornar-se verdadeiramente produtivo com o tal framework é quase tão trabalhoso quanto implementar você mesmo as funcionalidades prometidas. Que vantagem há nesse processo? 
### Qual a alternativa? Seguindo a analogia, o nosso Software Socrático não é desenvolvido 

*em cima* de uma plataforma ou de um framework, mas utilizando pequenos componentes mais simples e que já são conhecidos suficientemente. Esses elementos menores seriam as unidades de conhecimento necessárias para que, através da intuição, possamos chegar a uma solução que produza o resultado esperado.

Um guia, não uma bússola.