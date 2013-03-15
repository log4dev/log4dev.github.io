---
title: MyFaces e Spring Web Flow
author: Alexandre Barbosa
layout: post
permalink: /2007/10/18/myfaces-e-spring-web-flow/
dsq_thread_id:
  - 64841977
categories:
  - Desenvolvimento
tags:
  - Java
  - Web
---
# 

Mais uma da série **“MyFaces e …”**. Há algum tempo atrás, escrevi sobre a integração entre [MyFaces e Tiles][1], para resolver o problema de gerenciamento de layouts. Agora, irei falar sobre como resolver a limitação do [JSF][2] no que diz respeito ao controle de escopo de *managed beans*.

 [1]: http://log4dev.com/2007/08/24/myfaces-e-tiles/
 [2]: http://java.sun.com/javaee/javaserverfaces/

Aqueles que desenvolvem aplicações web com JSF sabem que este framework possui três níveis de escopo: *request*, *session* e *application*. Para os desavisados isto parece bom, mas não irá demorar muito para você perceber que existe uma lacuna grande aqui – você com certeza irá precisar de um escopo que seja maior que *request*, e menor que *session*.

Um caso bem simples é o de utilizar *commandLinks* ou *commandButtons* dentro de um *dataTable* utilizando escopo *request* – ao clicar no link ou botão, simplesmente nada acontece, porque isto inicia uma nova requisição, mas os dados da *dataTable* que está sendo referenciada pelo link ou botão acionado não existe mais, pois estava disponível somente na requisição anterior. Solução número 1: colocar o dataTable no escopo *session*. A partir daí, tudo funciona … mas os dados ficam inutilmente ocupando espaço de memória até que a sessão se encerre. Para este problema específico, o **MyFaces** extendeu esta componente, criando o atributo preserveDataModel, que indica se o estado dos dados devem ser descartados antes dos dados serem novamente exibidos. No entanto, há outros casos que seria útil ter um escopo intermediário: casos de uso onde os dados são preenchidos em mais de uma requisição (agendamento de hotel, por exemplo); executar o mesmo caso de uso em duas janelas (tabs) na mesma sessão de usuário …

Alguns frameworks oferecem soluções para este problema: [JBoss Seam][3], [Shale Dialog Manager][4], [Spring Web Flow][5]. O primeiro parece muito bom, e aparentemente resolve bem este, e outros problemas. Os outros dois atacam especificamente o problema do controle de escopo, através do controle dos fluxos de requisições dos casos de uso. Por eu estar preocupado somente com o problema de escopo, descartei o **JBoss Seam** – seria um tiro de canhão pra matar uma mosca – e foquei nos outros dois.

 [3]: http://www.jboss.com/products/seam
 [4]: http://shale.apache.org/shale-dialog/index.html
 [5]: http://www.springframework.org/webflow

Comecei com o **Shale Dialog Manager**, que conforme consta, foi fortemente inspirado no **Spring Web Flow (SWF)**. Infelizmente, ele apresentou algumas limitações que me fizeram desistir dele: 
1.  Você não pode iniciar um outro fluxo estando no meio de outro (exceto que você o defina como parte do fluxo) – parte dos casos de uso de minhas aplicações são acessíveis por meio de menus – se para cada fuxo de operação (caso de uso) eu tivesse que inserir os fluxos acessíveis pelo menu, eu só faria isso na vida
2.  Não é possível executar o mesmo fluxo em duas janelas (tabs) diferentes na mesma sessão Dado isto, passei a testar o 

**SWF**, e a vida se tornou maravilhosa. Em primeiro lugar: a documentação é excelente – poucas vezes na vida encontrei um software open source tão bem documentado (recomendo a leitura do [artigo do Leonardo ][6]que fala a respeito deste assunto); a integração com **JSF** é muito simples (aliás, o **SWF** é independente de tecnologia de apresentação – funciona com **JSF**, [Struts][7], [Tapestry][8], etc); não possui as limitações do **Shale Dialog Manager**; possui suporte a testes de unidade e testes de sistema dos fluxos de execução.

 [6]: http://log4dev.com/2006/06/14/leonardo-garcia-software-livre-e-processos-de-qualidade-de-software/
 [7]: http://struts.apache.org/
 [8]: http://tapestry.apache.org/

A integração do SWF com o MyFaces é bastante simples, e bastante bem [documentada][9]. Para definir cada fluxo, você deve criar um arquivo xml para cada um deles (este é o único ponto que não me deixou muito satisfeito, mas …). Os fluxos podem ser definidos por: 
*   **ViewState**: utilizado para definir uma interface a ser exibida, através da qual o usuário fornecerá dados ao sistema
*   **ActionState**: utilizado para executar ações de negócio, e definir o próximo estado do fluxo baseado no resultado da execução
*   **DecisionState**: realiza uma decisão sobre próximo estado do fluxo, através do teste de expressões booleanas
*   **SubflowState**: inicia um novo fluxo como subfluxo do fluxo atual, permitindo a passagem de parâmetros
*   **EndState**: indica o estado final de um fluxo, determinando o fim de sua execução Com apenas estes estados, é possível definir os mais complexos fluxos de operação de uma aplicação web. No meu modo de ver, este framework é excepcional. Recomendo fortemente. E se você ainda não conhecia nada com relação ao

[ Spring Framework][10], sugiro que você dê uma olhadinha em tudo o que ele pode fazer, e seus subprojetos. Para o desenvolvedor **Java**, pode ser extremamente útil, podendo complementar, ou mesmo substituir diversas tecnologias **J2EE**. 
Powered by [ScribeFire][11].

 [9]: http://static.springframework.org/spring-webflow/docs/current/reference/flow-executor.html#executor-jsf
 [10]: http://www.springframework.org/
 [11]: http://scribefire.com/