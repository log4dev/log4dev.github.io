---
title: Less is More
author: Raphael Lullis
layout: post
permalink: /2007/12/19/less-is-more/
dsq_thread_id:
  - 64842025
categories:
  - Desenvolvimento
---
# 

“Occam’s Razor” (Navalha de Occam) é uma dessas coisas que a gente escuta por aí, cada um dando uma definição um tanto vaga, que costumam girar em torno de “idéias muito complexas costumam ser erradas” e “entre duas explicações para uma idéia, a mais simples é a correta”.

Pois bem. Se você procurar uma definição, vai ver que (William) Occam é um nome de um filósofo inglês do século XIV, e que “Occam’s Razor” é definido como uma expressão da “Lei da Parcimônia”, ou seja: “Entidades não devem ser adicionadas além do necessário”. Traduzindo: quanto menos conceitos você precisar para explicar e testar uma idéia, melhor.

Penso cá com meus botões – apesar de só ter usado camisetas ultimamente – que essa é uma idéia que não é totalmente assimilada pelos computeiros em geral. Para o nerd tradicional, é divertido quebrar a cabeça resolvendo problemas. Logo, pensa ele, quanto mais complexa a idéia, maior será a recompensa em resolvê-la.

Isso me veio a cabeça lendo o [último texto do Steve Yegge][1], que trata do problema de lidar com grandes bases de código. Alguns trechos abaixo: 
> 
> People in the industry are very excited about various ideas that nominally help you deal with large code bases, such as IDEs that can manipulate code as “algebraic structures”, and search indexes, and so on. These people tend to view code bases much the way construction workers view dirt: they want great big machines that can move the dirt this way and that. There’s conservation of dirt at work: you can’t compress dirt, not much, so their solution set consists of various ways of shoveling the dirt around. There are even programming interview questions, surely metaphorical, about how you might go about moving an entire mountain of dirt, one truck at a time.
> Industry programmers are excited about solutions to a big non-problem. It’s just a mountain of dirt, and you just need big tools to move it around. The tools are exciting but the dirt is not. Ah, você é daqueles que acredita que há a solução para todos os problemas da humanidade, se todo mundo aprendesse a seguir o manual? Dê uma olhada no que se diz a respeito de Design Patterns: 
> Interestingly, sales people didn’t get excited about Design Patterns. Nor did PMs, nor marketing folks, nor even engineering managers. The only people who routinely get excited about Design Patterns are programmers, and only programmers who use certain languages. Perl programmers were, by and large, not very impressed with Design Patterns. However, Java programmers misattributed this; they concluded that Perl programmers must be slovenly, no good bachelors who pile laundry in their closests up to the ceiling. 
> It’s obvious now, though, isn’t it? **A design pattern isn’t a feature. A Factory isn’t a feature, nor is a Delegate nor a Proxy nor a Bridge. **They “enable” features in a very loose sense, by providing nice boxes to hold the features in. But boxes and bags and shelves take space. And design patterns – at least most of the patterns in the “Gang of Four” book – make code bases get bigger. Tragically, the only GoF pattern that can help code get smaller (Interpreter) is utterly ignored by programmers who otherwise have the names of Design Patterns tatooed on their various body parts.
> 
> Dependency Injection is an example of a popular new Java design pattern that programmers using Ruby, Python, Perl and JavaScript have probably never heard of. And if they’ve heard of it, they’ve probably (correctly) concluded that they don’t need it. Dependency Injection is an amazingly elaborate infrastructure for making Java more dynamic in certain ways that are intrinsic to higher-level languages. And – you guessed it – DI makes your Java code base bigger. E você acha que basta ter ferramentas para resolver esse problema? Diga-me, espertinho, como é que as suas ferramentas vão me ajudar a aprender e assimilar os conceitos desnecessariamente complexos empilhados em seu projeto/código? 
> > Most programmers have successfully compartmentalized their beliefs about code base size. Java programmers are unusually severe offenders but are by no means the only ones. In one compartment, they know big code bases are bad. It only takes grade-school arithmetic to appreciate just how bad they can be. If you have a million lines of code, at 50 lines per “page”, that’s 20,000 pages of code. How long would it take you to read a 20,000-page instruction manual? The effort to simply browse the code base and try to discern its overall structure could take weeks or even months, depending on its density. Significant architectural changes could take months or even years.
> > In the other compartment, they think their IDE makes the code size a non-issue. (…) There are several problems with this perspective. One is simple arithmetic again: given enough code, you eventually run out of machine resources for managing the code. Imagine a project with a billion lines of code, and then imagine trying to use Eclipse or IntelliJ on that project. The machines – CPU, memory, disk, network – would simply give up. We know this because twenty-million line code bases are already moving beyond the grasp of modern IDEs on modern machines.

 [1]: http://steve-yegge.blogspot.com/2007/12/codes-worst-enemy.html