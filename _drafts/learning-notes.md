---
title: Notes for Learning 
permalink: posts/learning-notes
--- 

## Reading list

- Maybe look for Anki editors like [this one](https://github.com/louietan/anki-editor) though this is probably premature optimization at this point. 
- Anki [MathJax tutorial](https://niklaskorz.de/2017/06/studying-mathematics-with-anki-and-mathjax.html)
- ["You and Your Research"](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html) by Richard Hamming
- *Art of Doing Science and Engineering: Learning to Learn* by Richard Hamming
- *Moonwalking with Einstein* by Joshua Foer 
- *Spark* by John Ratey
- *How to Read a Book: The Classic Guide to Intelligent Reading* by Mortimer Adler and Charles van Doren
- *Understanding Media* by Marshall McLuhan. Mostly to see if, as Nielsen suspects, our methods of learning haven't evolved with the new media by which we learn. I wonder if the common ways we read are remnants of a way of consuming some older media. 
- *Toward a Theory of Instruction* by Jerome Bruner (from Alan Kay). Not sure if this is worth it. 
- *The Act of Creation* by Arthur Koestler. An attempt to generalize all human creativity including imagination and scientific discovery. 

## Spaced Repetition 

Link the best srs overviews in annotation. why memorize?

Spaced Repetition is a sledgehammer of memory. I won't cover the extent of the research on its effectiveness here. {% annotate For comprehensive explanations of spaced repetition, see ["Spaced Repetition for Efficient Learning"](https://www.gwern.net/Spaced-repetition) by Gwern and ["Augmenting Long-Term Memory"](http://augmentingcognition.com/ltm.html) by Michael Nielsen. %} It seems to be clearly effective, so I'll attempt to integrate it into most of my learning. There are a few things I'd like to talk about: Gwern stuff 

The testing effect is the observation that testing someone's memory will strengthen it. It is well-established in psychology. 

The most common mistakes with SRS are: 1. formulating poor questions and answers, and 2. assuming they will help you learn, as opposed to maintain and preserve what you already learned. There's evidence {% annotate Son, Lisa. <a href="http://www.columbia.edu/cu/psychology/metcalfe/PDFs/Son2010.pdf">"Metacognitive Control and the Spacing Effect."</a> 2010. %} that people naturally choose to cram/mass study when they don't yet know the material. 

The hardest part is persisting until the benefits are clear. The second hardest part is deciding what's valuable enough to add in. 

Add in words from A Word A Day, personal information like birthdays, memorable quotes, etc. This little diversity will keep daily review interesting. 

On average, Gwern adds 3-20 questions a day when learning a new topic. Reviewing 90-100 items a day takes abobut 20 minutes. 

Something that is underappreciated is our recognition memory which applies to things like *recognizing* images or text or music. Standing{% annotate Standing, Lionel. <a href="https://www.gwern.net/docs/spacedrepetition/1973-standing.pdf">"Learning 10000 pictures."</a> 1973. %} showed participants 10,000 images over 5 days with 5 seconds per photo. He discovered the participants had an 83% success rate in identifying whether or not they saw a photo. 

Register whenever is most convenient. If you want to go further, review before bed. Long-term memory consolidation seems to be releated to sleep.

<a href="https://pdfs.semanticscholar.org/be1a/70be5a6f990cd86804ccc1be29331556ddfc.pdf">Kornell et al 2010</a> is useful for misconceptions about spaced repetition. So is <a href="https://sites.williams.edu/nk2/files/2011/08/Kornell.2009b.pdf">Kornell 2009</a> I think. 

Stahl's "Play it Again: The Master Psychopharmacology Program as an Example of Interval Learning in Bite-Sized Portions" is supposed to be important. 

<a href="https://www.gwern.net/docs/spacedrepetition/2013-philips.pdf">Philips 13</a> is a good overview of science of memory formation. 

<a href="https://web.archive.org/web/20090430093950/http://chronicle.com/free/v55/i34/34a00101.htm">"Close the Book. Recall. Write It Down"</a> is supposed to be good. 

<a href="http://memory.psych.purdue.edu/downloads/2007_Karpicke_Roediger_JEPLMC.pdf">Karpicke and Roediger 2006</a> has a bit about SRS for abstract learning. 

## Compartmentalizing Classes with Anki

I'll try the "typical" Anki workflow for my classes. Right now we've finished midterms and have about a month until finals. I'll only use Anki for two of my classes: 170 and 126. In particular, 
- I'll lower the bar for what's worth putting into Anki for 170 but keep a high bar for 126. This isn't exactly a fair experiment because I've done better in 170 so far. I think if I keep a high bar for 126 then I'll be able to understand the ideas more deeply and not resort to pure memorization instead of thinking each card through. If I do better on 126 final then 170 final, I'll guess that a high bar with fewer cards is better. Make sure to note how deeply I'm thinking about cards for 170 vs 126. 
- Review for `max(time to review everything due, 30 minutes)` each day so I'm not incentivized to burn through cards quickly. I want to capture the most benefits so I need to take the time to understand and update the cards. 

## Mnemonic Media for Learning Quantum Computing 

If I decide to do mnemonic essays for myself, I can export Anki decks to the webpage using [this article](https://tedpak.com/2013/10/30/exporting-anki-flashcards-to-the-web.html)

Visualizing or some other method of intuitively understanding qubits is important, but maybe more important is developing a sense of intuition about quantum algorithms. The algorithms make sense but how the heck would I have devised them myself? I doubt anyone has intuition about them and if I could figure out a way to *think in quantum algorithms* when working on QC I bet I could make progress really fast. 



## Notes for Spaced Repetition

### Misc Anki Notes from Around the Web

1. Make questions two-way. 
2. Ask 'why' questions instead of yes/no questions. 
3. Style each card by prefacing it with (Subject): (Math) What's the square root of 4? 

### Anki Docs 

#### Notes & Fields 

Use fields to never write the same information twice. I need to have a field for the subject for example. Anki's fields were created for making it easy to make multiple cards for the same question to switch up context. For fields I want to persist, use Frozen Fields add-on. 

A card type is just a blueprint for which fields should appear on the front and backs of a card. Being proactive about creating card types is one of the best ways to save time adding and managing information. 

Note types are similar to card types (not sure how they're different) but Basic has Front and Back fields and creates one card. Basic and Reversed creates two cards at a time. 

In Anki, we add notes and then the program creates cards for us. 

#### Browser 

The Browser is the tab when you press *Browse* in the main window. Lots of search functionality and checking for review data. 

### Shamim Ahmed's Anki Tutorials for Med School 

Good add-ons: Hierarchical Tags, Pop-Up Dictionary, Image Occlusion, Load Balancer, [Frozen Fields](https://ankiweb.net/shared/info/516643804), Handy Answer Key Shortcuts, [Field History](https://ankiweb.net/shared/info/1247884413), [Tag Selector V2](https://www.youtube.com/redirect?v=2FjWkWEA2Ug&event=video_description&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F1022577188&redir_token=atSgLZhiBvVT0bCYRPZBzi4DJqd8MTU3MzUzMjk0NEAxNTczNDQ2NTQ0), [Editor Tag Hotkeys](https://www.youtube.com/redirect?v=2FjWkWEA2Ug&event=video_description&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F785582333&redir_token=atSgLZhiBvVT0bCYRPZBzi4DJqd8MTU3MzUzMjk0NEAxNTczNDQ2NTQ0), [Tag Entry Enhancements](https://www.youtube.com/redirect?v=2FjWkWEA2Ug&event=video_description&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F1348430474&redir_token=atSgLZhiBvVT0bCYRPZBzi4DJqd8MTU3MzUzMjk0NEAxNTczNDQ2NTQ0), [Quick Note and Deck Buttons](https://www.youtube.com/redirect?redir_token=4asQSO2KEQcEYo9mJUkBP8ZdESx8MTU3MzUzMjk0NkAxNTczNDQ2NTQ2&event=video_description&v=aG2Vf-wZLu8&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F2181333594), [Quick Field Navigation](https://www.youtube.com/redirect?redir_token=4asQSO2KEQcEYo9mJUkBP8ZdESx8MTU3MzUzMjk0NkAxNTczNDQ2NTQ2&event=video_description&v=aG2Vf-wZLu8&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F734297936), [Image Resizer](https://www.youtube.com/redirect?q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F1214357311&event=video_description&redir_token=8NE0iCsV9QEdAB413hCi62rfQSt8MTU3MzUzMjk0OEAxNTczNDQ2NTQ4&v=FPQxGz61C-o), [Maximum Image Height in Card Editor](https://www.youtube.com/redirect?q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F229181581&event=video_description&redir_token=8NE0iCsV9QEdAB413hCi62rfQSt8MTU3MzUzMjk0OEAxNTczNDQ2NTQ4&v=FPQxGz61C-o), [Refresh Media References](https://www.youtube.com/redirect?q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F162278717&event=video_description&redir_token=8NE0iCsV9QEdAB413hCi62rfQSt8MTU3MzUzMjk0OEAxNTczNDQ2NTQ4&v=FPQxGz61C-o), [Power Format Pack](https://www.youtube.com/redirect?redir_token=-dyy0I9yiSRow3r5lNTUFKMmzox8MTU3MzUzMjk0OUAxNTczNDQ2NTQ5&event=video_description&v=e6HMD32hngQ&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F162313389), [Power Create Lists](https://www.youtube.com/redirect?redir_token=-dyy0I9yiSRow3r5lNTUFKMmzox8MTU3MzUzMjk0OUAxNTczNDQ2NTQ5&event=video_description&v=e6HMD32hngQ&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F1524262201), [Better HTML Table](https://www.youtube.com/redirect?redir_token=-dyy0I9yiSRow3r5lNTUFKMmzox8MTU3MzUzMjk0OUAxNTczNDQ2NTQ5&event=video_description&v=e6HMD32hngQ&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F2139514828), [Advanced Previewer](https://ankiweb.net/shared/info/544521385), [Batch Editing](https://ankiweb.net/shared/info/291119185), [Review Heatmap](https://www.youtube.com/redirect?v=3Hk5TYdvKnM&event=video_description&q=https%3A%2F%2Fankiweb.net%2Fshared%2Finfo%2F1771074083&redir_token=xdHpd5DQZRrxVo4pYDY7IJqG2DV8MTU3MzUzMzE4NkAxNTczNDQ2Nzg2), 

[Amazing Card Design](https://medshamim.com/med/how-to-design-beautiful-anki-cards)

### 20 Rules of Formulating Knowledge by Piotr Wozniak 

Speed of learning depends on how you formulate the material. Optimizing the latter means you'll learn faster. Keep in mind the following are arranged in order of importance: those listed first are most often violated and bring the most benefit. 

1. **Do not learn if you do not understand.** Before you put anything in some spaced repetition system, make sure you understand what it means. Continuously check for comprehension. 

2. **Learn before you memorize.** Build a picture of the whole of what you're trying to learn. Learning time is reduced greatly when every piece fits one cohesive structure. One *single* piece that doesn't seem to fit the puzzle is like coming across a word in another language in a textbook and memorizing it hastily. 

3. **Build upon the basics.** Still, the picture of what you're trying to learn doesn't have to be complete. Rather, make it simple - simple things are easy to understand and can easily be built upon. This mean the basics are crucial. Keep memorizing the basics. It has negligible cost because people usually spend 50% of their time repeating 3-5% of the learned material {% annotate ["Theoretical aspects of spaced repetition in learning."](https://www.supermemo.com/en/archives1990-2015/articles/theory) Piotr Wozniak. 1990-2000. %}. 

4. **Stick to the minimum information principle.** Make cards as simple as possible. Typically, beginners make cards that should be split into *ten or more* items! Simpler cards are better because simple, atomic information can be processed by the brain in the same way everytime you go over it which strengthens your ability to memorize it, as opposed to processing a complicated card a different way each time you encounter it, which interferes with the previous attempts at memorizing the card. Atomic cards also mean you repeat the cards you have trouble remembering more often rather than wasting time on the cards you already know. For these same reasons, it is better to make the answer *as short as possible*. 

5. **Cloze deletion is easy and effective.** Cloze can help beginners stick to the minimum information principle. 

6. **Use imagery.** The visual cortex is very well-developed by  evolution. It's certainly superior to our verbal memory. 

7. **Use mnemonic techniques.** Mnemonic techniques are useful, but you'll only need to apply them to 1-5% of your cards {% annotate I need to read more about mnemonic techniques. %}. 

8. **Graphic deletion is as good as cloze deletion.** Graphic deletion is when your card displays an image but you cover up a part of the image relating to the question. 

9. **Avoid sets.** Questions like "What countries belong to the European Union?" should be avoided because of the high cost of retaining memories based on sets. If memorizing a set is necessary, convert it to an enumerated list, through alphabetizing perhaps. Enumerations are still hard but slightly better because now the brain puts an order to the items and approaches the card in the same way every time. 

10. **Avoid enumerations.** 

11. **Combat interference.** Make items as unambigiuos as possible so no two cards have similar answers. 

12. **Optimize wording.** Optimize wording of cards so that the right part of your brain lights up in minimum time. This reduces errors, increases specificity, reduces response time, and helps concentration. 

13. **Refer to other memories.** 

### Reddit Anki for Math 

Ignore Minimum Information Principle for math. Keep long proofs in your cards so you understand their flow. Because we're ditching the Minimum Information Principle, you have to grade cards ruthlessly - if you forget a single line of a long card, mark it as again. [Example card](http://i.imgur.com/B6MnBLp.png). Be armed with a pen and paper when doing Anki for math. 

Use images and colors to emphasize certain points as much as you can. These two tips so far mean you should invest a **lot** of time into making cards. 

Use MathJax: you can zoom in, vertical inline alignment is much better than LaTeX, faster rendering, renders on mobile devices. Main drawback is that only math mode and basic packages are supported out of the box. I'll need to do a lot of research on this. 

Use a better font than Arial - recommends Open Sans for text and Source Code Pro for code. 

### Spaced Repetition for Math by Michael Nielsen 

It's always possible to deepen one's understanding of any piece of math - the common understanding that you don't understand, then spend time learning, then emerge on the other side with a full understanding is wrong. This is especially true for simple mathematical ideas so spend a LOT of time revisiting your cards because they'll largely be ideas you think are easy since you already learned them. 

Once you have something **important** that you want to **actually memorize forever**, there are two phases: 

One, understand the idea/proof by going over it multiple times, each time in increasing detail, and picking out single elements to convert to cards. Make sure you restate these multiple ways. Take time to gradually trim each card down to its minimal parts that allow you to focus on the key takeaways. Inexperienced people think of proofs as linear lists of statements, but a better way to think of them is as interconnected networks of simple observations. Things are never true for only one reason and the more reasons you discover and articulate, the better your intuition will be. This seems inefficient but certainly worth it. The way to do this is to explore minor variations of the idea: What does normalcy mean for the *jk*th component of MM\* = M\*M?

Two, after you familiarize yourself with every element of the idea, distill the entire idea into a single question and answer. You will certainly need to refactor your cards several times over to make them crisp and representative of your constantly updating knowledge and perspective. Try to test the assumptions to a theorem by asking why each is necessary or when they can be weakened. 

Einstein wrote a letter to Hadamard explaining that when he thought about physics, he didn't think in words. Rather he had messed around and experimented with the ways different concepts work and come together that he reasoned about them as entities of their own in his mind. The goal *even before you Ankify an idea* is to develop this level of understanding by taking time to mess around with a concept. But even after, make sure to let yourself update cards whenever you think of a better way to phrase the objects and their interactions. The goal with Anki is to develop this sort of "chunking" - chess champs are good because they've memorized thousands of "chunks" - I need to shoot for that. {% annotate Read Herbert Simon paper %}

The problem with asking so many questions about a single topic is that you need to find a way to set the context since the cards will get shuffled up eventually. **Find a way to do this.** 

At time of writing the post, Nielsen had only done this method on three theorems - that's how time-intensive it is. It takes him a few hours and he usually uses dozens of cards per theorem. 

### Tools for Thought by Michael Nielsen and Andy Matuschak 

Alan Kay wanted to create a new *medium* of thought, not just tools for thought. Unlike a tool, a medium creates a new context for thought, one in which thoughts that were formerly impossible to have can occur. If the atomic tools within the medium are chosen well, the medium can expand the range of human thought. The development of language, of writing, and of computers are examples of groundbreaking context changes. Writing is inadequate for describing new tools of thought because the new tools should expand thought to areas writing cannot reach. What writing can help with is identifying points of potential. 

#### Memory Systems

Though cognitive scientists know a lot about how people form long-term memories, current mediums for learning don't support these easier memorization techniques {% annotate ["Why books don't work"](https://andymatuschak.org/books) by Andy Matuschak. %}. If we could create a medium that takes advantage of this, then instead of memory being a random event, it would be a choice.  

The counterintuitive advantage of spaced repetition is that you get exponential returns for increased effort. On average, every extra minute spent reviewing gives more and more benefit. Notice the stark contrast with most things in life where we run into diminishing returns. Ordinarily, if you spend 50% more time reading and reviewing, you can expect to get no more than 50% more information cached again in your brain. If you spend 50% more time reviewing with a spaced repetition system, you can remember 10x the amount of information. Unlike most online platforms, spaced repetition is more like meditation because the benefits are delayed and require constant effort. 

On *Quantum Country*, readers were tested on the material in text, then in intervals of 5 days, 2 weeks, 1 month, 2 months, then 4 months. If the user's retention decreases, the interval gets lowered. By the sixth repition, users had an average interval of 54 days. That's impressive because most people barely remember what they've read more than a month after reading it. 

Flashcards are dramatically under-appreciated. Just because something is simple doesn't mean it's not profound. 

*Quantum Country* is a memory system, something to help users easily consolidate things into long-term memory. More specifically, *Quantum Country* is a spaced repeition memory system, like Anki, SuperMemo, and Duolingo. *Quantum Country* demonstrated that spaced repetition memory systems aren't useful only for simple declarative knowledge like vocabulary but can be used to master abstract conceptual knowledge. This is achieved through attention-to-detail when writing cards and, more importantly, the embedding of spaced repetition *within* a narrative, so that the we can build context for the cards {% annotate Piotr Wozniak has apparently written a lot about strategies for spaced reptition with abstract and difficult knowledge on the SuperMemo wiki. %}. This was also one of my bigger problems with Anki: when I used it for the Linux SysAdmin decal, I lost the context for many of the commands, shortcuts, and techniques I was trying to learn. 

Nielsen and Matuschak believe all memory systems today are barely scratching the surface of what is possible. I need to come up with experiments and metrics I can measure to test different systems. 

The content of the cards is incredibly important. We tend to think of card writing as a casual task of moving information from a text to the front and backs of cards, but this is dangerous because the entire memory system depends on the effectiveness of the cards. Card writing should be treated as a skill to be continually improved. Answering the question "how to write good cards?" requires thinking about what your theory of knowledge is and what your theory of learning is {% annotate Okay let's write about what my theory of knowledge is and what my theory of learning is. Nielsen's Spaced Repeition for Math and Guide to Augmenting Long-Term Memory will be useful for this.  %}. Nielsen and Matuschak recommend three very basic principles they learned: 

1. Keep cards as atomic as possible. 
2. Make the early questions in a mnemonic essay trivial so users realize they aren't paying close enough attention. 
3. Avoid orphan cards which don't connect to other cards so all the cards can interconnect in ways to reinforce one another. 

It's important noting that *Quantum Country* created cards for their users, but the act of creating cards is an important one for learning and thinking about how to formulate knowledge in a way that makes it easy to remember and strips it down to its most important ideas. If I start writing my own mnemonic essays, I'll be writing my own cards so I can access the benefits associated with that. 

In fact, these three principles are a key to *Quantum Country*'s success. Thinking of *Quantum Country* as just a spaced repetition memory system is false. It would fail if spaced repetition wasn't working in tandem with many other memory techniques. This is why some people think spaced repetition doesn't work for them. If they write terrible cards, use it to learn something they don't care about, don't make reviewing into a habit, or some other error, they're bound to fail. Another way of thinking about a mnemonic essay like *Quantum Country* is that it's two essays: a conventional essay and then a reflected one made up of the knowledge in the cards. Ideally the cards are written well-enough so that the reflected essay is a faithful representation of the important ideas in the conventional essay. But this causes another problem I need to think about: the mnemonic essay might be good for teaching the material to someone, but I how do I ensure I am able to memorize the material when I come across it outside of the essay, without the context and derivation provided? Put another way, I'll need to be able to revisit the cards often, but reading a whole essay takes too long. I need to have some way to go through the cards independent of the essay. How does *Quantum Country* solve this when they email people to review the cards?

Nielsen and Matauschak also noticed the following problems with their cards: 

1. Users sometimes learned "surface features" of a question. The only question in *Quantum Country* that started with "Who..." was "Who has made progress on using quantum computers to simulate quantum field theory?". Users seemed to notice that the question started with "Who..." and immediately answered "John Preskill and his collaborators." without engaging with the question. This is deadly to the understanding gained from memory systems. One solution is to present the question in different but equivalent ways: "Who has made progress..." vs "____ and his collaborators made progress...". The goal is to create a library for identifying when this recognition of "surface features" happens and remedying it. 
2. How do we help users remember the answer when they've forgotten it? Traditionally, spaced repetition memory systems just reduce the interval for the question, but it might be better to ask follow-up questions so that the user can associate some more context with the question and better encode the answer in memory. 
3. Stories are one of the most effective methods of remembering something. How can we incorporate stories in cards? Or perhaps there is another way to incorporate the story in the medium. 

Spaced repetition isn't the only powerful memory idea we can use. Elaborative encoding says that the richer our associations to a concept, the better we'll remember it. This is obvious, but it's not supported well by existing media. We've already done a little to incorporate this (avoiding orphan cards) but here are three more ideas:
1. Provide multiple forms of both questions and answers. The dual-coding theory says that pictures-words are recalled better than words alone. What if we incorporated different pictures for different versions of questions and answers? 
2. Studying material in two different places instead of twice in one place increased recall by 40% {% annotate Steven M. Smith, Arthur Glenberg, and Robert A. Bjork. [Environmental context and human memory](https://numinous.productions/ttft/assets/Smith1978.pdf). 1978. %}. What happens if we change the contexts in different ways like changing time of day, background sound, location, etc? We also need a way to isolate the effects on improvement because this is a situation where uncontrolled effects might have an impact. 
3. Experiment on the relationship between cards to discover the most powerful ways to represent knowledge. The example they provide: "Suppose you have cards: 'Who was George Washington’s Vice President?' (Answer: 'John Adams', with a picture of Adams); 'What did John Adams look like?' (Answer: a picture of Adams); perhaps a question involving a sketch of Adams and Washington together at some key moment." What happens to understanding when you remove a card? Is there a lynchpin card that holds everything together? 

When working to create cards to memorize/internalize something, you should make sure it's something for which spaced repetition is best for. When learning a programming language, for example, it's a bad idea to make cards because you'll learn the language through natural repetition while coding in it. An ideal memory system for this would prompt you as you work instead of in an artificial card-based environment. Similarly, it's actively bad to try to memorize something you won't have any long-term use for like an API you're going to use for only one project or a subject you're learning for only a semester. You need to find good heuristic for what is worth committing to memory. I should look into what Nielsen uses as his heuristic because he says he has tens of thousands of cards, but maybe that's just because he actually wants to learn everything and devotes all his time to learning. Quantum computing definitely warrants a spaced repetition system because the vocabulary required is huge and it seems a certain intuition is required for tasks like developing algorithms. For now, be extremely conservative when choosing what to memorize - investing in memorizing the wrong thing is a huge time sink and trades off with time to memorize something more useful. 

Of course rote memorization sucks, but people shouldn't let their distaste for it ruin their perception of memory in general. Mathematicians and physicists who claim to have chosen their field because everything can be derived have themselves memorized an enormous amount of facts, connections, and intuitions within their discipline. 

The most powerful tools for thought express deep insights into the underlying subject matter. There's a section on how someone could have invented the Hindu-Arabic numerals from just Roman numerals that's pretty insightful and demonstrates how to create a new memory system you'd need deep original insights into memory that no one else has had. 

A downside of a mnemonic essay is that there's less emphasis on emotion, unlike in videos like the ones by 3Blue1Brown. In those videos, you can empathize with the author's love for the beauty of math. Emotion is critical in maintaining interest in a subject and it's something we should try to incorporate. Try to focus on the bigger picture, urgency, and beauty of anything I write a mnemonic essay on. 

To discover new tools for thought, you need to keep attacking the basics and returning to fundamentals. Think about how other revolutionary tools for thought were invented. The computer was invented after Turing and Church were exploring extremeley basic questions and even then they arrived at the concept for a computer after years of work. We also can't just improve some existing medium into a new medium of thought: imagine someone before the invention of language trying to come up with the concept of a verb... it's simply not possible. Again, a new medium of thought won't be expressable at all - not in writing, speech, or even our current ways of thinking. 

### Augmenting Long-Term Memory by Michael Nielsen 

#### Using Anki to Remember Almost Anything 

To decide what goes into Anki: 
1. If a fact seems worth 10 minutes of my time (that's the average total review time per card), then it goes into Anki. 
2. Superceding the first, if a fact seems striking, it goes into Anki. (This is because most of the important things we know are things wer're not sure are going to be important.)

It's tempting to use Anki to stockpile knowledge but it only really works if you're learning something you're emotionally invested in, maybe towards a creative project. Otherwise, the questions turn out cold and lifeless and hard to connect to other things you know. 

To really grok a field, you need to deeply engage with key papers. Instead of just getting key facts, this will help you understand the standards and norms of the field and how to put techniques together. You get to understand what makes a breakthrough a breakthrough. Anki works great for this. For QC, I can Ankifiy Mike and Ike and then go toward papers or other subfields. But grokking Mike and Ike is a prereq to appreciating the other stuff. This is what Mortimer Adler calls syntopic reading. 

Be confident that you'll remember what you're reading as long as you're diligent with Anki. 

#### More Patterns of Anki Use

Practicing making all your questions atomic has the added benefit of crystallizing the distinct things you've learned. 

The higher level of Anki occurs when you are able to use it as a mechanism for understanding instead of just memorizing: break things up into atomic facts, then build rich hierarchies of interconnections. 

95% of Anki's value comes from 5% of its features. Don't give up because you can't figure out how everything works. This is programmer's efficiency disease. 

Remembering something declaratively and knowing when to use that thing procedurally are two different things. Thus, reviewing Anki cards isn't enough. You need to carry out the process you're trying to learn (using Anki to learn Unix for example). You need to solve real problems. This is easy for something you're already using heavily, but there's room to make it better and integrate more procedural learning into SRS. 

It's best to Ankify things in real time while reading or learning. 

What you Ankify is not a trivial choice: Ankify things that serve your long-term goals. 

Avoid yes/no questions. 

#### Personal Memory Systems More Broadly 

In QC especially, memory is a bottle-neck to cognition. People think they're stuck on hard, esoteric concepts but are really not truly understanding basic notation or terminology. I should be especially mindful of this. 

### How Flashcards Fail by Bill Powell 

Spaced repetition is uneven - some days you only have a few reviews and others you'll have hundreds. This can be extremely demoralizing. Even if you're excited about every card in your deck, this is hard to do because of the variance in amount of time it takes up. One way to solve this is to add fewer cards and keep only those that are necessary. Another solution is to limit the number of new cards you see a day to like 10 or 20. That means you never get lumps of new information from the day before. 

The more boring a card is, the more likely you'll get it wrong, the more likely you'll see it often, the more likely you'll hate SRS. Anki labels a card as a "leech" and then deletes it after you miss it a bunch of times but this can take a while. One way to avoid this is to think carefully about every card you add and make sure it's something you're actually excited to learn about. 

Atomized knowledge can be boring especially when it's randomized so you're dealing with random facts rather than the atomic pieces of a larger idea in the correct sequence. 
