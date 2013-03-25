---
author: laggarcia
comments: true
date: 2009-02-18 20:16:27
layout: post
slug: para-que-facilitar-se-podemos-complicar-2
title: Para que facilitar se podemos complicar?
wordpress_id: 436
categories:
- Ferramentas
- Opinião
tags:
- Fedora
- Linux
- problemas
- suporte
---

Há quase um ano atrás o Ricardo Capitanio, nosso colaborador esporádico (talvez tanto quanto os autores regulares deste blog ultimamente) , escreveu [aqui](http://log4dev.com/2008/03/05/para-que-facilitar-se-podemos-complicar/) um post interessante sobre como alguns desenvolvedores de software gostam de complicar coisas que eram simples.

É impressionante como, apesar de isto acontecer recorrentemente, as pessoas ainda insistem em complicar ainda mais as coisas.

Apenas para citar alguns exemplos que eu vivi recentemente (tirando o exemplo do webmail do UOL do meu [post anterior](http://log4dev.com/2009/02/13/a-nova-ortografia-e-o-redesenho-de-software/)), lembro-me sem ter que pensar muito nos inúmeros problemas que tive quando atualizei meu ambiente de desenvolvimento do Fedora 8 para o Fedora 9 e, mais recentemente, do Fedora 9 para o Fedora 10.

Quando sai do Fedora 8 para o Fedora 9 notei que não existia mais suporte ao Xen (aplicativo de virtualização de máquinas). Tudo bem que eles substituiram o Xen pelo KVM, que, dizem, é melhor. Mas, de uma hora para outra, fiquei na mão.

Além disso, em todas as atualizações de Fedora que eu fiz (comecei a usá-lo no Fedora 4) sempre tive sérios problemas com o AIGLX ou seus equivalentes desde que eles são suportados. O AIGLX - ou seus equivalentes - são tecnologias que habilitam desktops com efeitos gráficos 3D: nada que seja realmente muito importante (apesar de algumas funcionalidades providas por este tipo de desktop aumentarem a minha produtividade) mas é algo que sempre causa uma impressão muito boa, especialmente quando estamos fazendo uma apresentação para grupos de pessoas que estão habituadas a usar Windows e não tem muita ideia do que o Linux tem para oferecer no desktop. Bom, o fato é que era comum o AIGLX nunca funcionar corretamente logo que uma nova versão do Fedora era lançada. E quando ele começava a se estabilizar, eu fazia upgrade para uma nova versão de Fedora e lá estava ele todo quebrado novamente. Muitas vezes algumas aplicações gráfica quando rodadas com AIGLX ativado capotavam o ambiente gráfico inteiro! Simplesmente lamentável...

Recentemente, fiz o upgrade para o Fedora 10. Antes que alguns comecem a dizer que eu devia mudar de sistema operacional ou pelo menos escolher uma outra distribuição de Linux é bom dizer que minha insistência no Fedora não é exatamente um gosto pessoal (porém eu até me dou bem com o Fedora apesar dos problemas). É mais uma necessidade do meu trabalho. Bom, no Fedora 10 o suporte a rede sem-fio, que estava simplesmente muito bom no Fedora 9, já não é mais aquelas coisas... As únicas redes nas quais consigo me conectar de maneira estável são as WPA2. Qualquer rede WEP fica instável. E isso funcionava muito bem antes...

Enfim, no meu caso especificamente eu acho que estes inúmeros percalços são resultado de eu estar usando plataformas baseadas em código-aberto. O Fedora é uma distribuição desenvolvida pela comunidade e é fato que os testes não são nem de longe tão rigorosos quanto em uma distribuição Enterprise, direcionada a uso em ambientes de produção. É o custo que eu acabo pagando por usar sempre as versões mais recentes dos aplicativos. Mas, mesmo assim, eu ainda acho que não seria muito difícil fazer um pouco melhor na hora de testar várias destas coisas. Ou até mesmo na hora de se pensar o que vai ser ou não suportado numa próxima versão de um aplicativo ou de um sistema operacional
