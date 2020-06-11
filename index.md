---
layout: home 
title: Home 
publish: true
list_title: Projects
display_projects: false
---

# Welcome

<img src="/images/pic2.jpg" style="display:block; margin-left:auto; margin-right: auto; width:80%;">

My name is Warren Alphonso. I'm an undergrad EECS major at UC Berkeley 
interested in quantum computing. Find me on 
[Github](https://github.com/warrenalphonso). Reach me at warrenalphonso *[at]* 
berkeley *[dot]* edu.  

## Posts 

{% for post in site.qc %}
  {% if post.publish == true %} 
### [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

---

#### Testing Julia Plotting GIFs

![](/images/infinite_well/one_and_two_stationary.gif){ style="width: 33%;" }
![](/images/infinite_well/first_three_stationary.gif){ style="width: 33%;" }
![](/images/infinite_well/4_6_9_stationary.gif){ style="width: 33%;" }

{% include google-analytics.html %}
