## Laboratorul 4 - Eliminarea gaussiana

0. Intro
- Eliminarea gaussiana este poate cel mai simplu algoritm de aducere a unui
sistem liniar de ecuatii la forma sa superior triunghiulara.
- Aceasta metoda se bazeaza pe existenta unor **transformari elementare** la
nivelul ecuatiilor sistemului liniar, cum ar fi:
    - inmultirea unei linii cu un numar real nenul
    - adunarea unei linii la alta linie
    - interschimbarea a 2 linii (nu coloane, ci doar linii !)
- Pentru ca sistemele succesive obtinute prin aplicarea transformarilor sa fie
echivalente, transformarile vor fi facute pe matricea A_ext = [A, b] (matricea
extinsa a sistemului)
- In practica, din cele 3 operatii elementare se pot deriva o multime de
operatii complexe, care pot fi folosite direct, fara niciun fel de justificare:
    - inmultirea unei linii cu un numar real si adunarea la o alta linie
    - permutarea liniilor matricei, in orice ordine
    - orice operatie complexa care se bazeaza pe cele 3 operatii fundamentale
de mai sus.

1. Eliminarea gaussiana clasica (G)
- Eliminarea gaussiana clasica se bazeaza exclusiv pe scalarea unei linii (inmultirea
cu un numar real) si adunarea acesteia la alta linie, astfel incat termenul de pe
respectiva linie de sub **pivot** sa aiba valoare nula.
- Are o stabilitate numerica slaba, deoarece precizia operatiilor depinde de modulul
elementelor diagonale (daca acestea sunt mici, vom efectua impartiri la numere mici
de unde rezulta erori de calcul), de aceea acest algoritm **nu se foloseste** de obicei.

2. Eliminarea gaussiana cu pivotare partiala (GPP)
- Aceasta metoda presupune sa ne alegem la fiecare pas cel mai mare element (in modul) de sub pivot (care este elementul diagonal - A_ext(p,p) in notatia Matlab/Octave) si sa
**aducem** respectivul element in pozitia pivotului (prin interschimbarea liniei lui
cu linia p din matricea extinsa).
- Dupa pivotare, are loc scalarea liniei p si adunarea la fiecare linie de sub aceasta
pentru a obtine zerouri sub elementul pivot.

3. Eliminarea gaussiana cu pivotare partiala cu pivot scalat (GPPS)
- Aceasta metoda propune o alta metoda de pivotare, astfel: alegem linia de sub linia
pviotului pentru care elementul de sub pivot (care, dupa interschimbare, ar putea veni
pe pozitia pivotului) sa fie **cel mai mare in modul** in raport cu **maximul de pe**
**linia sa** (de asemenea in modul).

4. Eliminarea gaussiana cu pivotare totala (GPT).
- Aceasta metoda presupune ca, pentru un pivot A_ext(p, p) din matricea extinsa sa
realizam pivotarea cu cel mai mare element in modul din submatricea A_ext(p:n, p:n).
- Cu alte cuvinte, aceasta metoda de pivotare trece peste restrictia naturala de a
nu permuta coloanele, fiind necesar sa permutam coloanele pentru a aduce respectivul
element maxim pe pozitia pivotului.
- Pentru a elimina acest neajuns, este recomandata retinerea unei matrice de permutare
sau a unui vector in care tinem minte permutarile facute (ex. v = 1:n initial, iar mai
apoi orice permutare dintre coloanele i si j va fi realizata si in vectorul v, adica
swap(v(i), v(j))).

5. Concluzii
- Eliminarea gaussiana (de orice fel) este un algoritm usor de inteles, care se preteaza
insa numai pentru sistemele liniare de mici dimensiuni (pana in ordinul sutelor).
- Pentru sisteme foarte mari, preferam alte metode exacte precum factorizarea QR sau
metodele iterative.