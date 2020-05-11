# Aplikacija za online prodaju elektronske opreme


Projektni zahtev
Razviti aplikaciju za prodaju elektronske robe. Elektronska roba je razvrstana po kategorijama. Kategorije mogu imati svoje
potkategorije. Ne postoji granica za broj potkategorija. Svaka kategorija ima jedinstveni naziv i sliku koja uopšteno
predstavlja vrstu robe te kategorije. Svaka kategorija ima popis određenih osobina koje može imati svaka roba koja toj
kategoriji pripada. Osobine se koriste i kao parametri za pretragu robe. Roba može da pripada samo jednoj kategoriji i ima
svoj naziv, kratak opis, detaljan opis, jednu ili više fotografija, kao i vrednosti za jednu ili više osobina kategorije kojoj roba
pripada. Roba ne možeimati više vrednosti za istu osobinu. Za svaku robu se vodi evidencija o promenama cena i na veb
aplikaciji se za svaku robu prikazuje najnovija cena robe.
Roba može da bude povučena izprodaje, a tada se ne prikazuje u listinzima kategorija niti u rezultatima pretraga, a
stranica za prikaz detalja povučene robe preusmerava posetioca na listing robe iz kategorije kojoj je ta roba pripadala.
Veb aplikacija predviđa mogućnost isticanja određene robe na početnoj stranici u dva oblika. Prvi oblik je prikaz robe koja
je obeležena kao promovisana, a drugi je prikaz najnovije dodate robe u ponudu prodavnice. Samo administratori, koji se
na portal prijavljuju sa pristupnim parametrima mogu da uređuju kategorije, osobine, robu, fotografije i da imaju uvid u
porudžbine. Posetioci sajta mogu da pregledaju robu po kategorijama, mogu da vrše pretragu sve robe, kao i pretragu
robe po osobinama unutar odabrane kategorije, korišćenjem mogućnosti filtriranja.
Da bi posetioci mogli da izvrše poručivanje robe, moraju da budu prijavljeni na aplikaciju. Posetioci mogu da registruju
korisnički nalog, da se prijave sa svojim postojećim pristupnim parametrima ili da zatraže link za izdavanje nove lozinke,
ukoliko su staru zaboravili. Prilikom registracije, posetilac mora da navede svoje lične podatke, kontakt podatke, adresu
stanovanja i željene pristupne parametre. Nije moguće registrovati više naloga sa istom adresom elektronske pošte. Kada
se posetilac prijavi na aplikaciju sa svojim pristupnim parametrima, on kao prijavljeni korisnik može da obavlja sve iste
aktivnosti kao i posetilac sajta, s tim da može i da dodaje robu u korpu, da pregleda i menja detalje svog korisničkog naloga,
da pregleda listu svojih prethodnih porudžbina i da promeni lozinku naloga.
Prilikom dodavanja robe u korpu, može da izabere količinu. Ako u korpi već postoji ista roba, ne dodaje se ponovo, već se
količina već dodate robe uveća za novu količinu. U bilo kom trenutku, prijavljeni korisnik može da pregleda sadržaj korpe,
da izbriše neke stavke iz nje ili da promeni količinu odabrane robe u korpi. Ukoliko želi, može da izvrši poručivanje robe iz
korpe. Administratori, koji mogu da vide spisak dospelih porudžbina, mogu da vide detalje porudžbine, podatke kupca i
da porudžbinu obeleže statusom. Mogući statusu su da je porudžbina odbijena, prihvaćena ili, na kraju, realizovana.
Statuse može videti i prijavljeni korisnik u prikazu porudžbina.
Tehnička ograničenja

Aplikacija mora da koristi relacionu bazu podataka. Koristiti ranije usvojenu konvenciju imenovanja elemenata baze.

Platforma aplikacije mora da bude Node.js i potrebno je izvršiti razdvajanje odgovornosti delova aplikacije (MVC).

Potrebno je osmisliti grafički korisnički interfejs veb aplikacije koji mora da primenjuje prilagodljiv veb dizajn.

Neophodno je verziranje koda aplikacije korišćenjem Git repozitorijuma.

Primenjivati predloge i primere dobre prakse za razvoj veb aplikacija.