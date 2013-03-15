---
title: Filtros no Admin do Django
author: Miguel Galves
layout: post
permalink: /2010/08/25/filtros-no-admin-do-django/
dsq_thread_id:
  - 133447675
categories:
  - Desenvolvimento
---
# 

[![][2]][2]

 []: http://www.djangoproject.com/

O Admin automático do Django é uma mão na roda. Já disse isso. Mas nada é perfeito!

Algo que me incomodava bastante era o fato da barra de filtros que aparece do lado direito da tela de listagem ser uma lista de links. Funciona muito bem quando a lista é pequena (10, no máximo 20 elementos). Mas quando a lista é muito grande, ou então pode ter tamanho variável, a coisa fica fora de controle. Meu sonho era poder colocar uma caixa de seleção.

Esta semana, resolvi fuçar um pouco e entender como funciona. E não é que é fácil?

Resumindo: o responsável por renderizar o filtro é um arquivo chamado filter.html, que fica na pasta de templates do admin (django/contrib/admin/templates/admin). O jeito então é substituir o arquivo, e o jeito elegante de fazer esta substituição é criar uma pasta admin dentro da pasta de templates do seu projeto e criar o arquivo filter.html lá.

Para aqueles que tem preguiça de pesquisar como colocar uma caixa de seleção, eis o código que eu usei: 
    {% load i18n %}
    {% blocktrans with title as filter*title %} By {{ filter*title }} {% endblocktrans %}
    
    
    {% for choice in choices %}
    {{ choice.display }}
    
    {% endfor %}
    
    
     O resultado final é esse:

[![][3]][3]
Filtro de listagem com Caixa de Seleção

Pra quem quiser aprender um pouco mais sobre customizações do admin do django, a fonte boa é esta: 

 []: http://log4dev.com/wp-content/uploads/2010/08/filtro.png