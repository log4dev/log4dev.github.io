---
author: alexandre
comments: true
date: 2007-08-24 11:08:21
layout: post
slug: myfaces-e-tiles
title: MyFaces e Tiles
wordpress_id: 175
categories:
- Desenvolvimento
tags:
- Ferramentas
- Interfaces
- Java
- Web
---

Estou iniciando o desenvolvimento de uma aplicação utilizando [MyFaces](http://myfaces.apache.org/). Esta escolha se deu porque gosto do esquema do [Java Server Faces (JSF)](http://java.sun.com/javaee/javaserverfaces/), e após ter trabalhado com a implementação **JSF** da **Sun,** resolvi dar uma chance ao **MyFaces,** pois parece ter algumas soluções interessantes para alguns problemas que enfrentei com o anterior. Em conjunto, estou utilizando diversas componentes providas pelo [Tomahawk](http://myfaces.apache.org/tomahawk/), que extendem as funcionalidades das componentes básicas do **JSF**, além de oferecer diversas outras componentes.

**JSF** é muito bom, mas não resolve todos os problemas. Um destes problemas é a questão de gerenciamento de layouts - em **JSF**, se você quiser que todas as páginas de sua aplicação obedeçam a um mesmo layout, você tem que replicá-lo em todas as suas páginas; imagine se depois você quiser mudar esse **layout**, o problema que não vai ser alterar todas as páginas. Para resolver este problema, integramos ao** JSF** o [Tiles](http://tiles.apache.org/). Este é um framework inicialmente desenvolvido dentro do [Struts](http://struts.apache.org/), mas que agora foi separado deste, que simplifica o desenvolvimento de interfaces de aplicações web. Ele se baseia no padrão **Composite View**, permitindo que se definam fragmentos de página (menu, header, footer, etc ...), que podem ser agrupados em um layout, que pode ser aplicado às suas páginas. O conceito é bastante interessante, e para quem quiser mais detalhes, sugiro que leia o [tutorial do Tiles](http://tiles.apache.org/tutorial).

Vou aqui explicar como estou realizando esta integração. A primeira coisa que fiz foi definir a estrutura do meu layout, que é composto por:



	
  * Header

	
  * Menu

	
  * Conteúdo


Basicamente, o header e o menu são sempre o mesmo. A única coisa que varia é o conteúdo a ser exibido. Com isto, defini uma página ( layout.jsp ) onde defini o posicionamento destas componentes de **layout**, e a utilizei em uma **definition** no arquivo de configuração do **Tiles**:

    
    
          <definition name="layout" template="/layout.jsp" >
                 <put-attribute name="header" value="/header.jsp" />
                 <put-attribute name="menu" value="/menu.jsp" />
                 <put-attribute name="content" value="/blank.jsp" />
          </definition>


Note que para cada componente do **layout** há uma página associada. Estes valores podem ser alterados em tempo de execução, e irei utilizar esta funcionalidade para exibir diferentes conteúdos da minha aplicação (alterando a página a ser exibida pela componente _content_. Abaixo, mostro o código de _layout.jsp_, onde posiciono um elemento embaixo do outro:

    
    
          <tiles:importAttribute scope="request" />
          <f:subview id="header">
               <tiles:insertAttribute name="header" flush="false"/>
          </f:subview>
          <f:subview id="menu">
               <tiles:insertAttribute name="menu" flush="false"/>
          </f:subview>
          <f:subview id="content">
               <tiles:insertAttribute name="content" flush="false"/>
          </f:subview>


Um problema desta forma de integração que adotei é que, para cada página (conteúdo) que desejo exibir, preciso criar dois arquivos jsp: um para definir o conteúdo, e outro para inserir este conteúdo dentro do **layout**. Abaixo, um exemplo da página que insere o conteúdo dentro do **layout**. Note-se que isto é feito utilizando a **definition** que criamos anteriomente, e sobrescrevendo-se a propriedade _content_:

    
    
          <f:view>
              <tiles:insertDefinition name="layout" flush="false" >
                 <tiles:putAttribute name="content" value="/pageContent.jsp" />
              </tiles:insertDefinition>
          </f:view>


Certamente esta não é a melhor solução, mas foi a primeira que veio à minha cabeça. No futuro, pretendo gastar um pouco de neurônios pensando em uma forma de gerar apenas um arquivo jsp por página a ser exibida.

Para configurar o **Tiles** para ser utilizado pelo **JSF,** basta você acrescentar o seguinte código em seu arquivo web.xml (além dos jar's do** Tiles**):

    
    
        <servlet>
           <servlet-name>tiles</servlet-name>
           <servlet-class>org.apache.tiles.servlet.TilesServlet</servlet-class>
           <init-param>
              <param-name>org.apache.tiles.DEFINITIONS_CONFIG</param-name>
              <param-value>/WEB-INF/tiles-defs.xml</param-value>
           </init-param>
           <load-on-startup>2</load-on-startup>
        </servlet>


Nesta solução, o que eu gostaria de alcançar era:



	
  * facilidade de gerenciamento de **layout**

	
  * manter o controle de navegação do **JSF**

	
  * facilidade de integração


Tirando o overhead de gerar um arquivo a mais por página gerada, acho que a solução é boa. E tem funcionado bem para os meus propósitos. Se você tiver alguma sugestão, dica, crítica, não esqueça de deixar seu comentário. Se preferir, podes entrar em contato pelo alexandre(at)log4dev.com.


Powered by [ScribeFire](http://scribefire.com/).
