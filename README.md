# Lab2: “Let’s count stuff”
# Introduction
Dans le 2ème TP, nous allons d'abord implémenter un compteur décimal à 1 chiffre à afficher sur un afficheur à 7 segments. 
Nous allons ensuite implémenter un compteur décimal à 3 chiffres et l'afficher sur 3 afficheurs à 7 segments avec la méthode de polling pour l'implémenter, 
ensuite nous devons ajouter un timer et l'implémenter sous forme d'interruption.
Les étapes du projet comprenaient la conception de l'architecture du système, la création d'un système Nios II de base, 
l'implémentation d'un compteur décimal de 1 et 3 bits à l'aide d'un programme C, 
l'ajout ensuite d'un timer pour contrôler la vitesse de l'affichage sur un afficheur à 7 segments 
et enfin la conversion des nombres en BCD à l'aide de composants hardware ou software.


# Architecture du système
Le système de co-conception que j'ai construit inclut **le noyau NIOS II**, **la mémoire RAM**, **un module UART**, **un PIO** puis **un afficheur 7 segments**, ainsi qu'**un module timer**. Le diagramme de structure est le suivant : 
图片

Lorsque chaque afficheur à 7 segments nécessite un code de 4 bits, pour un compteur à 3 chiffres, nous avons besoin d'un module PIO de 12 bits.
Pour faciliter le travail suivant, j'ai ajouté **le module timer** et les interruptions timer à QSYS à l'avance et j'ai réglé **la période du timer à 1 seconde**.
Le schéma QSYS connecté selon le schéma ci-dessus est le suivant :

# Avancement et Résultats
Après avoir connecté les composants, j'ai généré le langage de description hardware correspondant et j'ai également écrit une simple fonction de code binaire vers BCD en VHDL. Après la synthèse dans Quartus, je suis passé à la conception du module software.

## Compteur 1 bits
Un compteur de 1 bits est simple, j'ai écrit une boucle de 0 à 9 dans le fichier C et ajouté un délai de 1 seconde - usleep(1000000) - entre chaque changement de valeur pour obtenir l'effet de temporisation.

## Compteur 3 bits avec polling
Dans le même principe, je peux implémenter un compteur à 3 chiffres par polling, en utilisant juste 3 boucles pour compter de 0 à 999, comme dans la fonction précédente, j'ai ajouté une temporisation de 1 seconde.

## Compteur 3 bits avec timer
Ayant préchargé le module de timer, j'ai donc pu modifier directement la partie software. Pour cela, j'ai créé la fonction **TIMER_IRQ()** pour gérer les interruptions. Chaque fois qu'une interruption est lancée, cette fonction fait un total interne et le total est introduit dans la fonction **int2seg()** pour prendre le reste des dixièmes et des centaines de bits respectivement, et enfin l'affichage à 7 segments correspondant est allumé via PIO


# Conclusion 
Le deuxième TP était moins difficile que le premier parce qu'il n'impliquait qu'une interruption, mais celui-ci impliquait un développement plus poussé au niveau hardware, ce qui m'a beaucoup apporté et m'a donné un sens plus profond de la flexibilité de la co-conception. L'utilisation d'une solution purement software pour allumer un afficheur à 7 segments n'est pas une tâche facile, mais dans le cadre de la co-conception, nous pouvons facilement implémenter un compteur à 3 chiffres en écrivant simplement la correspondance binaire vers BCD en VHDL à l'avance au niveau hardware, ce qui améliore certainement l'efficacité de notre développement.
