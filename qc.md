--- 
layout: page 
title: QC
publish: false
--- 

# Quantum Computing 

## How Will QC Be Important? 

[DWave QC being used for some DNA/protein analysis or something](https://www.technologynetworks.com/informatics/news/the-power-of-quantum-computing-harnessed-for-dna-study-298183) 

Quantum Country's motivation for studying QC: Will alien civilizations have computers? If yes, it means computers are the answer to some fundamental question about the universe, not some human fad. Hilbert wanted to know the ultimate limits of mathematical knowledge. Turing answered by formalizing an algorithm as something a universal Turing machine could be programmed to do. Deutsch noticed that every algorithm is carried out by a physical system (mathematician with paper and pencil or a physical computer etc) and asked: **Is there a single universal computing device which can efficiently simulate any other physical system?** This question is something fundamental to the nature of the universe; a motivating question we can expect alien civilizations to ask and one which would lead them to building quantum computers.  

## Useful Links 
- Jeremy Kun's [introduction to quantum computing](https://jeremykun.com/2014/12/08/a-motivation-for-quantum-computing). 
- Lucien Hardy's [intuitive derivation of quantum mechanics](https://arxiv.org/pdf/quant-ph/0101012.pdf). 
- My Linear Algebra [notes](https://drive.google.com/file/d/1jj_jUxL1pDjReAikCL0u1XOhm8HZpcx2/view). 
- [Advice](http://www.mit.edu/~aram/advice/quantum.html) from someone more qualified. 

## Ideas 

I want to develop a strong intuition and feel for how the gears of quantum computing turn. These notes are an attempt at a "exploratory medium" for attacking QC until something gives. To ensure I'm honest, the only intended audience of these notes is me. This way I'm less likely to refrain from exploring a topic in order to appear smarter than I am. 

- Web posts are usually written with lots of planning and are time-intensive to create. A better post usually means it's more aesthetic and written well. On the other hand, handwritten notes (or at least the best, most personally helpful handwritten notes) are often messy, asymmetric, careless, and hastily written. Despite all of that, there's a sense of beauty which comes mostly from the notes being written by someone who knows the subject exceptionally well. [Richard Feynman's handwritten notes](https://www.feynmanlectures.caltech.edu/Notes.html) are a perfect example. So the medium must be **messy, asymmetric, careless, hastily yet thoughtfully written to extract deep ideas**. 

- I notice I don't read my handwritten course notes very often though - there's too much stuff and it's annoying to reread stuff I already know. This means the medium should **organize ideas in a very modular way**. Have different posts whenever possible. 

- One problem with making things as modular as possible is that I might not revisit some notes that I need to revisit. To solve this, I'll **incorporate Anki at a very deep level**. I'll convert every single idea into a card and have tags in the cards to point to what section they're from. That way I'll know where to go to refresh my knowledge and can choose to add more/update the content too. Here's a [tutorial for embedding Anki](https://tedpak.com/2013/10/30/exporting-anki-flashcards-to-the-web.html). 

- A second problem with modularization is that I'll be overwhelmed by a sea of posts very easily. A solution is to **tie everything together from the inside with hyperlinks to pages**. Then I can use PageRank to create a **web of knowledge** so I can notice when some area is a source of orphan cards and work to better incorporate that knowledge. 

- At first, the medium will be **a second pass through my ideas** since I'll use paper to brainstorm and ask questions first. I will actively avoid trying to pretty up the medium by simplifying what was on paper and do my best to preserve all the information. I'll try to reorganize and reexplain in different ways so I can practice thinking of ideas in different ways. The end goal is to move away from trapping all my thinking in a tiny laptop screen or pad of paper. Broaden my workspace and build new tools. [Bret Victor's website](http://worrydream.com/) is very useful especially his talk "Humane Thought." But his (and everyone else's) method of discovering new media for thought is to focus on general tools. My approach is to focus exclusively on tools for thought for quantum computing. One thing's for sure though: there are definitely unexplored productivity gains (in "Inventing on Principle," Bret Victor codes a complex animation with a leaf and a rabbit in 2 minutes which would have otherwise taken him a day). 

- The only goal of the medium is to maximize understanding and intuition of QC. This necessitates a way to think about qubits and algorithms - some way for the thinking to *materialize in my head* instead of just doing matrix multiplications. **I need visualizations**. Use **Bloch spheres and Q-CTRL's three tetrahedron** for entanglement. Videos of the movements of the bloch sphere is better than pictures. **Figure out some new ways to visualize**. Circuit diagrams are helpful only as a macro view. Here's a [tutorial for embedding interactive Matplotlib in a static site](https://www.johnwmillr.com/interactive-plots-in-jekyll/) (I want to be able to drag the Bloch sphere around). [This post on Algorithmic Assertions](https://algassert.com/post/1716) walks through seveal iterations of developing a visualization tool. I could learn a lot from actually going through the posts on blogs like this one. I have the PDF of a book called *Picturing Quantum Processes* in my life folder that will be useful. 

- **Ask any question that pops into my head that isn't immediately obvious**. This is the only way to **make sure I'm not tricking myself into thinking I understand stuff**. Keep reminding myself (with examples like in NC Ch1 the CNOT affecting the control qubit) to not be overconfident in my knowledge. 

## Posts

{% for post in site.qc %}
   - [{{ post.title }}]({{post.url}})
{% endfor %}    
