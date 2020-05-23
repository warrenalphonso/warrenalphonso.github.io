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
I don't have a good explanation for the mathemetical ddifferences between 
bosons and fermions, but we'll still try to apply our derived tools from the 
quantum harmonic oscillator to fermions. Even [Feynman admits](
https://www.feynmanlectures.caltech.edu/III_04.html) he doesn't have a good 
explanation for these differences. 

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

I said I don't know why these relations hold, but we can try to think about how 
we could have derived them by ourselves. We want some relation that makes it 
clear that $a^2$ and $a^{\dagger^{2}}$ are both nonsense, since we can't have two 
fermions of the same spin in the same place. Since we're working in a vector 
space, we can set these both equal to $0$, which means that doing either of 
these operations destroys our whole vector space. Notice another way of writing 
$a^2 = 0$ is $2a^2 = \{ a, a \} = 0$ which is the exact anticommutation 
relation we have. The same logic works for $a^\dagger$. 

Okay but how could we have come up with the first relation? 

Recall from the quantum harmonic oscillator that $a \ket{n} = \sqrt{n} \ket{n-1}$ 
and $a^\dagger \ket{n} = \sqrt{n+1} \ket{n+1}$. Let's enforce the rule that $n$ 
can only be $0$ or $1$. Notice that if $n$ is constrained to those values, then 
$\sqrt{n} = n$ and $\ket{n-1} = \ket{1-n}$. With this we can write 
$$ a \ket{n} = n \ket{1-n} \qquad a^\dagger \ket{n} = (1 -n) \ket{1-n}$$

Now what is $(aa^\dagger + a^\dagger a) \ket{n}$? It simplifies to 
$(2n^2 -2n + 1)\ket{n}$. Plugging in $n=0$ and $n=1$ results in the same thing: 
$2n^2 -2n+1 = 1$, which means we can write that $\{ a, a^\dagger \} = 1$ always, 
and we get our first commutation relation!

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

This notation should seem weird. We almost *never* add unitary matrices in 
quantum 
computing. The resulting sum isn't generally unitary. But Hamiltonians just 
have to 
be Hermitian, and it's easy to see that the sum of Hermitian matrices is also 
Hermitian. Still, what does a sum of matrices *physically mean*? If we multiply 
some vector by this matrix, we're acting on it with the kinetic and potential 
energy matrices and our result is a sum of the results. So maybe we can 
intuitively think of a sum of Hermitian matrices as two *processes* happening 
simultaneously to our state. {% annotate This answer is in Scott Aaronson's 
recenly-published [lecture notes](https://www.scottaaronson.com/qclec.pdf) on 
Quantum Information Science. %}

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
$$
\begin{align}
\rho &= \braket{n} = Z^{-1} \mathrm{Tr } (ne^{-\beta E_i}) = Z^{-1} \sum_i 
e^{-\beta E_i} \braket{i \vert n \vert i} = Z^{-1} (0 + e^{\beta \mu} + 
e^{\beta \mu} + 2 e^{-\beta (U - 2 \mu)} ) \\ 
&= 2 \cdot Z^{-1} ( e^{\beta \mu} + e^{2 \beta \mu - \beta U}) 
\end{align}
$$

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

Clearly there is some plateau where $\rho$ becomes 1 at low temperatures when 
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

We'll start by finding the ground state and ground state energy of the 
$2 \times 2$ Hubbard model 
using VQE. To be clear, I haven't explained *why* finding the ground state 
energy is important or useful. That's because I honestly don't know. Once we 
find the ground state, we can get to work uncovering its properties, but I 
don't really have a use for the ground state energy. We'll proceed anyway 
because it'll give us a working example of VQE and the parameters we need to 
get the ground state. 

> In this section we will discuss the measurement of interesting physical 
> observables. The total energy... is the least interesting quantity. 
> [The authors of 1506.05135(https://arxiv.org/abs/1506.05135)]{.blockquote-footer}

## Representing the $2 \times 2$ Hubbard model 

I'll be using the [OpenFermion](https://github.com/quantumlib/OpenFermion)
software package for most of this post. OpenFermion 
is an open-source project that makes working with quantum chemistry much easier. 
{% annotate I originally planned to write my own code for representing and 
simulating the Hamiltonian for the Hubbard model, but it was wildly inefficient. 
My computer couldn't handle anything more than a $2 \times 2$ Hubbard 
Hamiltonian, probably because I was storing the entire matrix. For the $2 \times 2$
case, we have $8$ spin-orbitals which translates to a $2^8 = 256$ dimension 
Hilbert space. OpenFermion doesn't use this approach, opting to store strings 
of creation and annihilation operators or scipy.sparse matrices. %} OpenFermion 
is built by Google, so they've made it easy to integrate with their own quantum 
computing library [Cirq](https://github.com/quantumlib/cirq). We'll be using 
Cirq as well later on. 

For now, let's create a $2 \times 2$ Hubbard lattice in OpenFermion. 

![](/images/22hubbard.png)

{% highlight python %}
from openfermion.utils import HubbardSquareLattice

# HubbardSquareLattice parameters
x_n = 2
y_n = 2
n_dofs = 1 # 1 degree of freedom for spin 
periodic = 0 # Don't want tunneling terms to loop back around 
spinless = 0 # Has spin

lattice = HubbardSquareLattice(x_n, y_n, n_dofs=n_dofs, periodic=periodic, spinless=spinless)
{% endhighlight %}

Next, we'll want to create a `FermiHubbardModel` instance from our lattice. 
The format for the tunneling and interaction coefficients is a little weird - 
check out the [documentation](
https://openfermion.readthedocs.io/en/latest/openfermion.html#openfermion.hamiltonians.FermiHubbardModel)
for an explanation. 

{% highlight python %} 
from openfermion.hamiltonians import FermiHubbardModel
from openfermion.utils import SpinPairs

tunneling = [('neighbor', (0, 0), 1.)] 
interaction = [('onsite', (0, 0), 2., SpinPairs.DIFF)] 
# potential = [(0, 1.)]
potential = None
mag_field = 0. 
particle_hole_sym = False

hubbard = FermiHubbardModel(lattice , tunneling_parameters=tunneling, interaction_parameters=interaction, 
                            potential_parameters=potential, magnetic_field=mag_field, 
                            particle_hole_symmetry=particle_hole_sym)
{% endhighlight %} 

And that's it. We can access the actual Hamiltonian with `hubbard.hamiltonian()`. 

## VQE Primer 

VQE requires us to specify 3 things: 

#. An ansatz 
#. An initial state 
#. Some initial parameters

## The Variational Hamiltonian Ansatz 
- Haar measure

### Adiabatic evolution 

{% annotate How do I learn this myself and explain it well? Scott Aaronson's 
textbook has an explanation and I have a few bookmarked. Also I can try using 
the lecture in C191. %}

A mysterious result in quantum mechanics is the *adiabatic theorem*. To quote 
[Wikipedia](https://en.wikipedia.org/wiki/Adiabatic_theorem): "A physical 
system remains in its instantaneous eigenstate if a given *pertubation* is 
acted on it *slowly* enough and if there is a gap between the eigenvalue and 
the rest of the Hamiltonian's spectrum." 

Suppose we have two Hamiltonians $H_A$ and $H_B$, and we know an eigenstate of 
$H_A$ to be $\ket{\psi_A}$. Then we can define a new Hamiltonian 
$H(s) = (1 - s) H_A + s H_B$. Notice that as $s$ goes from $0$ to $1$ our 
time-dependent Hamiltonian goes from $H_A$ to $H_B$. 

The adiabatic theorem tell us that if we *evolve* $\ket{\psi_A}$ by $e^{-itH(s)}$
while slowly changing $s$, the final resulting state will be the *corresponding*
eigenvector of $H_B$. 
{% annotate Show what I mean by slowly change evolution as a series of matrix 
multiplications. Also, explain what corresponding eigenvector means. One thing 
I don't understand is why the two Hamiltonians $H_A$ and $H_B$ have to be 
related. Maybe they don't have to, but it would be helpful? I can get a better 
intuition for this by plotting the lowest eigenvalues of $H(s)$. %} 
This is useful if one Hamiltonian is diagonal, or at least easy to diagonalize, 
because then we can easily find its ground state. Then we adiabatically evolve 
this ground state to get the ground state of another Hamiltonian that is perhaps 
harder to diagonalize. 

I haven't proven the adiabatic theorem because I don't know how to (yet). We're 
just assuming it's true for now. Regardless, let me try to make things more 
concrete with an example. 

The Schrodinger equation is 
$$ i \frac{d \ket{\psi}}{dt} = H \ket{\psi} $$ 
which means, for *time-independent* $H$, the solution is 
$$ \ket{\psi(t)} = e^{-i H t} \ket{\psi(0)} $$
where we evolve for time $t$. 

Suppose we choose $5$ discrete times: $H(0), H(.25), H(.50), H(.75), H(1)$. At 
each time step, we'll simulate for $t=1$. Then, if the ground state of $H_A$ is 
$\ket{\psi_A}$, the ground state of $H_B$ is: 
$$\ket{\psi_B} = e^{-i H(1)} e^{-i H(0.75)} e^{-i H(0.50)} e^{-i H(0.25)} 
e^{-i H(0)} \ket{\psi_A}$$

Of course, this only works if we choose sufficiently many discrete values for 
$s$ and a short enough time $t$. {% annotate Give an 
estimate for values for number of steps and $t$. %} 

Here's an example with $2 \times 2$ Hamiltonians. We'll choose $H_A = Z$ and 
$H_B = X$. 

{% highlight python %} 
import numpy as np
import scipy.linalg as sp
import matplotlib.pyplot as plt

H_A = np.array( [[1, 0], [0, -1]] )
H_B = np.array( [[0, 1], [1, 0]] ) 
H = lambda s: (1-s)*H_A + s*H_B
psi_A = np.array([0, 1]) # The ground state of H_A 

# If n=5, then we do 5 steps: H(0), H(0.25), H(0.5), H(0.75), H(1)
n = 5
t = 1
res = psi_A
for i in range(n): 
    s = i / (n-1)
    res = np.dot(sp.expm(-1j * H(s) * t), res)
{% endhighlight %}

With `n = 5`, we get <samp>res = [0.29916787+0.66776416j, 
-0.13667712-0.66776416j]</samp>
and `np.dot(H_B, res)` gives us <samp>res = [-0.13667712-0.66776416j, 
0.29916787+0.66776416j]</samp>, which isn't quite an eigenvector. 

However, if we set `n = 50`, we get <samp>res = [ 0.71332125-0.04347244j, 
-0.69813543+0.04347244j]</samp>, which is very close to the eigenvector of the 
Pauli $X$ matrix with eigenvalue $-1$. We started with the ground state of $H_A$ 
and ended in the ground state of $H_B$, just like the adiabatic theorem predicts! 

Let's try one last example. This time we'll use 
`H_B = np.array( [[-5, 0], [0, 4]] )`. When we use the same parameters as 
before (`n = 50, t = 1`), we get <samp>res = [0, 0.92175127+0.38778164j]</samp>. 
This is very close to <samp>[0, 1]</samp> which is the eigenvector with 
eigenvalue $4$. We *didn't* get the ground state! What went wrong? 

We can get some intuition by plotting the eigenvalues of $H(s)$ as we increase 
$s$: 

![](/images/adiabatic_X.png){ float="left" }
![](/images/adiabatic_crossing.png){ float="right" }

In the first graph, there is no *crossing* of the eigenvalues. We started with 
the lowest eigenstate of $Z$ and ended in the lowest eigenstate of $X$. In the 
second graph, however, there is a crossing! Though we started in the lowest 
eigenstate of $Z$, we didn't end up in the lowest eigenstate of the final 
matrix. Instead, it's almost like we "followed the line" that shows up in the 
graph. If we wanted to get the ground state of the final matrix, we would have 
had to start in the $+1$ eigenstate of $Z$. 

Keep this in mind! It means we have to *choose which state we start in 
carefully*. We cannot simply start in the ground state everytime. 

### An ansatz based on adiabatic evolution 

### How *good* is this ansatz? 

## Choosing an initial state 



## Finding the ground state 
- do for a 2x6 lattice like page 5 of Wecker 2 and show how with few parameters 
we can explore a huge Hilbert space to get large overlap

## Analyzing the ground state 

# Uncovering magnetism from the Hubbard model 

## Spin and magnetism 
- Exercise 16, ..., all of Section 5,6
- Section 10, 11

## The Stoner criterion 



# Appendix 

## Nielsen fermionic anticommutation relations

## Adiabatic evolution 
