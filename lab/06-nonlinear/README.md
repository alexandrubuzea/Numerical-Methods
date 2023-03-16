## Laboratorul 6: Rezolvarea ecuatiilor neliniare

0. Intro: de ce avem nevoie de asa ceva ?

- Sistemele de ecuatii liniare sunt deosebit de intalnite in practica, iar in
laboratoarele trecute am gasit metode foarte rapide pentru rezolvarea acestora.
- In practica, de obicei fenomenele naturale nu sunt liniare, astfel ca este
necesara elaborarea unor metode de rezolvare (aproximativa) a unor ecuatii
neliniare.
- De ce nu rezolvam analitic ecuatiile neliniare ? Pentru ca in majoriatea
cazurilor nu este posibil acest lucru. Exemplu: x + arctg(x) = 1
- O idee generala este sa aducem forma ecuatiei noastre de la o egalitate de 2
membri variabili la o egalitate cu 0, adica la forma **f(x) = 0**.

1. Metoda bisectiei
- Este cea mai simpla si mai intuitiva metoda iterativa.
- Reprezinta o generalizare a cautarii binare pentru domeniul continuu.
- Metoda presupune cautarea radacinii pe intervalul [a, b], pentru care stim ca
functia f ia valori de semn opus in capetele acestui interval.
- Verificam semnul mijlocului intervalului, c = (a + b) / 2 si apoi continuam
cautarea pe unul dintre intervalele [a, c] sau [c, b] (in functie de semnul lui f(c))

2. Metoda lui Newton
- Este cunoscuta si ca metoda tangentei sau metoda Newton-Raphson
- Se bazeaza pe modalitatea de a gasi, in unele cazuri, o aproximatie mai buna
pentru radacina ecuatiei din valoarea curenta a aproximatiei pentru radacina,
valoarea functiei in acest punct si valoarea derivatei functiei in punct.
- Procedeul are si o semnificatie geometrica, si anume: din punctul de abscisa xk
(aproximatia curenta), ducem tangenta la graficul lui f, iar noua aproximatie xk+1
se afla la intersectia tangentei cu axa Ox.
- Nu este garantata convergenta ! Cu toate acestea, in cazul in care converge, convergenta
este mult mai rapida decat la metoda bisectiei (eroare patratica = de ordin 2, adica la
fiecare iteratie precizia ca numar de zecimale se dubleaza).

3. Metoda secantei
- Ideea este aceeasi ca la metoda lui Newton, doar ca sunt folosite 2 valori
anterioare pentru a aproxima derivata functiei.
- Metoda cu stabilitate numerica mai buna decat Newton, dar care converge mai lent
(eroare de ordin phi, unde phi este numarul de aur).

4. Sisteme de ecuatii neliniare
- Se pot folosi metode bazate pe puncte fixe sau putem generaliza metoda lui Newton, avand
insa in loc de derivata o matrice numita **matricea jacobiana**.
- Pentru metodele bazate pe puncte fixe, este necesar ca toate derivatele partiale sa fie strict
mai mici decat 1/n (in modul).
