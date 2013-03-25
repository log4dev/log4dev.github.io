---
author: mgalves
comments: true
date: 2006-03-31 13:16:00
layout: post
slug: codigo-em-perl
title: Código em Perl
wordpress_id: 55
categories:
- Desenvolvimento
tags:
- Perl
---



    
    
    sub setSubtraction {
        my ($min, $st) = @_;
        my @minuendo = @{$min};
        my @subt = @{$st};
        my %hm;
        my %hs;
        my @res;
    
        foreach(@minuendo){ $hm{$_} = 1;}
        foreach(@subt){$hs{$_} = 1;}
    
        while (($key, $value) = each(%hm)){
            if($hs{$key} != 1){
                push @res, $key;
            }
        }
    
        return @res;
    }


O código acima ilustra alguns pontos pelos quais eu demorei muito pra aprender Perl. E mesmo já tendo feito alguns programas em Perl, ainda tenho extrema dificuldade em ler um programa....porque nunca me lembro o que %, @ e $ representam, e para qual variável $_ aponta. As coisas são pouco intuitivas, e os programas em geral são feios e difíceis de serem lidos (sobre tudo se tiverem expressões regulares).

Tá certo que eu não sou um grande expert de Perl, mas mesmo pessoas que conhecem a linguagem demoraram pra ver o que o programa fazia. E pior: cada uma das pessoas que viu o código usaria outra síntaxe para escrever alguns trechos do programa (cada uma deu uma sugestão diferente para trechos diferentes). Sem mudar o algoritmo e as estruturas de dados usadas, existem N variantes de sintaxe possíveis. Acho que muita flexibilidade às vezes atrapalha.

Como diria o Raphael, autor do código acima: "Write once, never read it again". Fico imaginando o trabalho que deve ser manter grandes sistemas.

Agora, reconheço o poder de Perl para tratar strings, textos e afins, e por sua rapidez para escrever protótipos. Foi por isso que escolhi essa linguagem (que na época não conhecia) para escrever um programa que lia um texto e etiquetava as palavras segundo a posição da sílaba tônica e número de sílabas. Em C teria sido muito mais difícil.

Alguém sabe me dizer o que o programinha acima faz ?

