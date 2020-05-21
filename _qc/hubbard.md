---
layout: bootstrap
title: Investigating the Hubbard model with variational algorithms
---

::: display-4
Investigating the Hubbard model with variational algorithms 

[A project done through the QC Mentorship program]{.text-muted .small}
::::::

> It is almost like Nature knows you are blatantly cheating, but she gives you 
> a passing grade anyway. [Ntwali Bashige Toussaint]{.blockquote-footer}

I assume readers have read the [4 essays at QuantumCountry](https://quantum.country/). 
They really are a phenomenal introduction to quantum computing. 

A question I've been trying to answer since I started studying quantum 
computing concerns its practicality: when do we *need* to use quantum mechanics 
and what exactly can it tell us about the world that our classical heuristics 
can't? 

I don't have a great answer yet, but I tried to use this question as the 
guiding principle for this project. Most near-term useful work in this field 
will likely be concerned with *variational algorithms*. This post will explore 
one of the more prominent variational algorithms, the Variational Quantum 
Eigensolver (VQE). 

I wanted to write this post to resemble the opposite structure of most research 
papers. While research papers often present information as compactly as possible, 
this post will favor a long-winded, wandering path on our way to discovering 
useful ways to use a quantum computer. 

# The Hubbard model 

## A quantum mechanical solid! 
- what if I actually use sodium? Then for Stoner, try others like iron to show 
ferromagnetism. 

**Problem 1.21:** In general, quantum mechanics is relevant when the de Broglie 
wavelength of the particle in question is greater than the characteristic 
size of the system ($d$). In thermal equilibrium at (Kelvin) temperature $T$, 
the average kinetic energy of a particle is 
$$\frac{p^2}{2m} = \frac{3}{2} k_B T$$ 
(where $k_B$ is Boltzmann's constant $1.380 \times 10^{-23} \mathrm{J \cdot 
K^{-1}}$), so the typical de Broglie wavelength ($\lambda = h / p$) is 
$$\lambda = \frac{h}{\sqrt{3m k_B T}}$$ 
where $h$ is Planck's constant $6.626 \times 10^{-34} \mathrm{J \cdot s}$. 

The purpose of this problem is to anticipate which systems will *have to be* 
treated quantum mechanically, and which can be safely described classically. 

The lattice spacing in a typical **solid** is around $d=0.3 \mathrm{nm}$. Find 
the temperature below which the free\* *electrons* in a solid are quantum 
mechanical. Below what temperature are the *nuclei* in a solid quantum 
mechanical? Use sodium as a typical case. *Moral*: The free electrons in a 
solid are *always* quantum mechanical; the nuclei are almost *never* quantum 
mechanical. 

\* In a solid the inner electrons are attached to a particular nucleus, and for 
them the relevant size would be the radius of the atom. But the outermost 
electrons are not attached, and for them the relevant distance is the lattice 
spacing. This problem pertains to *outer* electrons. 

{% annotate We don't know what or why the de Broglie wavelength is useful. 
We just assume that's correct. Treat it like magic. %}

We need to solve $\lambda > 3 \times 10^{-10} \mathrm{m}$. We need to choose some value for 
mass $m$ to plug in, so that the inequality is only a function of temperature 
$T$. The problem recommends using sodium, 

![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Na_%28Sodium%29.jpg/220px-Na_%28Sodium%29.jpg)

{% annotate The [Wikipedia page](https://en.wikipedia.org/wiki/Sodium) is very 
interesting %}

Solving $\lambda > d$: 
$$
\frac{h}{\sqrt{3m k_B T}} > 3 \times 10^{-10} \qquad \rightarrow \qquad
\frac{h}{3 \times 10^{-10} \sqrt{3m k_B}} > \sqrt{T} \qquad \rightarrow \qquad
\frac{h^2 \cdot 10^{20}}{9 \cdot 3 m k_B} > T 
$$

*Electrons*: 

The mass of an electron is $m = 9.109 \times 10^{-31} \mathrm{kg}$. Plugging in 
$h$, $m$, and $k_B$, we get 
$$T < 1.2935 \times 10^{5} = 129350 \mathrm{K}$$

For some perspective on this result, the surface of the sun is about $6000 
\mathrm{K}$. Everywhere on Earth satisfies the above temperature inequality 
so the electrons in sodium always require quantum mechanical treatment. 

*Nucleus*:

Sodium has atomic number 11, which means it has 11 protons. The most common 
isotope of Sodium is ^23^Na, which has 12 neutrons. Because the mass of an 
electron is about a thousand times smaller than the mass of a proton or a 
neutron, we'll ignore them when calculating mass. With only protons and neutrons, 
our total mass is 
$$11 \cdot 1.672 \times 10^{-27} + 12 \cdot 1.674 \times 10^{-27} \mathrm{kg} = 
3.848 \times 10^{-26} \mathrm{kg}$$

Plugging in $h$, $m$, and $k_B$, we get
$$T < 3.062 \mathrm{K}$$

This temperature is near-zero. The [lowest natural temperature recorded on 
Earth](https://en.wikipedia.org/wiki/Lowest_temperature_recorded_on_Earth)
is $184 \mathrm{K}$, so the above inequality is almost never true. The 
nucleus can usually be treated with classical methods. 

### Why are electrons important? 

It's not clear *why* we should care about the outer electrons of atoms in a 
solid. 

But since we want to do something useful with quantum computers that can't be 
done with classical computers, this seems like a good thread to follow! 

## The Hubbard model

The problem we're attacking is: how do the outer electrons in a solid affect 
the properties of the entire solid? 

We'll need some way to *model* this problem before we can start making progress. 
Let's make some simplifying assumptions: 

#. Assume the atoms aren't moving. We can model this as a lattice of fixed 
sites. 
#. Assume the atoms only have *one* electron orbital. The Pauli exclusion 
principle states that each atom can have a maximum of 2 electrons: an up electron 
and a down electron. 
    #. Why?
#. Assume 2 electrons interact *with each other* only if they're in the same 
orbital. 
#. Assume electrons can only hop to another atom if that atom is directly 
adjacent to their current atom. 

{% annotate Read interactingelectrons.pdf for justifications %}

These 4 assumptions define the *Hubbard model* of solids. Pictorially, we can 
represent the Hubbard model on a 2-dimensional lattice as: 

![](/images/2d_hubbard.png)

{% annotate This image is from [1811.04476](https://arxiv.org/abs/1811.04476). %}

We're making good progress, but we need more than a purely visual understanding 
of our model. 

### Defining creation and annihilation operators 

**I really should do this later. If I have extra time, I can think about how to 
explain this well and with all the scattered knowledge I have about this, but 
it isn't a priority because if I run out of time, this is an area where it will 
be acceptable to say "I assume the reader knows this" or link to a resource.**

From our 4 assumptions above, there seem to be 2 main ideas we need to express 
about the behavior of free electrons: the *kinetic energy* of an electron 
moving from site to site, and the *potential energy* of 2 electrons interacting 
with each other if on the same site.

Here, I introduce a concept that isn't motivated but extremely useful: the 
creation and annihilation operators. These arise from studying the quantum 
harmonic oscillator. {% annotate I recommend [Lecture 8](
https://www.youtube.com/watch?v=qu-jyrwW6hw) and [Lecture 9](
https://www.youtube.com/watch?v=jJX_1zT73U0) of MIT OCW 8.04 Spring 2013. %}

Since we're describing electrons, the creation and annihilation operators have 
*fermionic anticommutation relations*. In other words, for two fermions on 
sites $j$ and $k$, with spins $\sigma$ and $\pi$, we have. Need to mention Fock 
space. 

$$
\Large
\begin{split}
& \{ a_{j \sigma}, a^\dagger_{k \pi} \} = \delta_{jk} \delta_{\sigma \pi} \\
& \{ a_{j \sigma}^\dagger, a_{k \pi}^\dagger \} = 0 \\
& \{ a_{j \sigma}, a_{k \pi} \} = 0
\end{split}
$$

I'm not sure *why* these relations hold, but we can derive some interesting 
properties of operators that obey the above relations, namely the Pauli 
exclusion principle. We'll do these derivations in the appendix. 

For now, I'll quickly summarize what you need to know about these operators. 

We call $a^\dagger$ the *creation* operator and $a$ the *annihilation* operator. 
Their names reflect that $a^\dagger_{j \sigma}$ creates a fermion on site $j$ 
with spin $\sigma$ while $a_{j \sigma}$ destroys a fermion on site $j$ with 
spin $\sigma$. 

## The Hubbard Hamiltonian 

The Hamiltonian of a system is the operator that represents its energy, 
$H = KE + PE$, where $KE$ is kinetic energy and $PE$ is potential energy. 
{% annotate I need a better explanation of why the Hamiltonian is energy and 
why it's so important. %} Using the language of creation and annihilation 
operators, we can write the Hamiltonian as
$$ H = -t \sum_{ \braket{j, k} \sigma} ( a^\dagger_{j \sigma} a_{k \sigma} + 
a^\dagger_{k \sigma} a_{j \sigma} ) + U \sum_j n_{j \uparrow} n_{j \downarrow} $$

The first term represents the kinetic energy. Notice the notation $\braket{j, k}$. 
I use this to denote we're summing over adjacent sites $j$ and $k$. The second 
term represents the potential energy. Notice it's nonlinear - we only add $U$ if 
there are 2 electrons on a site. {% annotate I need to introduce the number 
operator. %}

**I need to introduce chemical potential here.**

{% annotate I don't have a good explanation of why the chemical potential is 
important. It seems to be how "accepting" the system is of additional 
particles. It adds a linear potential term, so that we don't have a potential 
*only* if we have 2 electrons, but we also keep the nonlinear potential on top 
of the chemical potential. Suppose I have a system that's not at half-filling 
yet. If I add an electron, does the total energy change without this chemical 
potential term? I think so... %}

## The Jordan-Wigner transformation 
- maybe write out the Hubbard Hamiltonian then explain the dimension of the 
matrix in JW

We've got analytic and visual ways to think of our model now, but how can we 
represent it on a *quantum computer*? Notice that our Hamiltonian calculates 
energy based on *where* electrons are, so it's keeping track of the location of 
electrons. If there are $n$ possible sites in our lattice, then we have $2n$ 
possible locations an electron could be: each site can have an up electron and 
a down electron. We call each of the $2n$ locations a *spin-orbital*. Now that 
we've simplified our model to deciding whether or not 
an electron is in a spin-orbital, we can represent it with $2n$ qubits, one for 
each spin-orbital. {% annotate I could use a picture that shows how we put all 
the UP spins first and then all the DOWN spins. %} 
If we order our $2n$ qubits by having the $n$ up spin-orbitals be represented 
in the first $n$ qubits, and then the $n$ down spin-orbitals be represented in 
the last $n$ qubits, if the $j \uparrow$-th spin-orbital has an electron, then the 
$j$-th qubit is $\ket{1}$, and if the $j \downarrow$-th spin-orbital doesn't 
have an electron, then the $n + j$-th qubit is $\ket{0}$. 

Now that we have this figured out, we need some way to encode our creation and 
annihilation operators into qubit operators. There are 3 main ways of doing 
this, but we'll focus on the *Jordan-Wigner transformation*. {% annotate The 
2 other popular ways to encode are the Bravyi-Kitaev and parity encodings. 
These are more complex than the Jordan-Wigner encoding, but more useful with 
other ansatz. %} 

The Jordan-Wigner transformation is very intuitive, and we can stumble on it 
ourselves. We need $a^\dagger$ to convert $\ket{0} \rightarrow \ket{1}$ and 
$\ket{1} \rightarrow 0$, while $a$ must convert $\ket{1} \rightarrow \ket{0}$ 
and $\ket{0} \rightarrow 0$. Since qubits are 2-dimensional and we've specified 
the transforms of 2 basis vectors, we've *completely defined* the operators. 
Specifically, 
$$
a^\dagger = \begin{bmatrix} 
0 & 0 \\ 
1 & 0 
\end{bmatrix} = \frac{X - iY}{2} \qquad 
a = \begin{bmatrix} 
0 & 1 \\ 
0 & 0 
\end{bmatrix} = \frac{X + iY}{2}
$$

I've left out the subscripts, but remember that these operators are defined on 
the space of $2n$ qubits. So in reality, 
$a^\dagger_j = I \otimes ... \otimes \frac{X - iY}{2} \otimes ... \otimes I$ 
and similarly for $a_j$, which just means that we apply the identity to all 
other qubits and leave them alone. 

But these don't satisfy the anticommutation relations above! We require that 
$a^\dagger_j a^\dagger_k = - a^\dagger_k a^\dagger_j$ for any $k$ and $j$. 
However, with our current encoding, we instead have 
$a^\dagger_j a^\dagger_k = a^\dagger_k a^\dagger_j$. (Try some examples to 
understand why this is the case.) 

We need some way to to apply a $-1$ factor whenever we switch the order of the 
operators. Recall that the Pauli matrices satisfy $AB = -BA$. If we *prepend* 
our operator with tensor products of the remaining unused Pauli matrix $Z$, then 
we can use this property to get the desired behavior. {% annotate [This article](
https://docs.microsoft.com/en-us/quantum/libraries/chemistry/concepts/jordan-wigner)
by Microsoft is a great resource. %}

This is the Jordan-Wigner transform. We replace use the above formulation for 
$a^\dagger$ and $a$, then prepend the operator with Pauli $Z$s and append a 
sequence of identity operators $I$. In other words, 
$$ 
\begin{align} 
a^\dagger_1 &= \frac{X - iY}{2} \otimes I \otimes I \otimes ... \otimes I \\ 
a^\dagger_2 &= Z \otimes \frac{X - iY}{2} \otimes I \otimes ... \otimes I \\
&\vdots \\
a^\dagger_{2n} &= Z \otimes Z \otimes Z \otimes ... \otimes \frac{X -iY}{2} 
\end{align}
$$

## Mott gap
- rewrite Hamiltonian so half-filling at $\mu = 0$

Most chemistry problems are concerned with finding the eigenstates and 
eigenvalues of the Hamiltonian. The most important eigenstate is the state 
corresponding to the lowest eigenvalue. We call this eigenstate the 
*ground state* and its corresponding eigenvalue the *ground state energy*. 
This name indicates that the eigenstates are configurations of the system that 
have a particular energy, namely their corresponding eigenvalues. Why is the 
ground state so important? Because the system will tend toward its lowest 
energy state over time. Most systems spend the vast majority of their time in 
their ground state, so if we can understand its properties well, we can 
understand most of the behavior of the system. {% annotate Rewrite this 
because I'm rambling and I feel I don't know most of it. %}

Before we decide to use a quantum computer to figure out some properties of the 
Hubbard model, let's try to make some progress with paper-and-pencil. 

Some 
materials that were predicted to conduct electricity turn out to be insulators, 
especially at low temperatures. These are called [Mott insulators](
https://en.wikipedia.org/wiki/Mott_insulator), and their behavior is due to 
electron-electron interactions (like $U$ in the Hubbard model) that classical 
theories don't account for. We'll use the Hubbard model to understand this! 

Let's do a simple version: the one-site case. Since there's only one site, we have 
no hopping terms. Since electrons aren't moving, it's easy to see that we have 
4 eigenstates: $\ket{0}, \ket{\uparrow}, \ket{\downarrow}, \ket{\uparrow 
\downarrow}$, where $\ket{0}$ indicates we have no electrons, and the arrows 
indicate the existence of an electron with that particular spin. By plugging in 
these eigenstates 
into the Hamiltonian, we can see that their eigenvalues are $0, -\mu, -\mu, 
U - 2\mu$, respectively. 

With this, we can calculate the *partition function* of the system. {% annotate 
Motivate the partition function more. %} 

It's defined as $$Z = \mathrm{Tr } (e^{-\beta H}) = \sum_i \bra{i} e^{-\beta H} \ket{i} = \sum_{i= 0, 
\uparrow, \downarrow, \uparrow \downarrow} e^{-\beta E_i} \braket{i \vert i} 
= 1 + 2e^{\beta \mu} + e^{-\beta U + 2 \beta \mu} $$

The partition function lets us calculate expectations easily. For any observable 
$m$, $\braket{m} = Z^{-1} \mathrm{Tr } (m e^{-\beta H})$. We will find the 
*density* $\rho = \braket{n}$ for number operator $n$. Using the previous 
formula, we have 
$$\rho = \braket{n} = Z^{-1} \mathrm{Tr } (ne^{-\beta E_i}) = Z^{-1} \sum_i 
e^{-\beta E_i} \braket{i \vert n \vert i} = Z^{-1} (0 + e^{\beta \mu} + 
e^{\beta \mu} + 2 e^{-\beta (U - 2 \mu)} ) = 2 \cdot Z^{-1} ( e^{\beta \mu} + 
e^{2 \beta \mu - \beta U}) $$

{% annotate What is $\beta$? I need to explain this somewhere. %}

I graphed the density $\rho$ for temperatures $T = 0.5$ and $T = 2$ K. Try 
changing the potential energy $U$. Can you explain the result based on the 
Hubbard Hamiltonian? 

[//]: # 'I have to surround the `include` tag with this to remove the 
whitespace. Otherwise, Pandoc thinks it is syntax highlighting.'
{% capture includeGuts %}
{% include mott.html %}
{% endcapture %}
{{ includeGuts | replace: '    ', ''}}

Clearly there is some plateau when $\rho$ becomes 1 at low temperatures when 
$U$ becomes large. Upon reflection, this isn't all that mysterious. Up until we 
have *half-filling* (1 electron on every site), $U$ doesn't affect the energy 
calculation at all because it's only relevant if there are 2 electrons on a 
site. But once we hit this limit, the cost to add an additional electron is 
exactly $U - \mu$. Unless $\mu$ is about equal to $U$, we're stuck at 
half-filling. This is the exact behavior we see in the graph. 

What's harder to explain is why this *doesn't occur at high temperatures*. 
Indeed, the effect is almost completely gone when the temperature increases by 
1.5 Kelvin! {% annotate Do I have an answer for this? %} I don't have an answer to this 
yet. 

Earlier, I motivated this by telling you about the Mott insulator. Let's see if 
our graph gets us closer to a solution. We can think of a solid that conducts 
electricity as one in which electrons are able to move freely. Mott insulators, 
then, are materials in which electrons *stop moving* freely at low temperatures. 

Our graph tells us that at low temperatures the Hubbard model is stuck at 
half-filling. Does this mean electrons can't move? *Yes*, if every site has one 
electron then an electron hopping to a nearby site would incur a penalty of $U$. 
Electrons don't move around, and the material stops conducting electricity. 

But wait, this is just a guess! Our graph is only for a *single site* Hubbard 
model. Having to account for tunneling terms and more sites would make finding 
the eigenvalues/vectors (and thus calculating $\rho$) much harder. 

This is the first problem we'll try solving with a quantum computer. All we need 
to do is calculate $\rho = \braket{n}$. In the Jordan-Wigner transformation, we 
encode each spin-orbital in a qubit, so all we have to do to find $\rho$ is 
measure each qubit. 

# Exploring the Variational Quantum Eigensolver (VQE) 

## The Variational Hamiltonian Ansatz 
- Haar measure

## Choosing an initial state 

## Finding the ground state 

## Analyzing the ground state 

# Uncovering magnetism from the Hubbard model 

## Spin and magnetism 
- Exercise 16, ..., all of Section 5,6
- Section 10, 11

## The Stoner criterion 



# Appendix 

## Nielsen fermionic anticommutation relations

## Adiabatic evolution 
