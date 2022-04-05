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
- Se bazeaza pe spargerea matricei sistemului A sub forma A = N - P
- In functie de alegerile noastre pentru N si P, obtinem o alta metoda stationara.
- Fiecare dintre aceste metode se bazeaza pe spargerea matricei sistemului in 3 parti:
cea diagonala, cea inferior triunghiulara si cea superior triunghiulara. 
- Se disting 3 tipuri de metode iterative stationare:
    - Jacobi: alegem N partea diagonala, adica N = D, si P = - (L + U)
    - Gauss-Seidel (imbunatatire fata de Jacobi): alegem N = D + L si P = -U
    - SOR (Succesive Overrelaxation) -> un hibrid intre Gauss-Seidel si Jacobi, de aceea
vom alege matricele in raport cu factorul de suprarelaxare w: N = D + wL, P = (1 - w)D - wU.
- In general, metodele noastre vor converge daca A nu are pe diagonala valori nenule si daca
raza spectrala a matricei de iteratie G **este subunitara**.
- Cele 3 metode se pot scrie si sub forma nematriceala, de unde se pot observa diferentele
dintre acestea si avantajele uneia asupra celorlalte.
- Pentru SOR, factorul de suprarelaxare trebuie sa indeplineasca relatia |w - 1| < 1, altfel
metoda nu va converge garantat.

2. Metode iterative nestationare
- Se bazeaza pe gasirea unei **directii de cautare** si pe schimbarea acesteia la fiecare pas
din procesul iterativ.
- Aceasta directie de cautare poate fi directia gradientului (metoda gradientului) sau o
directie conjugata celor anterioare (metoda gradientului conjugat).
- 2 vectori u si v se numesc **conjugati** daca u^T A v = 0 pentru matricea sistemului A
(care trebuie sa fie **simetrica si pozitiv definita**).
- alte detalii despre CG (Conjugate Gradient):
    - se poate ajunge la solutia **exacta** in n pasi (unde n este dimensiunea sistemului), de
aceea spunem ca CG are caracter de metoda exacta. Cu toate acestea, este considerat o metoda
iterativa deoarece ne putem opri mai devreme, daca eroarea ne satisface o toleranta dorita.
    - cautarea solutiei sistemului se face intr-un subspatiu pe care il extindem la fiecare
pas cu un nou vector, care se numeste subspatiul Krylov: {b, Ab, A^2b, A^3b, ..., A^n-1b}
