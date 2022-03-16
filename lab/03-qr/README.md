## Laboratorul 3 - Factorizarea QR

0. Intro norme de vectori si norme matriceale
- In practica, atunci cand lucram cu vectori $v \in R^n$, avem nevoie de
o masura care sa ne spuna cat de "mare" este vectorul nostru (riguros, spatiul
$R^n$ este un spatiu metric, adica admite o masura prin care putem determina
daca un vector este mai lung sau mai scurt). Aceasta masura se numeste **norma vectoriala**
si reprezinta o modalitate de calcul a lungimii oricarui vector din $R^n$.
- In practica, cea mai utilizata norma vectoriala este norma euclidiana, definita
prin $||v||_2 = \sqrt{\sum_{i=1}^{n} v_{i}^2}$ si reprezinta geometric distanta
de la un punct din $R^n$, dat de coordonatele sale la origine. Alte norme utilizate
sunt $||v||_1 = \sum_{i=1}^{n} |v_{i}|$ (numita si distanta Manhattan) si
$||v||_{\infty} = max_{i=1,n} |v_i|$. Aceste norme vectoriale sunt grupate sub
numele de norme Holder: $||v||_p = \sqrt[p]{\sum_{i=1}^{n} |v_i|^p}$.
- Normele vectoriale induc pentru matrice asa-numitele **norme matriceale**, care
exprima cat de mult poate o matrice sa mareasca lungimea unui vector (de cate ori),
in cazul cel mai favorabil, astfel: $||A||_p = sup_{x \in R^n} \frac{||Ax||_p}{||x||_p}$
- Cele mai uzuale norme Holder matriceale sunt norma 1 (reprezinta valoarea maxima dintre
toate valorile coloanelor - valoarea unei coloane reprezinta suma modulelor valorilor
de pe acea coloana), norma $\infty$ (reprezinta valoarea maxima dintre toate valorile
liniilor) si norma 2, care se calculeaza folosind formula $||A||_2 = \sqrt{\rho(A^T \cdot A)}$
(cea mai mare valoare singulara a matricei A - mai multe detalii la labul de QR/SVD).

In laboratorul trecut, am invatat cum putem rezolva sisteme liniare de ecuatii
si de ce inversarea matricei nu este de dorit in cazul unor astfel de probleme.
Astfel, factorizarea *LU* ne oferea un mod aparent greoi de a rezolva sistemele de
ecuatii, desi stabilitatea numerica era cu mult imbunatatita fata de solutia
banala de inversare a matricei.

1. De ce mai avem nevoie de alte metode in afara de factorizarea *LU* ?

- In practica, o mare parte din matricele cu care se lucreaza sunt matrice **sparse**
(matrice rare, adica cu putine elemente nenule). Pentru astfel de matrice
factorizarea *LU* ne ofera 2 matrice dense, marindu-se deci memoria suplimentara
utilizata (fapt care nu este de dorit -> cazul matricelor $10^6 \times 10^6$).
- Algoritmii de factorizare *QR* sunt utili si in alte cazuri pe care le vom
intalni in laboratoarele ce urmeaza (ex. algoritmul *QR* de determinare a valorilor
proprii).

2. Ce este o matrice ortogonala ?
- O matrice ortogonala are coloanele vectori ortonormati (formeaza o baza ortonormata,
adica vectorii coloana ai matricei au norma (lungime) 1 si sunt ortogonali -
perpendiculari). Un mod de a scrie aceste proprietati este:
$q_{i}^T q_j = 1$ daca $i = j$, 0 altfel.
- O matrice ortogonala are urmatoarele proprietati:
    - Inversa sa este transpusa: $Q^{-1} = Q^T$, sau $Q \cdot Q^T = Q^T \cdot Q = I_n$
    - O matrice ortogonala nu modifica norma 2 a unui vector: $||Qu||_2 = ||u||_2$
    - O matrice ortogonala nu modifica norma 2 a unei matrice: $||QA||_2 = ||A||_2$
    - Norma acesteia este 1: $||Q||_2 = 1$

3. Ce presupune factorizarea *QR* ?
- Factorizarea *QR* presupune o metoda de a scrie matricea (sistemului) $A$ sub forma $A = QR$,
unde Q este o matrice ortogonala, iar R este o matrice superior triunghiulara.
- Daca reusim sa factorizam matricea sistemului intr-o forma ortogonala, atunci putem rezolva
sistemul de ecuatii: $A = QR \to Q \cdot R \cdot x = b \to R \cdot x = Q^T \cdot b \to x = SST(R, Q^T \cdot b)$

4. Algoritmi de factorizare QR
- Algoritmii de factorizare QR studiati sunt:
    - Gram-Schmidt (ortonormalizarea unei baze - a coloanelor matricei)
    - Givens (folosind matrice de rotatie)
    - Householder (folosind reflectori elementari Householder)

5. Polinoame ortogonale
- In mod asemanator cu vectorii din $R^n$, si polinoamele formeaza un spatiu
vectorial, adica putem avea **norme**, **produse scalare** si relatii de
ortogonalitate intre polinoame.
- Exista in practica o serie de polinoame ortogonale, dintre care putem mentiona
polinoamele Legendre, Cebisev, Laguerre si Hermite, unde produsul scalar dintre 2
polinoame $p(x)$ si $q(x)$ se poate scrie ca $<p, q> = \int_{a}^{b} p(x) \cdot q(x) \cdot w(x) dx$,
unde $w(x)$ se numeste functie pondere, caracteristica fiecarui sir de polinoame in parte.

6. Demos
- rulati scriptul unit_vectors.m pentru a plota vectorii de norma Holder data prin
tipul normei (in vectorul v).
- rulati scriptul gram_schmidt_2d.m pentru a vedea algoritmul Gram-Schmidt pentru
2 vectori
- rulati scriptul givens.m pentru a vedea un vector aleator si efectul matricei de
rotatie G aleatoare asupra lui v.
- rulati scriptul householder.m pentru a vedea un vector aleator si cei 2 reflectori
posibili (liniile punctate care trec prin origine) care reflecta vectorul nostru pe
axa.