## Laboratorul 5: Metode iterative

0. Motivatie: de ce avem nevoie de alte metode in afara de cele studiate pana acum ?
- Pana acum, principala noastra preocupare a fost sa rezolvam sisteme de ecuatii liniare
folosind diverse metode (factorizarile LU si QR, eliminarile gaussiene).
- Toate metodele studiate pana acum au in comun faptul ca fac parte din marea categorie
a metodelor **exacte**, adica acestea ne permit sa obtinem solutia exacta a sistemului
intr-un numar finit de pasi (in limita erorilor de calcul/aproximare inevitabile).
- Metodele exacte mai au in comun ceea ce se numeste **clasa de complexitate**, care este
o masura pentru cati pasi realizeaza un algoritm - in cazul nostru o metoda numerica, pentru
un input de o dimensiune anume - in cazul nostru, dimensiunea matricei sistemului, notata cu
$n$. Pentru **toate metodele exacte**. complexitatea este $O(n^3)$.
- Pentru matrice mari (cu dimensiuni de ordinul miilor), nu mai este fezabila folosirea unei
metode exacte, intrucat timpul de rezolvare este foarte mare (exemplu: pentru n = 1000, vom
astepta aproximativ 1000 s pentru rezolvarea sistemului -> foarte mult).
- Pentru a reduce complexitatea necesara efectuarii calculelor, suntem pusi in fata unui
compromis: ne putem multumi in anumite cazuri cu o solutie aproximativa (data cu o anumita
toleranta) in locul unei solutii exacte. Astfel, complexitatea se reduce la $O(n^2)$ per pas.
- Putem folosi in loc metode iterative:
    - stationare: avem o matrice de iteratie $G$ si un vector de iteratie $c$ care nu se
modifica pe parcursul procesului iterativ, cu alte cuvinte nu avem o modificare in ceea ce
priveste modul in care solutia de la pasul curent depinde de cea de la pasul anterior.
    - nestationare: se bazeaza pe gasirea in spatiul vectorial $R^n$ a unor **directii de**
**cautare**, care pot avea diverse relatii intre ele (pot fi directii ortogonale, conjugate
etc).

1. Metode iterative stationare
- Se disting 3 tipuri de metode iterative stationare:
    - Jacobi
    - Gauss-Seidel (imbunatatire fata de Jacobi)
    - SOR (Succesive Overrelaxation) -> un hibrid intre Gauss-Seidel si Jacobi.
- Fiecare dintre aceste metode se bazeaza pe spargerea matricei sistemului in 3 parti:
cea diagonala, cea inferior triunghiulara si cea superior triunghiulara. 