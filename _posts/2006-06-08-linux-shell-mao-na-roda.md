---
title: '[Linux Shell] Mão na roda'
author: Miguel Galves
layout: post
permalink: /2006/06/08/linux-shell-mao-na-roda/
categories:
  - Uncategorized
tags:
  - Ferramentas
  - Linguagens de Programação
  - Linux
---
# 

Nos últimos meses eu andei processando e extraindo dados de algumas centenas de milhares de arquivos de genética. Na maioria dos casos eu uso Perl ou Python para fazer o processamento mais pesado e gerar arquivos de resumo…relatórios simplificados: em geral, um conjunto de colunas. Eu costumava fazer o processamento final desses relatórios em programas de planilha como Excel ou OpenOffice. Mas graças a alguns hackers jedi que trabalham comigo eu aprendi alguns truques velhos conhecidos dos usuários antigos de linux, e antes de abrir esses programas, eu vejo se eu consigo extrair as informações  necessárias usando os programinhas utilitários do Shell do  Linux. É incrível a quantidade de pequenos utilitários de linha de comando que executam tarefas muito simples e que podem ser uma mão na roda (isso sem mencionar awk e sed..mas aí já complica). Como eu sou um mero iniciante na arte de processamento simples de texto em shell, conheço apenas alguns que vou citar aqui. Se conhecer outros, let me know ![:-)][1] 
*   cut : pega um arquivo contendo colunas separadas por algum delimitador (tipo csv) e extrai uma ou mais colunas. Por exemplo cut -f1,2 -d” ” meuarquivo extrai as colunas 1 e 2 do arquivo meuarquivo cujas colunas estão delimitadas por espaços.
*   sort: Lê linhas de um arquivo e imprime a versão ordenada crescentemente. A opção -n indica que as linhas representam números, a opção -r ordena decrescentemente o arquivo e -u elimina elementos duplicados.
*   uniq: Lê um arquivo e descarta linhas idênticas sucessivas, imprimindo o resultado. Caso o arquivo esteja ordenado, elimina linhas duplicadas. A opção -c imprime o número de vezes sucessivas que uma linha apareceu no arquivo.
*   grep: Esse é um clássico. Recupera linhas que contenham uma palavra ou expressão regular: muito útil para filtros. A opção -v faz com que o comando imprima as linhas que não contenham a palavra passada como filtro (inverte o processamento).
*   wc: analisa um arquivo e conta quantas linhas, palavras, caracteres o arquivo possui. A opção -l imprime apenas o número de linhas de um arquivo.

 Encadeando esses comandos de forma apropriada, é possível se obter informações bem interessantes de forma muito rápida. Por exemplo, se considerarmos o seguinte arquivo:

 [1]: http://log4dev.com/wp-includes/images/smilies/icon_smile.gif

SCEP 2 PERFECT SCBF 2 P ERFECT SCCC 1 MISC SCCC 3 P ERFECT SCSG 2 MISC  SCCC 3 MISC SCSG 1 MISC SCSB 1 P ERFECT SCRF 1 PERFECT SCAC 1 PERFECT

Digamos que eu queira saber quantas vezes cada número aparece na segunda coluna, apenas nas linhas contendo a flag PERFECT. O comando em shell seria o seguinte:

grep PERFECT file | cut -f2 -d” ” | sort -n | uniq -c 

C.Q.D. Have fun !