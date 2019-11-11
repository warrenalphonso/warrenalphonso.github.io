---
title: Calpocalypse 
sequence: 1
description: A multiplayer PvE game.
---
# Calpocalypse

Client is [here]("http://calpocalypse.warrenalphonso.com/").

Project page and menu is [here]("https://warrenalphonso.github.io/calpocalypse")

Calpocalypse is based on a project from CS 61B, Cal's data structures course, and updated with ideas from CS 170, Cal's algorithms course. 

Come up with a unique theme for this project page. Preferably have information all over the screen to convey how much work went into this. 

Describe my idea for this project: I want to learn to think in algorithms - to not just be able to derive them and memorize when to use what - but to intuitively understand how we can *reduce* real problems to algorithms I know or ones I can see how to develop. I want to be able to understand the limits of reductions to certain algorithms and *feel* for when my tools aren't enough. There's no one-size-fits-all approach to learning (at least not for me) so this is also an experiment in learning algorithms through tinkering with their implementations. 

Get a crude version 1 of the game going and show pictures of it. At this point, basic Express, SocketIO, and Heroku set up, as well as some basic core tests with Jest. 

First: A Better Core Data Structure. Explain I want the map to be big - maybe even infinitely big - and our current data structure for representing the game map, a 2-d array, isn't going to cut it. Now arrays are usually great because they have a O(1) access time and O(1) update time, but it's clear they won't be able to support an infinite map because we don't have infinite storage to hold an infinite array and if we were to implement some scrolling effect, it seems we'd have to shift every element in the array over which is really slow. The solution? A map-tuple: a hashmap that maps tuples to values. According to [this article](https://pragtob.wordpress.com/2019/06/17/comparing-the-performance-of-different-board-implementations-in-elixir/), a map-tuple is the best overall data structure for a game board when considering access speed, storage size, and scaling. Brief aside on why we use tuple instead of list. Then implement and show access time differences for a big array and big map-tuple. Add Jest tests. 


## Ideas

What if I structured the project so I followed *Algorithms* and had a few features for each chapter? Probably need to do 61B ideas first but this is doable. Also really cool if I figure out a way to make my own FFT, DP solver, etc. 

Have annotations to practice problems or homework problems or discussions problems in the projects page. 

If I want to make progress on this during this semester, it's necessary that I learn 170 super well while doing the 61B parts of the project. That means focus on spaced repetition/active recall by doing hw/discussion/textbook problems and putting them in Anki while also reviewing/building the foundational 61B ideas into the game. This weekend, I should plan it. 