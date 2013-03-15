---
title: A grama do vizinho
author: Miguel Galves
layout: post
permalink: /2009/10/11/a-grama-do-vizinho/
dsq_thread_id:
  - 64842356
categories:
  - Desenvolvimento
  - Negocios
  - Opinião
---
# 

Eu ando meio ausente deste blog. Percebo que a atividade de escrever requer tempo, e sobretudo, ócio criativo. Raramente consigo escrever um texto entre uma atividade e outra, menos quando são textos com notícias breves, como este sobre o [Job4Dev no UOL][1]. E o leitor há de se perguntar: “o que toma tanto o tempo deste pobre rapaz?”.

 [1]: http://log4dev.com/2009/10/06/uol/

Respondo: o [SigaSeuTime][2], startup que vem crescendo de forma animadora e que me tem tomado todo o tempo livre fora do horário comercial (sim, porque no horário comercial eu brinco de desenvolver sistemas de controle de tráfego aéreo, que ainda é a minha fonte de renda principal…e única).

 [2]: http://www.sigaseutime.com.br

Mas, acreditem, não passa um dia sequer sem que eu pense que deveria me dedicar mais a este espaço. E não passa um dia sequer sem que eu leve sermão do Raphael por não meter mais a mão no **Job4Dev** (assumi o papel de captador de vagas…). Mas isto é assunto pra outro dia.

Vou aproveitar o momento de inspiração para relatar uma experiência que tive recentemente trabalhando com o **SigaSeuTime**, que me parece interessante.

O ditado “A grama do vizinho é sempre mais verde” se aplica a quase todas as áreas do comportamento humano: nós temos uma tendência a achar que o que os outros têm é melhor. Em termos de linguagem de programação, o fanatismo de certos grupos tende a contrariar este ditado: é muito raro algum fã de uma linguagem admitir falhas, e ver outras opções como sendo mais eficientes, modernas, seguras…

Eu já comentei em algum outro texto que o conjunto **Python/Django** funcionou como um catalizador da minha capacidade produtiva/criativa. Sempre tive várias idéias (não forçosamente boas) mas tinha uma grande dificuldade de colocá-las em prática em **Java** (que é a minha linguagem de atuação profissional), e **Python** me permitiu concretizar algumas de forma rápida e eficiente.

Hoje, depois de uma boa quantidade de linhas de código escritas nesta linguagem, das quais a grande maioria em produção de forma estável  no **SigaSeuTime** e no [**Job4Dev**][3], me pego pensando em algumas características presentes em linguagens como **Java** que eu sinto falta. Na verdade, existe uma principal: **tipagem de parâmetros de funções e métodos**. Apesar dos amantes de **Python** me dizerem por meio de comentários que eu preciso mudar minha forma de pensar, ainda acho que tipagem de parâmetros facilita a leitura de códigos alheios, e que sobrecarga de métodos é um recurso bastante elegante e útil.

 [3]: http://job4dev.com

Por vários motivos, incorporei um subsistema em Java dentro do SigaSeuTime, que implementa uma das plataformas. Este subsistema foi desenvolvido por um programador freelancer, e recentemente tive que mexer no código para fazer algumas adaptações. E foi um ótimo estudo comparativo de ambientes: **Java/Eclipse** vs **Python/Emacs** (já testei Python/Eclipse, e não vi grandes vantagens…). Cheguei à conclusão de que, no quadro da minha startup, entre a rede de proteção gigantesca oferecida por Java e a rapidez de desenvolvimento oferecida por Python, eu ainda prefiro a segunda opção.

Não trabalhei em projetos com muitos desenvolvedores em Python (no máximo, eu e mais um ou dois), e tenho certeza de que a rede de proteção de Java evita muitos problemas potenciais de gente mexendo onde não devia, chamadas erradas, etc… Mas como eu sempre trabalhei com pessoas de alto nível no SigaSeuTime e no Job4Dev, a eficiência do ciclo de desenvolvimento/deploy do Python (e das linguagens de script dinâmicas em geral) me parece ser muito vantajosa em um projeto onde o importante é desenvolver rápido para colocar em produção rápido.

E quando eu digo rápido, significa eventualmente resolver um bug no código em produção, através de um Vi ou Emacs rodando em um terminal SSH. Sim, eu já fiz isso mais de uma vez, para o desespero de muitos dos leitores deste blog e defensores de CMMIs da vida.

Grandes empresas precisam implementar processos e mecanismos de controle para organizar o crescimento (muitas vezes desordenado) de pessoas, muitas vezes acompanhado pela redução da qualidade média dos desenvolvedores.

Em ambientes pequenos de startup, onde é possível imaginar uma equipe apenas composta por boas pessoas, os controles e processos são desnecessários e muitas vezes indesejáveis. Neste contexto, todas aquelas preocupações enterprise padrões devem ser deixadas de lado, e os participantes do projeto devem focar suas energias em apenas duas coisas: tornar o projeto uma realidade e trabalhar para que ele seja viável economicamente. O resto é resto…