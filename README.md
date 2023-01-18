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
