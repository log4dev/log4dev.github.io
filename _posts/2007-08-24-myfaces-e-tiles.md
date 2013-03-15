---
title: MyFaces e Tiles
author: Alexandre Barbosa
layout: post
permalink: /2007/08/24/myfaces-e-tiles/
dsq_thread_id:
  - 64842285
categories:
  - Desenvolvimento
tags:
  - Ferramentas
  - Interfaces
  - Java
  - Web
---
# 

Estou iniciando o desenvolvimento de uma aplicação utilizando [MyFaces][1]. Esta escolha se deu porque gosto do esquema do [Java Server Faces (JSF)][2], e após ter trabalhado com a implementação **JSF** da **Sun,** resolvi dar uma chance ao **MyFaces,** pois parece ter algumas soluções interessantes para alguns problemas que enfrentei com o anterior. Em conjunto, estou utilizando diversas componentes providas pelo [Tomahawk][3], que extendem as funcionalidades das componentes básicas do **JSF**, além de oferecer diversas outras componentes.

 [1]: http://myfaces.apache.org/
 [2]: http://java.sun.com/javaee/javaserverfaces/
 [3]: http://myfaces.apache.org/tomahawk/

**JSF** é muito bom, mas não resolve todos os problemas. Um destes problemas é a questão de gerenciamento de layouts – em **JSF**, se você quiser que todas as páginas de sua aplicação obedeçam a um mesmo layout, você tem que replicá-lo em todas as suas páginas; imagine se depois você quiser mudar esse **layout**, o problema que não vai ser alterar todas as páginas. Para resolver este problema, integramos ao** JSF** o [Tiles][4]. Este é um framework inicialmente desenvolvido dentro do [Struts][5], mas que agora foi separado deste, que simplifica o desenvolvimento de interfaces de aplicações web. Ele se baseia no padrão **Composite View**, permitindo que se definam fragmentos de página (menu, header, footer, etc …), que podem ser agrupados em um layout, que pode ser aplicado às suas páginas. O conceito é bastante interessante, e para quem quiser mais detalhes, sugiro que leia o [tutorial do Tiles][6].

 [4]: http://tiles.apache.org/
 [5]: http://struts.apache.org/
 [6]: http://tiles.apache.org/tutorial

Vou aqui explicar como estou realizando esta integração. A primeira coisa que fiz foi definir a estrutura do meu layout, que é composto por: 
*   Header
*   Menu
*   Conteúdo Basicamente, o header e o menu são sempre o mesmo. A única coisa que varia é o conteúdo a ser exibido. Com isto, defini uma página ( layout.jsp ) onde defini o posicionamento destas componentes de 

**layout**, e a utilizei em uma **definition** no arquivo de configuração do **Tiles**: 
    
                 
                 
                 
           Note que para cada componente do 

**layout** há uma página associada. Estes valores podem ser alterados em tempo de execução, e irei utilizar esta funcionalidade para exibir diferentes conteúdos da minha aplicação (alterando a página a ser exibida pela componente *content*. Abaixo, mostro o código de *layout.jsp*, onde posiciono um elemento embaixo do outro: 
    
          
               
          
          
               
          
          
               
           Um problema desta forma de integração que adotei é que, para cada página (conteúdo) que desejo exibir, preciso criar dois arquivos jsp: um para definir o conteúdo, e outro para inserir este conteúdo dentro do 

**layout**. Abaixo, um exemplo da página que insere o conteúdo dentro do **layout**. Note-se que isto é feito utilizando a **definition** que criamos anteriomente, e sobrescrevendo-se a propriedade *content*: 
    
              
                 
              
           Certamente esta não é a melhor solução, mas foi a primeira que veio à minha cabeça. No futuro, pretendo gastar um pouco de neurônios pensando em uma forma de gerar apenas um arquivo jsp por página a ser exibida.

Para configurar o **Tiles** para ser utilizado pelo **JSF,** basta você acrescentar o seguinte código em seu arquivo web.xml (além dos jar’s do** Tiles**): 
    
           tiles
           org.apache.tiles.servlet.TilesServlet
           
              org.apache.tiles.DEFINITIONS_CONFIG
              /WEB-INF/tiles-defs.xml
           
           2
         Nesta solução, o que eu gostaria de alcançar era: 

*   facilidade de gerenciamento de **layout**
*   manter o controle de navegação do **JSF**
*   facilidade de integração Tirando o overhead de gerar um arquivo a mais por página gerada, acho que a solução é boa. E tem funcionado bem para os meus propósitos. Se você tiver alguma sugestão, dica, crítica, não esqueça de deixar seu comentário. Se preferir, podes entrar em contato pelo alexandre(at)log4dev.com. 

Powered by [ScribeFire][7].

 [7]: http://scribefire.com/