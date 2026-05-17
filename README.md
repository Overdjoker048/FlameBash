# FlameBash
![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Version](https://img.shields.io/badge/Version-1.1.0-yellow.svg)

Une configuration `.bashrc` légère et fonctionnelle pour développeurs Linux, conçue pour améliorer votre terminal avec un prompt riche, un tableau de bord système et des commandes utilitaires.

## Description

FlameBash transforme votre Bash en un environnement de développement pratique et visuel. Il offre :

- Un prompt coloré affichant utilisateur/hôte, répertoire, branche Git et état du dépôt
- Un tableau de bord système au démarrage avec OS, noyau, CPU, RAM, disque, IP et plus
- Des alias utiles pour Python, Git et les opérations communes
- Des commandes de maintenance pour mise à jour, nettoyage et rechargement du shell

## Fonctionnalités clés

- **Prompt enrichi** : informations système et Git dans un prompt clair et coloré
- **Dashboard de démarrage** : aperçu instantané de l’état du système
- **Git simplifié** : commandes `gc`, `gp`, et statut Git directement dans le prompt
- **Alias pratiques** : `py`, `pyc`, `ll`, `la`, `l`, etc.
- **Maintenance rapide** : `update`, `clean`, `actu`, `clear`
- **Compatibilité Bash** : conçu pour s’exécuter en shell interactif et tirer parti de `bash-completion`

## Exemple d’utilisation rapide
```bash
# Copier le fichier .bashrc dans votre répertoire personnel
$ cp FlameBash/.bashrc ~/.bashrc

# Charger la configuration
$ source ~/.bashrc

# Utiliser les alias et commandes incluses
$ py script.py
$ gc "mise à jour du prompt"
$ update
$ actu
```

## Installation

1. Copier ou lier le fichier `.bashrc` dans votre dossier personnel.
2. Charger la configuration :
```bash
$ source ~/.bashrc
```

## Licence
Ce projet est distribué sous licence MIT. Voir le fichier `LICENSE` pour les détails.
