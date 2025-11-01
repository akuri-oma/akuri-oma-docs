---

trigger: always_on
description: Définit les exigences minimales de l'environnement d'exécution (machine locale ou CI/CD) pour que l'Agent Akuri puisse fonctionner correctement.
status: active
---

# Exigences de l'Environnement d'Exécution de l'Agent Akuri

## 1. Objectif

Ce document définit les exigences techniques minimales que doit remplir tout environnement (machine de développeur, serveur d'intégration continue, etc.) pour garantir le bon fonctionnement de l'Agent Akuri.

L'Agent Akuri dépend de certains outils de ligne de commande standard pour interagir avec le système de fichiers et exécuter des tâches. L'absence de ces outils causera des échecs dans l'exécution.

## 2. Exigences Minimales de l'Environnement d'Exécution

### 2.1 Shell

-   **Exigence :** Un shell compatible avec POSIX.
-   **Vérification :** `sh` doit être disponible dans le `PATH` du système.

### 2.2 Système de Contrôle de Versions

-   **Exigence :** Git.
-   **Vérification :** La commande `git` doit être disponible. Exécuter `git --version` doit retourner une version valide.

### 2.3 Interpréteur Python

-   **Exigence :** Python 3.x.
-   **Problème Courant :** L'agent invoque l'interpréteur en utilisant la commande `python`. Dans de nombreux systèmes, l'exécutable de Python 3 est installé comme `python3`.
-   **Solution Obligatoire :** Un exécutable ou un lien symbolique appelé `python` doit exister dans le `PATH` du système pointant vers une installation de Python 3.

## 3. Procédure de Vérification et Configuration

Avant de commencer une session de travail avec l'Agent Akuri, l'utilisateur doit vérifier que son environnement répond aux exigences.

**Commande de Vérification de Python :**
```bash
python --version



    Résultat Attendu : Affiche une version de Python 3.x (ex. Python 3.9.6).

    En cas d'échec avec python: not found : Exécutez les commandes suivantes pour créer un lien symbolique :
    code Bash

        
    # 1. Trouve le chemin de python3
    which python3

    # 2. Crée le lien (remplace le chemin si différent)
    #    Peut nécessiter 'sudo'
    ln -s /usr/bin/python3 /usr/local/bin/python

      