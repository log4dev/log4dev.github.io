---
title: Python Hack of The Day
author: Miguel Galves
layout: post
permalink: /2011/02/02/python-hack-of-the-day/
dsq_thread_id:
  - 221085683
categories:
  - Desenvolvimento
tags:
  - Python
---
# 

Da série “coisas bobas que me fazem gostar mais ainda de **Python**“…

**Problema a ser resolvido: **gerar uma sequência aleatória de digitos e caracteres ASCII para criação de senhas automáticas.

**Solução:** 
    ''.join(random.choice(string.ascii*uppercase   string.digits   string.ascii*lowercase) for x in range(8))