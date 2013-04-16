---
author: laggarcia
comments: true
date: 2009-05-16 19:33:08
layout: post
slug: problemas-com-c-cedilha-no-linux
title: Problemas com c-cedilha no Linux
wordpress_id: 554
categories:
tags:
- Gnome
- KDE
- Linux
- Software Livre
---

Eu não consigo entender como, até hoje, ainda é possível que eu tenha problemas com coisas simples no Linux como, por exemplo, o c-cedilha.

Como já disse em posts anteriores, eu uso bastante Fedora com Gnome por questões profissionais e, até hoje, eu nunca consegui instalar um Fedora que viesse com o c-cedilha funcionando "corretamente" out-of-the-box no Gnome com as configurações de linguagem e teclado que eu uso (sistema em inglês e teclado US com deadkeys). Pelo menos não do Fedora 4 ao Fedora 10, que foram os que eu usei. Eu não me incomodava muito com isso porque, depois de um tempo, acabei me acostumando a editar na mão o arquivo `/etc/gtk-2.0/i386-redhat-linux-gnu/gtk.immodules` adicionando o trecho em vermelho na linha abaixo:
`
"/usr/lib/gtk-2.0/2.10.0/immodules/im-cedilla.so"
"cedilla" "Cedilla" "gtk20" "/usr/share/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"
`
como está "documentado" em vários fóruns na Internet. Eu vivia em paz com isso. A única coisa relativamente chata era ter que editar o arquivo toda vez que o gtk fosse atualizado. Como eu atualizo diariamente a minha máquina, isso acabava acontecendo vez ou outra. Mas, como eu disse, eu estava em paz com este _overhead_.

O único problema que eu tinha era o Skype. O Skype é feito em cima do Qt, que é uma biblioteca do KDE e, por isso, não obedece as configurações do Gnome. Lá, toda vez que eu digitava "acento-agudo-c" saia 'ć'. Mas, tudo bem, eu nem falo com tanta gente via chat pelo Skype mesmo. Dava pra levar.

Até que, este ano, uma nova necessidade surgiu: eu precisei começar a escrever mais ativamente textos em Latex. Bom, acho que já exprimi meu descontentamento com soluções derivadas do Latex neste blog mas este não é o assunto deste post. Digamos que não havia muita escolha, então eu fui em frente. No entanto, depois de conversar com algumas pessoas, o melhor software para edição de arquivos .tex que me apareceu até agora foi o Kile. O problema é que o Kile também faz parte do KDE e, portanto, não segue a configuração de c-cedilha do Gnome. Mas, agora, isso passava a ser um problema ingerenciável. Afinal de contas, como escrever textos científicos, em português, sem c-cedilha?!

<flame>

Por favor, caso alguém saiba, ajude-me a esclarecer esta dúvida: Quem é que, por Deus, possui um 'c' com acento agudo em sua língua? ć?! Qual é o som disso?! Dúvido que mais povos usem ć do que ç para eles alterarem este comportamento no Linux. Antigamente (há uns 7 anos) não existia 'ć', porque agora existe? Me fala ai quem é que foi que alterou isso!

</flame>

Tentei resolver este "probleminha" de várias formas. No meio do caminho eu até descobri que &lt;Alt+c&gt; no Linux produz c-cedilha também. Quer dizer, apenas quando se usa o &lt;Alt&gt; direito (&lt;Alt Gr&gt; se não me engano), mas já é alguma coisa. Tá aí: até então eu nem sabia porque em alguns teclados os &lt;Alt&gt; tinham nomes ligeiramente diferentes. Afinal, porque nomes diferentes para a mesma tecla? Como eu era ingênuo...

Mas eu me recusava a me adaptar ao sistema. O sistema tinha que se adaptar a mim! Claro!

Bom, depois de ler vários fóruns, depois de tentar várias coisas, depois de perder a paciência inúmeras vezes... eu desisti. E passei a pensar que, se existem várias pessoas que adoram Mac OS e se submetem a utilizar seqüências exdrúxulas de caracteres para ter coisas como c-cedilha, eu também poderia me adaptar ao &lt;Alt+c&gt;. Não gosto de me nivelar por baixo, mas fazer o que? Ah, antes que alguém me jogue pedras... nivelar por baixo neste caso. Eu nem mesmo uso ou usei Mac OS, mas já li em alguns lugares no passado que esta limitação existia em teclados da Apple. E isso para mim era um ultraje para um sistema que todos diziam ser amigável.

Bom, o fato é que pouco mais de dois meses depois de me rebaixar a aceitar o &lt;Alt+c&gt; como solução para o c-cedilha eu nem mesmo percebo mais. Estou totalmente adaptado. Sem problemas. E sem ter que editar o arquivo de configuração do gtk toda vez que ele é atualizado.

Mas, apesar de já estar adaptado e de provavelmente não querer mais voltar atrás, eu ainda digo: no Windows eu nunca tive este problema.

_Nota: Engraçado, nos últimos tempos eu ando falando mal do Linux em diversos posts. Antes que algumas pessoas achem que eu não goste do Linux, tenho que dizer que, muito pelo contrário, o Linux é o sistema operacional onde eu me sinto mais a vontade. Porém isso não quer dizer que eu não veja defeitos nele. Aliás, provavelmente eu vejo muito mais problemas nele do que em outros sistemas operacionais porque simplesmente eu passo quase que a totalidade do meu tempo na frente de computadores rodando Linux devido ao meu trabalho._
