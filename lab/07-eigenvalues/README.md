### Laboratorul 7: Vectori si valori proprii

0. Introducere
- O pereche ($\lambda$, v) se numeste o pereche valoare proprie - vector propriu
pentru o matrice A (obligatoriu patratica) daca $A \cdot v = \lambda \cdot v$,
iar vectorul v este **nenul** (adica are cel putin o componenta nenula).
- Definitia poate fi interpretata in mai multe moduri, astfel:
    - Un prim mod este de a interpreta relatia $A \cdot v = \lambda \cdot v$
ca un sistem omogen, de forma $(A - \lambda \cdot I) \cdot v = 0$. Deoarece vectorul
este nenul, sistemul trebuie sa admita si alte solutii in afara de cea banala (v = 0),
de aceea este necesar ca sistemul nostru sa fie compatibil nedeterminat, adica
$det(A - \lambda \cdot I) = 0$.
    - Un alt mod de a interpreta relatia este cel in care privim A ca pe o aplicatie
(liniara). Relatia are astfel sensul ca aplicarea aplicatiei noastre asupra unui
vector (propriu) nu ii modifica directia / **span-ul**, ci doar ii modifica modulul
(lungimea) cu un factor de scalare egal cu $\lambda$ (daca factorul de scalare este
negativ, rezultatul va avea semn opus in raport cu vectorul initial).

1. Metoda puterii directe
- se foloseste pentru a calcula valoarea proprie dominanta si vectorul propriu asociat.
- de observat ca metoda puterii NU converge intotdeauna, este necesar ca valoarea
proprie dominanta sa fie numar real.

2. Metoda puterii inverse
- se foloseste pentru a calcula valoarea proprie de modul minim (cea mai mica in modul)
si vectorul propriu asociat. Similar cu aplicarea metodei puterii pentru inversa matricei
A.

3. Metoda puterii inverse deplasate
- se foloseste pentru a calcula valoarea proprie cea mai apropiata de un numar dat (care
reprezinta o aproximatie a valorii proprii care se doreste a se calcula).