## Laborator 2 - Rezolvarea sistemelor de ecuatii liniare. Factorizarea LU

1. Care este motivatia din spatele rezolvarii sistemelor de ecuatii liniare ?
- sistemele de ecuatii sunt intalnite in aplicatii precum rezolvarea de circuite
electrice (**ELTH**), Machine Learning, rezolvarea sistemelor de ecuatii neliniare
prin liniarizare, teoria sistemelor etc.

2. Ce reprezinta (abstract) un sistem de ecuatii liniare ?
- Un sistem de ecuatii liniare poate reprezenta:
    - o ecuatie matriceala, de forma $A x = b$, cu $A \in R^{m \times n}$, $x \in R^{n \times 1}$ si $b \in R^{m \times 1}$
    - o problema de gasire a intersectiei unui numar de $m$ hiperplane, unde m este
    numarul de ecuatii ale sistemului
    - o problema de gasire a coeficientilor din combinatia liniara a coloanelor lui $A$
    care ne genereaza vectorul termenilor liberi $b$ $\newline$
    Ex. $x = [x_1, x_2, x_3 ... , x_n]^T \newline$
    $b = x_1 \cdot a_1 + x_2 \cdot a_2 + ... + x_n \cdot a_n$
3. De ce nu x = A<sup>-1</sup>b ?
- chiar si pentru matrice mici, inversarea este un proces costisitor (O(n<sup>3</sup>))
si ***instabil numeric***
- factorizarile triunghiulare (LU) si ortogonale (QR) permit rezolvarea sistemelor de
ecuatii tot in O(n<sup>3</sup>), insa stabilitatea numerica a algoritmilor este imbunatatita.
- in cazul sistemelor cu matrice rare (A are doar cateva elemente nenule, restul nule),
inversa matricei este o matrice densa (ocupa foarte mult spatiu in memorie retinerea
unei astfel de matrice), de aceea se prefera alte metode (exacte, cum este factorizarea
QR sau iterative, ca metoda gradientului conjugat)

4. Care este ideea din spatele factorizarii LU?
- ideea principala este de a scrie matricea sistemului A ca produs de 2 matrice, una
**inferior triunghiulara** (L) si una **superior triunghiulara** (U).
- daca reusim sa factorizam matricea astfel, atunci sistemul nostru devine: $\newline$
$
A \cdot x = b \to L \cdot U \cdot x = b \newline
U \cdot x = y \to L \cdot y = b \newline 
$
- rezolvam **sistemul inferior triunghiular** si obtinem y, apoi rezolvam
**sistemul superior triunghiular** si obtinem x, solutia sistemului nostru.

5. Cum obtinem matricele L si U ?
- ne dorim sa determinam coeficientii acestor matrice L si U. In total, avem $n^2 + n$ valori necunoscute si doar $n^2$ conditii (ecuatii), deci nu putem gasi o factorizare LU unica.
- De aceea, vom presupune ca $n$ valori din L sau U sunt deja cunoscute. Astfel, vom alege $u_{ii} = 1$ pentru factorizarea Crout si $l_{ii} = 1$ pentru factorizarea Doolittle.

6. Tipuri de factorizari LU
- se disting 3 tipuri mari de factorizari LU:
    - factorizarea Crout ($u_{ii} = 1 \to U$ are pe diagonala principala numai 1)
    - factorizarea Doolittle ($l_{ii} = 1 \to L$ are pe diagonala
    principala numai 1)
    - factorizarea Cholesky ($U = L^T$), care este valabila numai
    pentru matrice simetrice si pozitiv definite