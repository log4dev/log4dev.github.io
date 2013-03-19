---
layout: page
title: 
tagline:  
---
{% include JB/setup %}

{% for post in site.posts limit:10 %}
## <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>

{% assign author = site.authors[post.author].name %}
<p><strong>{{ post.date | date_to_string }}</strong></p> 

{{post.content}}

--------
{% endfor %}

<center	>
<a href="/archive.html">Ver textos anteriores</a>
</center>

