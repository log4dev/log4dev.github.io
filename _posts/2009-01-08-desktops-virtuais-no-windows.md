---
title: Desktops Virtuais no Windows
author: Alexandre Barbosa
layout: post
permalink: /2009/01/08/desktops-virtuais-no-windows/
dsq_thread_id:
  - 64842299
categories:
  - Ferramentas
  - Windows
---
# 

Todo sistema operacional tem qualidades e defeitos, e o **Windows** está longe de ser exceção. O **Windows XP** é o SO principal que utilizo no meu trabalho, pois me oferece uma série de ferramentas muito boas, em especial porque uso o [VNC][1] para fazer uso do **Linux** como ambiente de desenvolvimento.

 [1]: http://www.realvnc.com/

No entanto, uma coisa que sempre senti falta, e que só agora me mexi para resolver, é o fato de você ter somente um desktop no Windows, gerando um entulho de janelas abertas e um desgaste desnecessário das teclas **Alt** e **Tab**. Uma rápida busca me fez conhecer o [Desktops][2], um utilitário da Microsoft que possibilita a criação de 4 desktops virtuais independentes. Agora posso organizar melhor minhas aplicações, manter meu ambiente de trabalho mais limpo, da mesma forma que faço no **Linux** e no **MacOS**.

 [2]: http://technet.microsoft.com/en-us/sysinternals/cc817881.aspx

Bom, não exatamente da mesma forma. Três limitações que encontrei foram: 
*   Não é possível enviar uma janela de um desktop para outro;
*   Cada desktop tem seu *mini-tray*. Assim, se você abrir o winamp, por exemplo, em um desktop, você não conseguirá acessá-lo em outro
*   Tentar iniciar uma aplicação via teclas de atalho fará com que a mesma seja aberta sempre no *desktop 1* – independente de qual desktop você esteja. Apesar destes problemas, é uma boa solução. Não tenho observado queda de performance, tampouco aumento do consumo de memória, e a ferramenta é gratuita. Abaixo, uma imagem mostrando os 4 desktops em uso.

 

![4 Desktops em uso][3]
4 Desktops em uso

 [3]: http://log4dev.com/wp-content/uploads/2009/01/screenshot001.png "4 Desktops em uso"