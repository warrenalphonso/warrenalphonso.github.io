---
title: Proof that Hubbard model conserves total particle number 
--- 

# Proof that Hubbard model conserves total particle number

The Hubbard Hamiltonian on a square lattice takes the form: 
\\[ \hat{H} = -t \sum\_{<p, q> , \sigma} \hat{a}\_{p \sigma}^\dagger 
\hat{a}\_{q \sigma} + U \sum\_p \hat{n}\_{p \uparrow} 
\hat{n}\_{p \downarrow} \\]

where $<p, q>$ indicates we sum over adjacent sites $p$ and $q$, $\sigma$ 
indicates the spin, and 
$\hat{n}\_{i \sigma} = \hat{a}\_{i \sigma}^\dagger \hat{a}\_{i \sigma}$ is the 
particle number operator. 

Why is $\hat{n}\_{i \sigma}$ called the particle number operator? Because its 
action is to multiply a state in Fock space {% annotate I don't yet understand 
what a Fock space actually is. Originally, I thought it was a space where 
second quantized states exist (like the Jordan-Wigner transformed state vectors), 
but it seems to be more general. Wikipedia also mentioned something about 
how Fock spaces are useful for indistinguishable particles, which is where 
second quantization breaks from first quantization. %} by the number of 
particles that exist in that state. In the following proof, I assume we absorb 
the spin index into the qubit index, so for $k$ sites, we have a system with 
$2k$ qubits because we have 2 spins per site. Letting $N\_i$ be the number of 
particles in state $\phi\_i$, 

\\[ \begin{split}
\hat{n}\_{i} \ket{\phi\_1 \cdots \phi\_i \cdots \phi\_n} &= 
\hat{a}\_{i}^\dagger \hat{a}\_i \ket{\phi\_1 \cdots \phi\_i \cdots \phi\_n}\\\ 
&= 
\hat{a}\_i^\dagger \sqrt{N\_i} \ket{\phi\_1 \cdots \phi\_{i-1} \cdots \phi\_n} 
\\\ &= N\_i \ket{\phi\_1 \cdots \phi\_i \cdots \phi\_n}
\end{split} \\]

{% annotate This proof is 
[from Wikipedia](https://en.wikipedia.org/wiki/Particle_number_operator). %}

where the coefficients $\sqrt{N\_i}$ arise from our need to preserve norm 1. 

#### Preliminary commutation relations

We'll need a few more commutation relations. Since we know 
$ [\hat{a}, \hat{a}^\dagger] = 1$, we can write 

\\[ [ \hat{n}, \hat{a}^\dagger ] = \hat{a}^\dagger \hat{a} 
\hat{a}^\dagger - \hat{a}^\dagger \hat{a}^\dagger \hat{a} = \hat{a}^\dagger 
[\hat{a}, \hat{a}^\dagger ] = \hat{a}^\dagger \\]

{% annotate This proof was in 
[Lecture 9 of MIT OpenCourseWare 
8.04](https://www.youtube.com/watch?v=jJX_1zT73U0). %}

\\[ [ \hat{n}, \hat{a} ] = \hat{a}^\dagger \hat{a} \hat{a} 
\- \hat{a} \hat{a}^\dagger \hat{a} = [ \hat{a}^\dagger, \hat{a} ] \hat{a} = 
\- [ \hat{a}, \hat{a}^\dagger ] \hat{a} = - \hat{a} \\]

#### Reasoning for the proof

Back to the problem of whether the Hubbard Hamiltonian conserves total particle 
number. Notice that in all of the terms, whenever we annihilate an electron, we 
create it somewhere else. We should think of this as moving an electron from 
one place to another, which is why the first term in the Hamiltonian is called 
the "tunneling" term. Intuitively, we can guess that Hamiltonians with the same 
number of creation and annihilation operators conserve total particle number. 

Mathematically, any Hamiltonian $\hat{H}$ which conserves total particle 
number should satisfy 
\\[ [ \hat{H}, \hat{n} ] = 0 \\] 
where $\hat{n} = \sum\_i \hat{n\_i}$ is the *total* particle number operator. 

The intuition behind this is that in $ \hat{H} \hat{n} - \hat{n} \hat{H}$, the 
first term has a coefficient of the number of particles *before* application of 
$\hat{H}$, while the second term has a coefficient of the number of particles *after* 
application of $\hat{H}$. If both terms are equal, the total number of particles 
is conserved. 

For the Hubbard Hamiltonian, we need to prove 
\\[ \Big[ \sum\_{<p,q>, \sigma} \hat{a}\_{p\sigma}^\dagger \hat{a}\_{q\sigma}, 
\hat{n} \Big] + \Big[ \sum\_p \hat{n}\_{p\uparrow} \hat{n}\_{p \downarrow}, 
\hat{n} \Big] 
= 0 \\]

We can prove both by proving the more intuitive and general result that $\hat{n}$
commutes with any product of the same number of creation and annihilation operators: 

\\[
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_n \hat{n} 
= \hat{n} \hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots 
\hat{a}\_n \\]

We're trying to slide $\hat{n}$ over to the left. Here's where our commutation 
relations from before become helpful. We can rewrite them as 
\\[ \hat{a}^\dagger \hat{n} = (\hat{n} - 1) \hat{a}^\dagger \\] 
\\[ \hat{a} \hat{n} = (\hat{n} + 1) \hat{a} \\]

Applying these relations, we get 
\\[ \begin{split} 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_n \hat{n} 
&= 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots (\hat{n} +1) \hat{a}\_n 
\\\ &= 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_{n-1} 
\hat{n} \hat{a}\_n \quad  + 
\quad \hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_n 
\\\ &= 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{n} 
\hat{a}\_{n-2} \hat{a}\_{n-1} \hat{a}\_n  \quad + \quad 2 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_n 
\\\ &\qquad \vdots 
\\\ &= 
\hat{n} 
\hat{a}\_1^\dagger \cdots \hat{a}\_n^\dagger \hat{a}\_1 \cdots \hat{a}\_n 
\end{split} \\]

where the last step follows from noticing that $\hat{n}$ slides to the left 
by adding 1 copy of the string for every $\hat{a}$ and subtracting one copy 
of the string for every $\hat{a}^\dagger$. 

This equality means the terms commute, so the Hubbard Hamiltonian and any 
Hamiltonian with the same number of creation and annihilation operators 
conserves total particle number. 
