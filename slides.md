---
theme: purplin
info: |
  ## Linux day 2024
  Unix Phylosophy
align: center

layout: image-x
image: ../assets/linux.jpeg
imageOrder: 2
---

# Unix Philosophy

Linux day 2024

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

<div class="flex">
  <img src="/assets/plt.svg" width="100" >
  <img src="/assets/remotamente.svg" width="150" >
</div>

<div class="flex">
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
- Approx 1996: linux
- 1999: abbandono definitivamente Windows per RH Linux
- Currently: [POP!\_OS](https://pop.system76.com/) / Debian

---
layout: image-x
image: ./assets/linus.jpeg
imageOrder: 2
---

# Storia di Linux

- 25/8/1991: Linus Torvalds [fa funzionare il primo kernel](https://groups.google.com/g/comp.os.minix/c/T9SjMGTSpXk/m/idk9jzNbAQAJ) linux (per fare andare minix sul suo i386).
- 1992: X Window System su linux
- 13/3/1994: Kernel 1.0
- [Il Kernel oggi](https://github.com/torvalds/linux)

_NOTA_: Quello che chiamiamo "linux" e' in realta' il kernel linux + una collezione di software libero chiamato GNU. Spesso si indica come GNU/Linux

---
layout: image-x
image: ./assets/Ken_Thompson_and_Dennis_Ritchie.jpg
imageOrder: 2
---

# ...ma prima c'e' Unix...

- 1969: Bell Laboratories sviluppano un sistema operativo per il PDP-7 (in assembly)
- 1969: [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) e
  [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) sviluppano
  il [B](<https://en.wikipedia.org/wiki/B_(programming_language)>) e il
  [C](<https://en.wikipedia.org/wiki/C_(programming_language)>).
  Riscrivono Unix in C, permettendo il porting su altre piattaforme
- Ogni vendor si faceva la "sua" versione di Unix
- 1983: Richard Stallman crea il [GNU Project](https://www.gnu.org/gnu/gnu.html) per creare un sistema operativo
  libero...che pero' non comprendeva un kernel...fino al 1991!

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

# Complessita'

- La complessita' e' un grosso problema nel mondo del software.
- Software "complesso" e' difficile da capire e da manutenere.
- La filosofia di Unix enfatizza la costruzione di codice semplice, compatto, chiaro, modulare e estensibile 
che puo' essere facilmente mantenuto da sviluppatori diversi rispetto ai creatori originali
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

# Unix (Design) Philosophy

- Write programs that do one thing and do it well 
- Write programs to work together.
- Write programs to handle text streams, because that is a universal interface.

Ne esistono varie "versioni" ma che ruotano attorno agli stessi concetti.
Questa e' la versione piu' coincisa e' (Peter Salus)

---
layout: image-x
image: ./assets/stream.jpg
imageOrder: 2
---

# Esempio: Filtri e streams

- Un filtro sofyware e' un programma che processa uno *stream* e produce un altro *stream*.
- I filtri possono essere usati individualmente, ma sono spesso combinati in "pipelines"

---
layout: center
---

# Filtri Unix

- Ogni processo lanciato su (emulazione di) terminale puo':
  - Ricevere input da `stdin` (standard input)
  - Scrivere output su `stdout`/`stderr` (standard output/error)
- Questo e' il motivo per cui quando lanciate un programma da terminale, vedete il suo output sullo schermo,
  il terminale prende l'output e lo stampa.
- Funziona perche' ogni processo ha una "file descriptor table" dove 0,1 e 2 sono mappati su stdin, stoud, stderr, rispettivamente. 
   
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

Alcuni dei filtri piu' usati:
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

- Le pipes permettono i dati di un processo di esssere passati tramite un 
flusso unidirezionale
- I programmi unix pero' possono anche essere concatenati con le "pipe" (|): lo `stdout` di un processo diventa l'input (`stdin`)
  di quello successivo.

<div style="display: flex; justify-content: center; margin-top: 16px">
  <img src="/assets/pipe.png" width="500" >
</div>

In `bash`:

```bash
comando_1 | comando_2 | comando_3 | .... | comando_N
```
---
layout: center
---

# Quanti file ho nel folder?

```bash
 ls -lah | wc -l

```

<div style="display: flex; justify-content: center; margin-top: 16px">
  <img src="/assets/ls-wc.png" width="500" >
</div>

---
layout: center
---

# Quante volte un file contiene una parola?

- `cat` riproduce il file su `stdout`
- `grep` filtra le righe che contengono il parametro
- `wc -l` le conta


```bash
cat file.txt | grep "marco" | wc -l
```

---
layout: center
---

# Troviamo il file piu' grande in un folder

- `ls -S`: ordina per dimensione, il piu' grande per primo
- `head -1`: prende il primo elemento

```
ls -S | head -1 
```

---
layout: image-x
image: ./assets/mucca.png
imageOrder: 2
---

# Dado-Mucca a sei facce
- `seq` stampa una sequenza di numeri
- `shuf` li mischia
- `head -n 1` prende l'inizio di `stdout` (la prima riga)
- `cowsay` e' la mucca

```bash
seq 1 6 | shuf | head -n 1 | cowsay
```

...provare anche con `figlet`

---
layout: center
---

# Mucca - versione script bash

- Possiamo comporre tutto in uno script `bash`, in modo tale da poterlo lanciare direttamente
- Non dimenticate di impostare i diritti di esecuzione (`chmod`)

```bash
#!/bin/bash
seq 1 6 | shuf | head -n 1 | cowsay

```

...o usando `$1` per passare un parametro

```bash
#!/bin/bash
seq 1 $1 | shuf | head -n 1 | cowsay

```
---
layout: center
---

# Aggiungiamo la voce!

- possiamo usare espeak:

```bash
espeak -v it test
```
...che ovviamente e' un filtro

```bash
echo "marco" | espeak -v it 
```

- Dado parlante:
```bash
seq 1 6 | shuf | head -n 1 | espeak -v it

```
---
layout: center
---

# Download video from youtube:

- Linus torvalds introduces Linux 1.0 (1994): https://www.youtube.com/watch?v=qaDpjlFpbfo
- Can be downloaded using:
```bash

yt-dlp 'https://www.youtube.com/watch?v=qaDpjlFpbfo'

```
Ma supponiamo di volere lanciare un video di youtube su Mplayer direttamente:

- `yt-dlp -o -`: scrive su stdout
- `mplayer -`: legge da stdin


```bash
yt-dlp -q -o - 'https://www.youtube.com/watch?v=qaDpjlFpbfo'  | mplayer -
```
Versione script: 

```bash
#!/bin/bash
yt-dlp $1 -q -o - | mplayer - 

```

---

# Grazie!

- Un po' di riferimenti:
  - [The Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy)
  - [The GNU Manifesto](https://www.gnu.org/gnu/gnu.html)
  - [sli.dev](https://sli.dev/)

---
