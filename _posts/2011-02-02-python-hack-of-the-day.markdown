---
author: mgalves
comments: true
date: 2011-02-02 14:54:32
layout: post
slug: python-hack-of-the-day
title: Python Hack of The Day
wordpress_id: 843
categories:
- Desenvolvimento
tags:
- Python
---

Da série "coisas bobas que me fazem gostar mais ainda de **Python**"...

**Problema a ser resolvido: **gerar uma sequência aleatória de digitos e caracteres ASCII para criação de senhas automáticas.

**Solução:**

    
    ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(8))
