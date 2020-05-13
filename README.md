<!-- TABLE OF CONTENTS -->
## Table des matières

* [À propos du projet](#à-propos-du-projet)
  * [Built With](#built-with)
* [Débuter](#débuter)
  * [Prérequis](#prérequis)
  * [Installation](#installation)
  * [Traitement audio sur Matlab](#traitement-audio-sur-matlab)



<!-- ABOUT THE PROJECT -->
## A propos du projet

Dans le cadre du cours 6GEI600 Traitement numérique des signaux, voici notre implémentation de la solution pour le projet de conception final. Le projet consiste au traitement de sons et d'images avec divers filtres et d'une discussion des résultats.
Les instructions suivantes permettront de reproduire les résultats obtenus et présentés dans le rapport.

### Built With
* [Matlab](www.mathworks.com)
* [Python 3](www.python.org)
* [OpenCV](www.opencv.org)

<!-- GETTING STARTED -->
## Débuter 

Pour l'exécution des étapes suivantes, nous vous recommandons l'utilisation d'un terminal:
* Sous windows: [Git bash](www.gitforwindows.org)
* UNIX based systems: Votre terminal favoris

### Prérequis 

Le fonctionnement du projet requiert certains préalables. Assurez-vous d'avoir installé les versions requises des éléments suivants:
* Python 3
* Matlab 2018 ou +
* Jupyer lab
```sh
pip install jupyter lab
```

### Installation

1. Cloner la repo 
```sh
git clone https://github.com/squidlydeadly/Projet-de-conception-TNS.git
```
2. Activer l'environnement virtuel
```sh
source bin/activate
```
3. Installer les package nécessaires
```sh
pip install -r requirements.txt
```
4. Naviguer vers le dossier racine du projet
```sh
cd path/to/project/Projet-de-conception-TNS/
```
5. Lancer Jupyer lab 
```sh
jupyter lab
```
6. Vous pouvez exécuter chaque cellule vous positionnant dessus et en utilisant Shift+Enter ou exécuter toutes les cellules avec l'onglet Run->Run All Cells


### Traitement audio sur Matlab

Le projet a été fait en créant des matlab live scripts avec Matlab 2018a. 

Pour lancer le projet:
* Dans chaque dossier pour les sons, il y a un fichier '.mlx '.
* Ouvrir le fichier .mlx avec Matlab, ce qui va ouvrir un live script. Les signaux filtrés sont tous enregistré dans un sous dossier nommé Block.
* Il suffit d'exécuter chaque script pour produire les résultats présentés dans le rapport

