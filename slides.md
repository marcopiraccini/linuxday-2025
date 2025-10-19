---
theme: purplin
info: |
  ## Linux day 2025
  Unix Philosophy
align: center

layout: image-x
image: ../assets/linux.jpeg
imageOrder: 2
---

# Unix Philosophy

Linux day 2025

---
layout: image-x
image: ../assets/marco.jpeg
imageOrder: 2
---

# Who am I?

 - Ingegnere e architetto software ([platformatic.dev](https://platformatic.dev/) )
 - Imprenditore ([remotamente.it](https://remotamente.it/) )
 - Consulente freelance
 - Maker
 - Linux user dagli anni '90

<div class="flex gap-8 items-center mt-4">
  <img src="/assets/platformatic-dark.svg" width="100" >
  <img src="/assets/remotamente-dark.svg" width="150" >
</div>

<div class="flex mt-4">
  <img src="/assets/gh.png" >
</div>

---
layout: image-x
image: ../assets/c64.jpg
imageOrder: 2
---

# Un po' di (mia) storia

- Commodore 64 (1985)
- Amiga 500 (1988)
- i486 / Pentium (1991/1998)
- Circa 1996: linux
- 1999: abbandono definitivamente Windows per RH Linux
- Currently: [POP!\_OS](https://pop.system76.com/) / Debian

---
layout: image-x
image: ./assets/linus.jpeg
imageOrder: 2
---

# Storia di Linux

- 25/8/1991: Linus Torvalds [annuncia](https://groups.google.com/g/comp.os.minix/c/T9SjMGTSpXk/m/idk9jzNbAQAJ) che sta lavorando a un sistema operativo libero per i386.
- 1992: X Window System su linux
- 13/3/1994: Kernel 1.0
- [Il Kernel oggi](https://github.com/torvalds/linux)

_NOTA_: Quello che chiamiamo "linux" è in realtà il kernel linux + una collezione di software libero chiamato GNU. Spesso si indica come GNU/Linux

---
layout: image-x
image: ./assets/Ken_Thompson_and_Dennis_Ritchie.jpg
imageOrder: 2
---

# ...ma prima c'è Unix...

- 1969: Bell Laboratories sviluppano un sistema operativo per il PDP-7 (in assembly)
- 1969: [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) e
  [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) sviluppano
  il [B](<https://en.wikipedia.org/wiki/B_(programming_language)>) e il
  [C](<https://en.wikipedia.org/wiki/C_(programming_language)>).
  Riscrivono Unix in C, permettendo il porting su altre piattaforme
- Ogni vendor si faceva la "sua" versione di Unix
- 1983: Richard Stallman crea il [GNU Project](https://www.gnu.org/gnu/gnu.html) per creare un sistema operativo
  libero...che però non comprendeva un kernel...fino al 1991!

Quindi le radici di linux affondano negli anni '60 e '70.

---
layout: quote
position: center
---

## "Unix is simple. It just takes a genius to understand its simplicity."
Dennis Ritchie

---
layout: image-x
image: ./assets/spaghetti.png
---

# Complessità

- La complessità è un grosso problema nel mondo del software.
- Software "complesso" è difficile da capire e da manutenere.
- La filosofia di Unix enfatizza la costruzione di codice semplice, compatto, chiaro, modulare e estensibile 
che può essere facilmente mantenuto da sviluppatori diversi rispetto ai creatori originali
- In generale, si favorisce la composability rispetto a design monolitici

---
layout: quote
position: center
---

# KISS Principle
Keep it simple, stupid!

---
layout: image-x
image: ./assets/socrate.jpg
imageOrder: 2
---

# Unix Philosophy - Doug McIlroy (1978)

<div style="font-size: 0.65em;">

[Doug McIlroy](https://en.wikipedia.org/wiki/Douglas_McIlroy) nel [Bell System Technical Journal (1978)](https://archive.org/details/bstj57-6-1899):

- Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new "features".
- Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information. Avoid stringently columnar or binary input formats. Don't insist on interactive input.
- Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.
- Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

</div>

---
layout: image-x
image: ./assets/socrate.jpg
imageOrder: 2
---

# Unix Philosophy - Peter H. Salus (1994)

[Peter H. Salus](https://en.wikipedia.org/wiki/Peter_H._Salus) in "A Quarter-Century of Unix" (1994) riassume:

- Write programs that do one thing and do it well
- Write programs to work together.
- Write programs to handle text streams, because that is a universal interface.

Questa è la versione più concisa e citata.

---
layout: image-x
image: ./assets/stream.jpg
imageOrder: 2
---

# Esempio: Filtri e streams

- Un filtro software è un programma che processa uno *stream* e produce un altro *stream*.
- I filtri possono essere usati individualmente, ma sono spesso combinati in "pipelines"

---
layout: center
---

# Filtri Unix

- Ogni processo lanciato su (emulazione di) terminale può:
  - Ricevere input da `stdin` (standard input)
  - Scrivere output su `stdout`/`stderr` (standard output/error)
- Questo è il motivo per cui quando lanciate un programma da terminale, vedete il suo output sullo schermo,
  il terminale prende l'output e lo stampa.
- Funziona perché ogni processo ha una "file descriptor table" dove 0, 1 e 2 sono mappati su stdin, stdout, stderr, rispettivamente. 
   
<div style="display: flex; justify-content: center; margin-top: 8px">
  <img src="/assets/inout.png" width="400" >
</div>

---
layout: center
---

# Comandi senza input

- Alcuni comandi agiscono "senza input" ma scrivono comunque su `stdout` eg: `ls -lah`

<div style="display: flex; justify-content: center; margin-top: 8px">
  <img src="/assets/ls.png" width="400" >
</div>

---
layout: image-x
image: ./assets/wc.png
---

## "Do one thing and do it well"

Alcuni dei filtri più usati:
- wc
- grep
- sort
- head / tail
- cat
- shuf
- rev
- more
- tee

---
layout: center
---

# "Work together and handle streams"

- Le pipe permettono ai dati di un processo di essere passati ad un altro tramite un 
flusso unidirezionale.
- I filtri unix possono anche essere concatenati con le "pipe" (|): lo `stdout` di un processo diventa l'input (`stdin`)
  di quello successivo.

<div style="display: flex; justify-content: center; margin-top: 16px">
  <img src="/assets/pipe.png" width="600" >
</div>

In `bash`:

```bash
comando_1 | comando_2 | comando_3 | .... | comando_N
```
---
layout: center
---

# Quanti file ho nel folder?

<div style="font-size: 1.3em;">

```bash
ls | wc -l
```

</div>

<div style="display: flex; justify-content: center; margin-top: 32px">
  <img src="/assets/ls-wc.png" width="700px" >
</div>

---
layout: center
---

# Quante volte un file contiene una parola?

<div style="font-size: 1.1em;">

- `cat` riproduce il file su `stdout`
- `grep` filtra le righe che contengono il parametro
- `wc -l` le conta

```bash
cat file.txt | grep "marco" | wc -l
```

</div>

<div style="display: flex; justify-content: center; margin-top: 32px">
  <img src="/assets/catgrep.png" width="700px">
</div>

---
layout: center
---

# Troviamo il file più grande in un folder

<div style="font-size: 1.1em;">

- `ls -S`: ordina per dimensione, il più grande per primo
- `head -1`: prende il primo elemento

```bash
ls -S | head -1
```

</div>

<div style="display: flex; justify-content: center; margin-top: 32px">
  <img src="/assets/head.png" width="700px">
</div>

---
layout: image-x
image: ./assets/mucca.png
imageOrder: 2
---

# Dado-Mucca a sei facce

<div style="font-size: 0.85em;">

- `seq` stampa una sequenza di numeri
- `shuf` li mischia
- `head -n 1` prende l'inizio di `stdout` (la prima riga)
- `cowsay` è la mucca
- `lolcat` colora

```bash
seq 1 6 | shuf | head -n 1 | cowsay | lolcat
```

...provare anche con `figlet`

</div>

---
layout: center
---

# Mucca - versione script bash

<div style="font-size: 1.1em;">

Possiamo comporre tutto in uno script `bash`, in modo tale da poterlo lanciare direttamente

Non dimenticate di impostare i diritti di esecuzione (`chmod`)

```bash
#!/bin/bash
seq 1 6 | shuf | head -n 1 | cowsay
```

...o usando `$1` per passare un parametro

```bash
#!/bin/bash
seq 1 $1 | shuf | head -n 1 | cowsay
```

</div>
---
layout: center
---

# Aggiungiamo la voce!

<div style="font-size: 1.5em; line-height: 1.8;">

### possiamo usare espeak:

```bash
espeak -v it test
```

### ...che ovviamente è un filtro

```bash
echo "marco" | espeak -v it
```

### Dado parlante:

```bash
seq 1 6 | shuf | head -n 1 | espeak -v it
```

</div>
---
layout: center
---

# Stream from youtube

<div style="font-size: 1.1em;">

Linus torvalds introduces Linux 1.0 (1994):
https://www.youtube.com/watch?v=qaDpjlFpbfo

- `yt-dlp -o -`: scrive su stdout
- `mplayer -`: legge da stdin

```bash
yt-dlp -q -o - 'https://www.youtube.com/watch?v=qaDpjlFpbfo' | mplayer -
```

Versione script:

```bash
#!/bin/bash
yt-dlp $1 -q -o - | mplayer -
```

</div>

---
layout: center
---

# Altri esempi interessanti

<div style="font-size: 1.1em;">

### Top 10 comandi più usati dalla history

```bash
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
```

- `awk '{print $2}'`: estrae il secondo campo (il comando)
- `uniq -c`: conta le occorrenze
- `sort -rn`: ordina numericamente in modo inverso

</div>

---
layout: center
---

# Password casuale

<div style="font-size: 1.1em;">

```bash
tr -dc A-Za-z0-9 < /dev/urandom | head -c 16 | cowsay
```

- `/dev/urandom`: genera dati casuali
- `tr -dc A-Za-z0-9`: filtra solo lettere e numeri
- `head -c 16`: prende i primi 16 caratteri

</div>

---
layout: center
---

# Previsioni meteo nel terminale

<div style="font-size: 1.1em;">

```bash
curl wttr.in/Rome | lolcat
```

- `curl wttr.in/Rome`: scarica le previsioni meteo per Roma
- `lolcat`: colora l'output

Provate anche: `curl wttr.in/Bologna` o `curl wttr.in/`

</div>

---
layout: center
---

# ASCII art

<div style="font-size: 1.1em;">

```bash
figlet "Linux Day" | lolcat
```

o combinato con `cowsay`:

```bash
figlet "Linux Day" | cowsay -n | lolcat
```

- `figlet`: converte testo in ASCII art
- `cowsay -n`: la mucca dice il testo (senza bubble)

</div>

---
layout: center
---

# Grazie!

<div class="grid grid-cols-2 gap-16 mt-16" style="font-size: 1.3em;">

<div>

### Contatti
- [LinkedIn](http://it.linkedin.com/in/marcopiraccini)
- [Twitter](http://twitter.com/MarcoPiraccini)
- [GitHub](https://github.com/marcopiraccini)
- [Email](mailto:marco.piraccini@gmail.com)

</div>

<div>

### Riferimenti
- [Queste slides](https://github.com/marcopiraccini/linuxday-2025)
- [The Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy)
- [The GNU Manifesto](https://www.gnu.org/gnu/gnu.html)
- [sli.dev](https://sli.dev/)

</div>

</div>
