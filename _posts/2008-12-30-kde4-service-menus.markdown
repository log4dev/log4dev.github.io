---
theme:
  name: twitter
author: bart
comments: true
date: 2008-12-30 21:34:51
layout: post
slug: kde4-service-menus
title: KDE4 Service Menus
wordpress_id: 384
categories:
- Desenvolvimento
- Ferramentas
---

Eu mudei pro Linux faz um bom tempo e uma coisa que eu sempre senti falta foi de um file manager tão bom quanto o Windows Explorer. Ele não é perfeito, claro, mas por algum motivo eu sempre achei mais fácil de entender a estrutura do sistema de arquivos usando o WE do que qualquer similar pra Linux.

Eu tentei vários. Pensando rapidinho aqui, eu lembro de ter usado Nautilus, Konqueror (quando ele era um bom file manager, ao invés de um browser horrível), Thunar e pcmanfm. Ultimamente eu tenho usado o Dolphin, que é o atual default pro KDE. Ele tem umas features que acho legais, como a organização automática da árvore de diretórios (pra visualizar melhor) e a possibilidade de renomear arquivos em lote (ideal pra nomear fotos digitais). Mas uma coisa que sempre me irritou foi que o Dolphin não vem com actions de context menus pra descompactar arquivos. Isso é uma feature que eu uso muito e me salva muito tempo. Eu odeio ter que clicar com o botão da direita, abrir algum programa pra descompactar e ter que escolher o diretório de destino (que normalmente é o seu home por default, então você tem que procurar o diretório em que estava).

Agora, entre aquele peru de natal enorme e a festa do ano novo, eu finalmente encontrei tempo pra tentar fazer isso funcionar.

Fuçando por aí eu descobri que KDE usa Service Menus pra esse tipo de action. A idéia é que você cadastre as actions que podem ser aplicadas a certos tipos de arquivos. Daí os programas do KDE automaticamente usam essas actions quando você abre um context menu em um arquivo desses tipos. Eu também descobri que a nova versão do Dolphin no KDE 4.2 (que ainda é beta) já vem com essa funcionalidade de descompactar, mas o interessante desse post é aprender como fazer Service Menus, pois isso pode ser muito útil no dia-a-dia.

Então vamos ao código (eu to me baseando no Fedora 9 com KDE 4.1.x). Tudo o que você tem que fazer é criar um arquivo `.desktop` num diretório de service menus. Se quiser instalar o menu pra todos os usuários, normalmente fica em `/usr/share/kde4/services/ServiceMenus`, se quiser pra um usuário só, fica em `~/.kde/share/kde4/services/ServiceMenus`. Eu criei um arquivo chamado _ark\_servicemenu.desktop_, que baixei do código fonte da [versão beta do KDE 4.2](http://www.kde.org/info/4.1.85.php) (no kdeutils). Ark é o frontend do KDE pra manipular arquivos compactados, como zip, tar.gz e tar.bz2. O objetivo é cadastrar um menu que chame o ark quando você clicar em um arquivo desses tipos. O código simplificado começa com o registro das actions:


    
    
    
    [Desktop Entry]
    Type=Service
    ServiceTypes=KonqPopupMenu/Plugin
    MimeType=application/x-gzip;application/x-tar;application/x-compressed-tar;
        application/x-bzip-compressed-tar;application/zip;
        application/x-bzip;application/x-tarz;
    Actions=arkAutoExtractHere;arkExtractTo;arkExtractHere;
    
    



Esse código registra um serviço de popup menus com 3 actions. No arquivo original existe uma lista mais extensa de mime types, mas essa aqui é suficiente pra ilustração. O que ficou faltando é a especificação  das 3 actions:


    
    
    
    [Desktop Action arkExtractHere]
    Name=Extract archive here
    Icon=utilities-file-archiver
    Exec=new_ark --batch --autodestination %F
    
    [Desktop Action arkExtractTo]
    Name=Extract archive to...
    Icon=utilities-file-archiver
    Exec=new_ark --batch --autodestination --dialog %F
    
    [Desktop Action arkAutoExtractHere]
    Name=Extract archive here, autodetect subfolder
    Icon=utilities-file-archiver
    Exec=new_ark --batch --autodestination --autosubfolder %F
    
    



Pra cada action, a gente escolhe o texto, o ícone e o comando pra executar. Existem 2 diferenças desse código pro original. Eu removi as várias traduções pros textos e mudei os comandos de `ark` pra `new\_ark`. O problema é que a versão antiga do ark, instalada no meu sistema, não aceita as opções _batch_, _autodestination_, etc. Então eu baixei um binário da versão nova e salvei como `new\_ark`, pois não queria sobre-escrever a versão antiga. Pra fazer isso, eu baixei o rpm do Fedora 10 e descompactei o rpm. Em um diretório temporário:


    
    
    
    wget ftp://rpmfind.net/linux/fedora/development/i386/os/Packages/kdeutils-4.1.85-1.fc11.i386.rpm
    rpm2cpio kdeutils-4.1.85-1.fc11.i386.rpm | cpio -iv --make-directories ./usr/bin/ark
    mv usr/bin/ark /usr/bin/new_ark
    
    



O primeiro comando baixa o novo kdeutils do rpmfind. O segundo extrai somente o arquivo `./usr/bin/ark` do rpm (o ./ é importante!) e salva em `usr/bin/ark`. O terceiro comando provavelmente tem que ser executado como root e salva o novo binário como `new\_ark`. Outra opção é salvar o ark em algum lugar qualquer e usar o caminho completo da especificação das actions.

Essa é somente uma solução temporária, enquanto a versão nova do KDE não está disponível. Mas o legal é que é bem simples criar esses menus no Dolphin e eles podem ser usados pra diversas extensões. Eu fico imaginando se tem como adicionar menus baseado em outras características do arquivo. Por exemplo, daria pra criar um plugin pra _git_ que abre umas opções de commit, etc, se existe um arquivo .git no diretório (ou num diretório pai). Mas talvez existam outros jeitos melhores de implementar esses plugins mais complexos...
