# FlameBash

Version : `1.1.0`

Une configuration `.bashrc` légère et fonctionnelle pour développeurs sous Linux. Ce projet offre un prompt enrichi, un tableau de bord système à l’ouverture, des alias utiles, de l’intégration Git et des commandes de maintenance.

## UI
- Affichage de démarrage détaillé avec informations système : OS, noyau, architecture, uptime, CPU, GPU, RAM, disque, IP, shell, session, résolution, virtualisation, init, et modèle de PC.
- Prompt coloré avec : utilisateur/hôte, répertoire courant, branche Git et état du dépôt, ainsi que l’environnement virtuel Python.

Exemple :
```bash
# dans un terminal normal
$ cd ~/projet
$ echo "hello"
```
Le prompt affichera un bloc supérieur avec le système, puis un prompt `╭─ user@host | ~/projet`.

## Git
- `gc <msg>` : ajoute tous les fichiers du dépôt racine et crée un commit.
- `gp <msg>` : pousse vers le remote ; si un message est fourni, crée d’abord une étiquette signée.
- Le prompt affiche la branche Git courante et marque un statut non propre si des modifications existent.

Exemples :
```bash
$ gc "mise à jour de la doc"
$ gp "v1.1.0"
```

## Dev
- `exe` : compilation et exécution d’un fichier C avec `gcc -Wall -Wextra -Werror -fsanitize=address -g`, puis suppression du binaire temporaire.
- `env` : création/activation d’un environnement Python local `.env` et mise à jour de `.gitignore`.
- Alias shell utiles :
  - `py` → `python3`
  - `pyc` → compile un script Python en `.pyc`
  - `ll`, `la`, `l` → listings `ls` plus pratiques

Exemples :
```bash
$ exe programme.c
$ env
$ py script.py
$ pyc script.py
```

## Maintenance
- `update` : met à jour le système Debian/Ubuntu, nettoie les paquets, met à jour les drivers et rafraîchit les snaps/flatpaks.
- `clean` : supprime les paquets orphelins et nettoie le cache APT.
- `actu` : recharge le `.bashrc` et rafraîchit l’affichage.
- `clear` : efface le terminal puis réaffiche le dashboard système.

Exemples :
```bash
$ update
$ clean
$ actu
$ clear
```

## Installation
1. Copier le fichier `.bashrc` dans votre répertoire personnel.
2. Charger la configuration :
```bash
$ source ~/.bashrc
```

## Notes
- Le code s’exécute uniquement en mode shell interactif.
- La complétion Bash est activée si `bash-completion` est installé.
