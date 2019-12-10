---
title: Why is the adjoint so important? 
---

# Why is the adjoint so important? 

- What the hell is the adjoint and why is it so important? 
    - This is something I never really understood. Why is the transpose 
    operation a thing and why is it so important? It's literally just 
    flipping the values along a diagonal, right? What's the deeper meaning? 
    This probably has something to do with row space vs column space. NC 2.1.6. 

In ["Why linear algebra?"]({% link _qc/linalg.md %}), we decide that linear algebra is useful because it allows us to easily verify whether something is a valid quantum gate: if its matrix representation isn't unitary, it isn't a rotation/reflection and therefore isn't an allowed transformation. 

## What is the adjoint? 

If $A$ is a linear operator on Hilbert space $V$, then there exists a unique linear operator $A^{\dagger}$ on $V$ such that for all vectors $\ket{v}, \ket{w} \in V$, 

\\[ (\ket{v}, A \ket{w}) = (A^{\dagger} \ket{v}, \ket{w}) \\]

$A^{\dagger}$ is called the *adjoint* or *Hermitian conjugate* of $A$. For vectors, we define $\ket{v}^{\dagger} = \bra{v}$. (Prove this) {% annotate Mike and Ike. Page 69. %}

**Exercise:** If $\ket{w}$ and $\ket{v}$ are two vectors, show that $(\ket{w} \bra{v})^{\dagger} = \ket{v} \bra{w}$.

TODO 

**Exercise:** Show the adjoint operation is anti-linear, {% annotate This and the prior exercise are from Mike and Ike 2.1.6. %} 
\\[ \left( \sum_{i} a_{i} A_{i} \right)^{\dagger} = \sum_{i} a_{i}^{*} A_{i}^{\dagger} \\] 

TODO  

### Why does the adjoint always exist?

## Unitarity $\Leftrightarrow$ Rotation

Suppose $U$ satisfies $U^{\dagger} U = I$. This seems like a random definition at first, but it's intimately linked to the idea of rotations. To prove this, we need to formalize rotations. In linear algebra, the basic element is a vector - from this we can build to anything else. Keeping with the physical idea as a pointed arrow in space, if we rotate the vector, we know that its length must never change. In other words, 

\\[ R \text{ is a rotation operator if and only if } \braket{\psi}{\psi} = \braket{R \psi}{R \psi} \\]

The inner product $\braket{R \psi}{R \psi}$ is a little hard to work with algebraiclly, so we'll try to simplify it. Here, bra-ket notation is helpful. Since we know $\bra{\phi} = \ket{\phi}^{\dagger}$, we can write 

\\[ \braket{R\psi} = (\ket{R \psi})^{\dagger} \ket{R \psi} = (R \ket{\psi})^{\dagger} R \ket{\psi} \\] 

where the last step follows from the fact that [$R$ must be a linear operator]({% link _qc/linalg.md %}). Now we need a way to distribute the adjoint operator. 
