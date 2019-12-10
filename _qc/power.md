---
title: What makes a quantum computer powerful? 
--- 

- What makes a quantum computer powerful? 
    - All I know is that Hadamard gates unlock a lot of potential. But they're 
    really only one random unitary matrix. How many more important general 
    unitary matrices exist that haven't been discovered? Can I prove Hadamard 
    is special? 
- What's so important about the Fourier transform? 
    - Maybe take 120 but definitely do my own research. 
    - [Dabacon](https://dabacon.org/pontiff/2006/07/31/all-you-compute-and-all-you-qft-is-all-your-life-will-ever-be/) 
    says there's a proof that the Toffoli and Hadamard gates are universal for 
    quantum computing (prove this myself) and since the Hadamard is just a 
    Fourier transform over the simplest of all groups ( the cyclic group with 
    two elements), *every quantum algorithm is nothing more than the Fourier 
    transform with classical computation*. 
- MN 4.5 proves that any multiple qubit logic gate can be composed from CNOT 
and single qubit gates. So we can reduce our search for power to fewer gates... 
- Certainly quantum computers can simulate any classical computer because the 
Toffoli gate is a NAND gate and NAND is universal for classical computation 
(prove this myself). 
- Kitaev's generalization to the hidden subgroup problem is important because 
Deutsch's, Shor's, and other expoentially fast algorithms can all be seen as 
a special case of this generalization. (Wait but those algorithms are also all 
QFT variants so it Kitaev's just QFT or something else?) 

