Korzystając ze skanera flex i parsera yacc proszę napisać prosty kalkulator.
Proszę zdefiniować akcje semantyczne dla skanera flex i proszę nie definiować
akcji semantycznych dla parsera yacc (wyjątkiem jest reguła 6 poniżej). Proszę
zapisywać symbole TERMINALNE wielkimi literami, a symbole nieterminalne małymi
literami.

Reguły:

1. Instrukcje zawarte są w pliku wejściowam. Wyniki operacji są zapisywane do
pliku wyjściowego.

2. Instrukcja zawsze kończy się znakiem =.

3. Instrukcja może być zapisana w kilku liniach.

4. Liczby są zapisane w systemie dziesiętnym. Mogą to być liczby całkowite lub
rzeczywiste. Separatorem dziesiętnym jest kropka (.). Kalkulator wykonuje
operacje na liczbach, kątach (wyrażonych w stopniach, minutach i sekundach)
i komórkach pamięci.

5. Kalkulator wykonuje operacje na liczbach, kątach (wyrażonych w stopniach,
minutach i sekundach) i komórkach pamięci.

  * Kąty są wyrażane w systemie sześćdziesiętnym, np. 34d54m12.89s oznacza kąt
34 stopni, 54 minuty i 12.89 sekund (34°54'12"89).

  * Jeżeli liczba sekund jest równa zero, może być opuszczona: 43d54m oznacza
43°54'. Jeżeli liczba minut jest równa zero, to może być pominięta tylko wtedy,
gdy liczba sekund jest także równa zero. Jeżeli liczba sekund jest niezerowa, a
liczba minut równa zero, wtedy minuty nie mogą być pominięte, np.: 87d12s nie
jest poprawnym zapisem, taka wartość powinna być zapisana jako 87d00m12s.
Początkowe zera oznaczające stopnie (a nawet minuty) mogę być pominięte,
np.: 23m lub 0d23m

  * Niedopuszczalne są spacje między kątami, minutami, stopniami.

6. W wyrażeniach mogą być użyte następujące operatory: +, \*, /, unarny -.
Dodatkowymi operatorami są: sin dla sinusa i cos dla kosinusa.
Wyrażenie sin cos 23d oznacza sin (cos 23°). Precedencja opratorów jest naturalna.
By ją zmienić należy użyć nawiasów ( ).
**Proszę zdefiniować akcje semantyczne dla akcji opisanych w tym punkcje!**

7. W kalkulatorze dostępne są komórki pamięci. Są oznaczone symbolami M1, M2, ..., M6.
Przypisane wartości do komórki pamięci oznaczone jest symbolem <-.

8. Przypisanie jest specjalnym rodzajem operacji i nie może być, użyte jako wyrażenie.
Wyrażenie może być użyte po prawej stronie przypisania. L-wartością jest tylko nazwa komórki pamięci.

9. Plik wejściowy może zawierać komentarze jednolinijkowe rozpoczynające się od znaków ##.

10. Błąd w instrukcji nie powinien przerywać pracy analizatora.
Zakładamy, że dostępna jest funkcja przekształcająca kąty na wartości zmiennoprzecinkowe:
`double angle2double (char * s);`
