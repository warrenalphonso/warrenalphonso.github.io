---
title: VQE - QC Mentorship
---

# The Hubbard model 

I could motivate this with the Griffiths problem about when quantum mechanics 
becomes relevant! 

This post is going to be a leisurely stroll instead of compact summary. I'll do 
my best to motivate many of the steps we'll take, but since I am also learning 
quantum computing, there is much I don't understand. 

[This quora post](https://www.quora.com/What-are-metallic-lattices?share=1) has 
nice pictures, and links to [this post](http://www.the-warren.org/ALevelRevision/engineering/grainstructure.htm)
which has nice explanations I could use. 

Ntwali's metaphor: "It is almost like Nature knows you are blatantly cheating, 
but gives you a passing grade anyway." 



# VQE

**No, I should start with the Hubbard model. But also not make it too complex. 
I need to properly motivate the VQE and our study of Hubbard.**

Quantum computers are still very small and error-prone, so doing complicated 
tasks and running long algorithms doesn't work so well. One of the most promising 
near-term applications of a quantum computer is using the 
*Variational Quantum Eigensolver* (VQE) to find the eigenvalues and eigenstates 
of interesting matrices. 

What are some interesting matrices? Hamiltonians of interesting molecules! {% 
annotate I assume the reader has read an introduction to Quantum Computing. I'd 
recommend [Quantum Country](https://quantum.country/). I also assume the reader 
has an elementary knowledge of VQE. For this, I recommend [Michal Stechly's 
blogpost](https://www.mustythoughts.com/variational-quantum-eigensolver-explained)
and [Davit Khachatryan's walkthrough of the 1-qubit example](
https://github.com/DavitKhach/quantum-algorithms-tutorials/blob/master/variational_quantum_eigensolver.ipynb). %}

## VQE Summary 

Hamiltonian averaging: 

We can write any Hamiltonian as $$ H = \sum_{i\alpha} h_{\alpha}^i 
\sigma_{\alpha}^i $$, so by linearity of expectation, we just need to sum up 
individual expectations. Let $\epsilon^2$ by the variance of our measurement 
of expectation: 
$$ \epsilon^2 = Var( \langle H \rangle ) = \sum_{i=1} Var ( 
\braket{ h_i \sigma_i}) = \sum \mid h_i \mid^2 Var(\braket{\sigma_i}) 
= \sum_i \mid h_i \mid^2 \frac{ 1 - \braket{\sigma_i}^2}{M_l} \leq 
\sum_i \mid h_i \mid^2 \frac{1}{M_i} $$

which means $M\_i \leq \mid h\_i \mid^2 / \epsilon^2 $. 


