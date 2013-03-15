---
title: Perdi acesso à minha instância da Amazon. E agora?
author: Thiago Ganzarolli
layout: post
permalink: /2012/07/22/perdi-acesso-a-minha-instancia-da-amazon-e-agora/
dsq_thread_id:
  - 775916281
categories:
  - Linux
  - Tutorial
tags:
  - amazon
  - ec2
  - ssh
---
# 

EC2, e máquinas virtuais na nuvem de modo geral, são extremamente convenientes. Uma pergunta que eu sempre me fazia, no entanto, era: e se por algum motivo eu perder o **acesso SSH** a uma instância? Afinal, não tenho acesso físico a essas máquinas, e no caso da Amazon, não tenho este tipo de suporte.

Bem, alguns dias atrás isto aconteceu e eu descobri finalmente o que acontece, e como se recuperar disto, sem arrancar os cabelos. Acho que é útil compartilhar com vocês.

Após atualização de alguns pacotes, minha instância precisava de um *reboot*. Depois de executar o comando, via o console do EC2 tudo parecia normal, mas a instância não estava acessível via SSH. Alguns minutos de desespero depois, reparei que o *syslog *é acessível pelo painel. De lá pude ver que o problema no *boot* era devido a uma entrada errada no *fstab.* Isto me deu a primeira ferramenta para resolver o problema: **diagnóstico.**

[![Acesso ao syslog][2]][2]
Acesso ao syslog

Já sabia o que eu deveria arrumar, mas como? Bem, neste caso eu estava usando instâncias com **EBS Storage**. Para quem não sabe, isso significa que existe um drive virtual independente e desacoplado de sua instância. Existe a opção de **root storage** para qualquer tamanho maior que o micro, mas você perde quaisquer dos seus dados armazenados nativamente na instância (salvo se você fizer um snapshot prévio, acredito). Portanto, este ‘tutorial’ só vale para o caso da EBS, mas com um pouco de criatividade e algum cuidado se resolveria o outro cenário.

 []: http://log4dev.com/wp-content/uploads/2012/07/syslog1.jpg

[![Painel do EBS][3]][3]
Painel do EBS

Prosseguindo: feito o diagnóstico, parei a instância problemática, desacoplei o volume EBS dela e o acoplei como armazenagem secundária de uma máquina de homologação. Se você não tem outra máquina, pode criar uma instância micro apenas para esta tarefa e depois matá-la, mas lembre-se de que o volume a ser diagnosticado deve ser o secundário.

 []: http://log4dev.com/wp-content/uploads/2012/07/ebs.jpg

Efetuei o acesso nesta máquina, montei o volume (seguem os passos) e efetuei a mudança no *fstab*. 
> sudo mkdir /mnt/secondary_drive 
> sudo mount /dev/xvdf /mnt/secondary_drive
> 
> sudo vi /mnt/secondary_drive/etc/fstab
> 
> sudo umount /dev/xvdf O passo final: desacoplar o volume secundário, reacoplar na instância problemática como volume principal e a reiniciar. Se tudo der certo, o acesso SSH terá retornado. Você pode conferir se tudo está funcionando no *syslog* e eventualmente repetir os passos. Mas como é um pouco demorado, diagnostique bem antes de  realizar os testes montando e desmontando volumes.
> 
>  