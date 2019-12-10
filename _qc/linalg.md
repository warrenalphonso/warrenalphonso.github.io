---
title: Why linear algebra?
---

# Why linear algebra? 

- Why linear algebra? 
    - I get that states must be of unit length to normalize probabilities, but 
    why are they vectors? Is it just a convenient representation or is there 
    something deeper? 
    - Why are amplitudes squared probabilities?
    - Why must quantum gates by matrices at all? Why must they be linear? NC 
    p18 says something about this. 
    - What is the deep reason that columns of the CNOT matrix correspond to 
    amplitudes of the possible computational basis states? 
    - Why is outer product notation useful? What new information does it tell 
    us that matrix notation doesn't? What are the outer product forms of some 
    common gates? 

It's not at all obvious to me why linear algebra is so deeply connected with 
quantum mechanics. 

## What is linear algebra? 

Linear algebra studies *linear functions*, defined as functions for which the 
following is true: 

\\[ f(x + y) = f(x) + f(y) \\] 

\\[ f(\alpha x) = \alpha f(x) \\]

I don't understand why quantum mechanics is certainly linear. 

Broadly, linear algebra is just a convenient way of describing linear things. 
This meas there's no underlying deep connection between linear algebra and quantum mechanics. Linear algebra is just a convenient way of checking to make sure gates are actually just rotations and reflections. 

### Inner products 

Wait I don't really understand this. 

We'll start with the norm: $\braket{\psi}{\psi}$. The norm is just the length of a 
real vector squared. It's just the Pythagorean Theorem. {% annotate Phrase this 
better. %} This idea of length can be extended to complex vector spaces too; we 
just have to assert that complex vectors must have real length. 

#### Why should complex vectors have real length? 

IDK 
