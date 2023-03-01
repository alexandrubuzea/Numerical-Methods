## Laborator 1 - Introducere in GNU Octave

1. De ce GNU Octave ?
- avem nevoie de un **mediu de programare** specializat in rezolvarea problemelor cu specific numeric. 
- mediu de programare usor de folosit, avand nevoie de cunostinte minime de programare
- varianta open-source a MATLAB

2. Intro GNU Octave
- elementul de baza este **matricea** (chiar si constantele numerice sunt vazute ca matrice 1x1)
- Octave suporta si alte tipuri de date (structuri + siruri de caractere), fiind un limbaj mai degraba procedural
- Octave este limbaj interpretat -> comenzile se vor executa linie cu linie (nu se face in prealabil verificare de sintaxa)

3. Comenzi suportate
- Octave suporta majoritatea comenzilor Unix (in special cele de navigare prin sistemul de fisiere = comenzi precum *ls*, *pwd*, *cd* etc)
- comanda ***help*** -> analogul comenzii ***man*** din Linux. Use it !
- comenzi specifice: declarare de variabile, folosirea de operatii algebrice etc.

4. Cum declaram variabile ?
- prin simpla instantiere (Ex. a = 3)
- by default, rezultatul comenzii (rezultatul numeric + variabila in care se stocheaza rezultatul) se va afisa in consola 
sub forma "a = ...". Putem opri acest comportament prin utilizarea ; la finalul comenzii.
- daca rezultatul comenzii nu este stocat in mod explicit intr-o variabila, mediul de programare va pune acel rezultat in 
variabila de mediu *ans* (un fel de variabila globala)

5. Comenzi utile
- declararea de variabile (inclusiv sintaxa de tip [initial:step:final])
- functii de determinare a dimensiunilor (length(), size())
- cum accesam elementul de pe pozitia i dintr-un vector ? v(i) (nu v[i] ca in C/C++)
- indexarea elementelor incepe ***de la 1 !!***
- operatorii +, *, /, ^ (operatii aritmetice). ^ reprezinta ridicarea la putere
- cu operatorul * se poate realiza inclusiv inmultirea matricelor, daca este posibil.
- exista operatorii .*, ./ care realizeaza operatii element cu element, daca este posibil (aceleasi dimensiuni pentru operanzi)

6. Alte aspecte specifice GNU Octave
- avem instructiuni de tip *if* si *for/while*.
- putem scrie functii (o functie intr-un singur fisier .m, iar acel fisier sa aiba numele functiei)
- comenzi succesive pot fi plasate in fisiere .m, numite scripturi.
- avem functii de citire/scriere de tipul C, dar si comenzi specializate (*save* si *load*) pentru lucrul exclusiv cu fisiere .mat
  
7. **Extra: Vectorizari**
- Octave lucreaza mult mai rapid cu matrice decat cu instructiuni de tip *for/while*, de aceea este bine sa folosim instructiuni vectorizate ori de cate ori este posibil.