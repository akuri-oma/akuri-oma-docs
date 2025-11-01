---

trigger: model_decision

description: Guide pour l'utilisation compatible du terminal dans les opérations de création de fichiers et de répertoires dans les environnements Akuri, axée sur des commandes universelles pour Windows, Linux et macOS, évitant la syntaxe spécifique aux shells pour une portabilité maximale.

status: active

linked_files: [] # Aucun document Akuri lié directement identifié dans ce cas.

use_case: BUILD, DESIGN, PLAN # Pertinent lors de la construction de structures, de la conception de dossiers ou de la planification d'opérations.

---

# Guide pour les Opérations de Terminal Multiplateforme (akuri-terminal.cross-platform-terminal-operations.guideline.md)

## 1. Introduction et Objectif

Ce document fournit des directives essentielles pour l'interaction avec le terminal dans la création de structures de fichiers et de répertoires au sein de tout projet de la Méthodologie Akuri. Son objectif fondamental est d'assurer la **compatibilité multiplateforme** et la **sécurité opérationnelle**, garantissant que les commandes fonctionnent de manière cohérente dans des environnements tels que VSCode, Windows (PowerShell/WSL), Linux et macOS.

**VOUS** devez prioriser la simplicité et l'universalité des commandes, évitant la syntaxe spécifique aux shells qui pourrait générer des incohérences ou des échecs dans différents systèmes d'exploitation.

## 2. Structure et Principes Généraux

### 2.1 Principes Fondamentaux pour les Opérations de Terminal

*   **Compatibilité Multiplateforme :**
    *   **Éviter la syntaxe spécifique à Bash :** Ne pas utiliser les expansions d'accolades (`{dir1,dir2}`) ou les fonctionnalités avancées de `globbing` (`**/*.ts`) qui ne sont pas universelles.
    *   **Commandes Individuelles et Explicites :** Créer des répertoires et des fichiers un par un ou dans des séquences claires et atomiques.
    *   **Chemins Standards :** Utiliser des barres obliques (`/`) pour les chemins, car ils sont compatibles avec Windows (PowerShell), Linux et macOS.

*   **Opérations Sécurisées :**
    *   **Vérifier avant d'Exécuter :** Toujours confirmer le répertoire actuel (`pwd`) et l'impact possible d'une commande avant de l'exécuter.
    *   **Chemins Relatifs Clairs :** Préférer le préfixe `./` pour les chemins relatifs pour éviter les ambiguïtés.
    *   **Éviter les Opérations Destructrices Non Contrôlées :** Extrême prudence avec des commandes comme `rm`, `del` ou toute opération d'écrasement.

### 2.2 Structure de ce Guideline

1.  Introduction et Objectif
2.  Structure et Principes Généraux
3.  Guide pour la Création de Répertoires
4.  Guide pour les Opérations de Fichiers
5.  Guide pour la Navigation
6.  Meilleures Pratiques dans l'Exécution des Commandes
7.  Considérations Spécifiques de l'Environnement
8.  Modèles Courants à Éviter
9.  Flux de Travail Recommandé
10. Exemples en Contexte
11. Migration des Modèles Anciens
12. Conclusion

## 3. Guide pour la Création de Répertoires

### 3.1 ❌ Approches Incorrectes (À Éviter)

```bash
# NE PAS UTILISER : Expansion d'accolades Bash (non compatible dans tous les environnements, ex. CMD sous Windows)
mkdir -p backend-nest/src/subsytem/product/product-presentation/{controllers,services,models/{dto,response,enums},data}

# NE PAS UTILISER : Imbrication complexe de commandes qui peut masquer les échecs
mkdir -p dir1 && mkdir -p dir1/subdir1 && mkdir -p dir1/subdir2



3.2 ✅ Approches Correctes (Recommandé)
Méthode 1 : Commandes Séquentielles et Explicites

Cette méthode est la plus compatible et facile à déboguer.
code Bash

    
# 1. Créer le répertoire de base principal
mkdir -p backend-nest/src/subsytem/product/product-presentation

# 2. Ensuite, créer les sous-répertoires un par un
mkdir -p backend-nest/src/subsytem/product/product-presentation/controllers
mkdir -p backend-nest/src/subsytem/product/product-presentation/services
mkdir -p backend-nest/src/subsytem/product/product-presentation/models
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/dto
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/response
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/enums
mkdir -p backend-nest/src/subsytem/product/product-presentation/data

  


Méthode 2 : Utilisation de Scripts (Recommandé pour les Structures Complexes et Répétitives)

Pour les structures complexes ou qui se répètent fréquemment (ex., lors de la création de nouveaux modules ou composants), encapsuler la logique dans un script Shell (.sh ou .ps1 pour PowerShell) améliore la maintenabilité et la compatibilité.
code Bash

    
# Exemple de Script pour Bash/Zsh (assurer la compatibilité avec `sh` pour Windows/WSL)
# Sauvegarder comme create_dirs.sh
cat > create_dirs.sh << 'EOF'
#!/bin/sh
# Script de création de structure de répertoires pour le module product-presentation

BASE_DIR="backend-nest/src/subsytem/product/product-presentation"

# Créer le répertoire de base principal
mkdir -p "$BASE_DIR"

# Créer des sous-répertoires individuellement
mkdir -p "$BASE_DIR/controllers"
mkdir -p "$BASE_DIR/services"
mkdir -p "$BASE_DIR/models" # Assurer que 'models' existe avant ses sous-répertoires
mkdir -p "$BASE_DIR/models/dto"
mkdir -p "$BASE_DIR/models/response"
mkdir -p "$BASE_DIR/models/enums"
mkdir -p "$BASE_DIR/data"

echo "Structure de répertoires créée avec succès dans : $BASE_DIR"
EOF

# Rendre le script exécutable et l'exécuter
chmod +x create_dirs.sh
./create_dirs.sh

  


Méthode 3 : Interface Graphique (Explorateur de Fichiers VSCode/Cursor)

Pour les tâches de création ponctuelles ou les structures moins répétitives, utiliser l'interface graphique de l'explorateur de fichiers de l'IDE (VSCode ou Cursor) est une option sûre et compatible.

    Naviguer vers le répertoire souhaité dans l'explorateur de fichiers.

    Clic droit → "Nouveau Dossier" pour chaque répertoire nécessaire.

    Cela garantit la compatibilité et fournit une confirmation visuelle.

4. Guide pour les Opérations de Fichiers
4.1 Création de Fichiers
code Bash

    
# ✅ Correct : Créer des fichiers individuellement
touch backend-nest/src/subsytem/product/product-presentation/product-presentation.module.ts

# ❌ Incorrect : Création de plusieurs fichiers à la fois (peut ne pas fonctionner dans tous les shells ou versions)
touch file1.ts file2.ts file3.ts

  


4.2 Permissions de Fichiers

Toujours définir les permissions explicitement lorsque nécessaire, particulièrement pour les scripts.
code Bash

    
# ✅ Correct : Définir les permissions de manière explicite et compréhensible
chmod 644 script.sh  # Lecture/écriture pour le propriétaire, lecture seule pour les autres
chmod 755 script.sh  # Permission d'exécution pour tous les utilisateurs

# ❌ Incorrect : Assumer les permissions par défaut qui peuvent ne pas être souhaitées ou sûres

  


5. Guide pour la Navigation
5.1 Changements de Répertoire
code Bash

    
# ✅ Correct : Utiliser des chemins absolus autant que possible pour éviter les ambiguïtés
cd /full/path/to/project/backend-nest

# ✅ Correct : Utiliser des chemins relatifs avec vérification
cd ./backend-nest
pwd # Vérifier l'emplacement actuel après un changement

# ❌ Incorrect : Assumer l'emplacement actuel sans vérification, peut entraîner des erreurs
cd backend-nest # Pourrait échouer si on n'est pas dans le répertoire attendu

  


5.2 Vérification des Chemins et Existence

Vérifiez toujours l'emplacement et l'existence des éléments avant d'effectuer des opérations critiques.
code Bash

    
# Toujours vérifier l'emplacement actuel avant toute opération
pwd
ls -la # Lister le contenu du répertoire actuel

# Vérifier si un répertoire existe avant d'essayer de le créer ou d'interagir avec lui
if [ ! -d "backend-nest/src" ]; then
    echo "Erreur : Le répertoire 'backend-nest/src' n'existe pas."
    exit 1
fi

  


6. Meilleures Pratiques dans l'Exécution des Commandes
6.1 Gestion des Erreurs

Assurer que les commandes gèrent les échecs possibles pour éviter des exécutions inattendues.
code Bash

    
# ✅ Correct : Vérifier le succès de la commande et réagir aux échecs
mkdir -p some/dir || echo "Erreur : Échec de la création du répertoire 'some/dir'."

# ✅ Correct : Utiliser '&&' pour enchaîner des commandes qui dépendent du succès de la précédente
mkdir -p some/dir && cd some/dir && echo "Répertoire créé et navigué avec succès."

  


6.2 Enchaînement des Commandes

Maintenir les chaînes de commandes simples et claires.
code Bash

    
# ✅ Correct : Enchaînement simple avec un objectif clair
cd backend-nest && npm install

# ❌ Incorrect : Chaînes complexes qui peuvent masquer les erreurs dans les étapes intermédiaires
cd backend-nest && npm install && npm run build && npm test
# (Il est préférable de diviser cela en étapes séparées avec vérifications)

  


6.3 Commandes Longues

Améliorer la lisibilité des commandes longues.
code Bash

    
# ✅ Correct : Diviser les commandes longues en utilisant la barre oblique inverse pour une meilleure lisibilité
npm run command \
    --param1 value1 \
    --param2 value2 \
    --another-option

# ✅ Correct : Utiliser des variables pour des commandes complexes et réutilisables
COMMAND="npm run build --prod --output-path=dist"
eval "$COMMAND" # 'eval' exécute le contenu de la variable comme une commande

  


7. Considérations Spécifiques de l'Environnement
7.1 Compatibilité avec Windows

    Barres Obliques dans les Chemins : Utiliser toujours des barres obliques (/) dans les chemins (ex., /c/projects/backend-nest). Cela fonctionne à la fois dans les shells de type Unix (Git Bash, WSL) et PowerShell.

    Éviter les Commandes Spécifiques à Unix :

        ❌ Incorrect : grep, sed, awk (peuvent ne pas être disponibles dans les installations par défaut de Windows).

        ✅ Correct : Utiliser des alternatives basées sur Node.js (scripts), Python ou des outils PowerShell pour la manipulation de texte.

7.2 Intégration avec le Terminal VSCode/Cursor

    Sortie Claire : Les commandes sont exécutées dans le terminal intégré. S'assurer que les messages de sortie sont clairs et descriptifs, car la sortie peut être capturée ou filtrée par l'IDE.

    Éviter les Commandes Interactives : Préférer les versions non interactives des commandes qui nécessitent une entrée utilisateur, car l'interaction peut être inconfortable ou non compatible avec l'automatisation.

8. Modèles Courants à Éviter
8.1 Fonctionnalités Spécifiques à Bash

    ❌ Expansion d'accolades : echo {1..5}

    ❌ Substitution de commandes avec des backticks : `command` (préférer $(command) si strictement nécessaire et vérifier la compatibilité).

    ❌ Globbing avancé : ls **/*.ts (non universel).

8.2 Commandes Uniquement pour Unix

    ❌ Peuvent ne pas fonctionner sous Windows : grep "pattern" file.txt, sed 's/old/new/' file.txt, awk '{print $1}' file.txt.

    ✅ Alternatives multiplateformes : Utiliser des scripts Node.js/Python pour la manipulation de fichiers, ou l'environnement WSL sous Windows.

8.3 Commandes Interactives

    ❌ Commandes qui attendent une entrée utilisateur : git commit (sans flag -m), npm init (mode interactif).

    ✅ Alternatives non interactives : git commit -m "message", npm init --yes.

9. Flux de Travail Recommandé
9.1 Pour la Création de Structures de Répertoires

    Planifier la Structure : Tracer la structure de répertoires souhaitée (dans un fichier texte, des commentaires ou mentalement).

    Créer des Répertoires Parents : Utiliser mkdir -p pour créer les répertoires parents principaux.

    Créer des Sous-Répertoires Séquentiellement : Créer les sous-répertoires niveau par niveau ou individuellement.

    Vérifier la Création : Utiliser ls -la ou l'explorateur de fichiers de l'IDE pour confirmer la structure.

    Créer des Fichiers : Créer des fichiers individuellement selon les besoins.

9.2 Pour les Opérations Complexes et Répétitives

    Écrire un Script : Développer un script (.sh ou .ps1) pour encapsuler la logique des opérations complexes ou répétitives.

    Tester le Script : Exécuter le script dans un environnement sûr et vérifier son comportement sur toutes les plateformes cibles (si possible).

    Documenter le Script : Ajouter des commentaires clairs au script expliquant son objectif, ses paramètres et toute considération spéciale.

    Contrôle de Versions : Maintenir les scripts sous contrôle de versions (git) avec le code du projet.

10. Exemples en Contexte
10.1 Création de Structure de Modules (Approche Recommandée)

Cet exemple montre la création d'un module product-offer en utilisant la méthode séquentielle.
code Bash

    
# 1. Naviguer vers la racine du projet
cd /path/to/project

# 2. Créer le répertoire de base du nouveau module
mkdir -p backend-nest/src/subsytem/product/product-offer

# 3. Créer les sous-répertoires séquentiellement
mkdir -p backend-nest/src/subsytem/product/product-offer/controllers
mkdir -p backend-nest/src/subsytem/product/product-offer/services
mkdir -p backend-nest/src/subsytem/product/product-offer/models
mkdir -p backend-nest/src/subsytem/product/product-offer/models/dto
mkdir -p backend-nest/src/subsytem/product/product-offer/models/response
mkdir -p backend-nest/src/subsytem/product/product-offer/models/enums
mkdir -p backend-nest/src/subsytem/product/product-offer/data

# 4. Vérifier la structure créée
ls -la backend-nest/src/subsytem/product/product-offer/

  


10.2 Opérations Sécurisées de Fichiers
code Bash

    
# 1. Créer des fichiers individuellement
touch backend-nest/src/subsytem/product/product-offer/product-offer.module.ts
touch backend-nest/src/subsytem/product/product-offer/controllers/product-offer.controller.ts
touch backend-nest/src/subsytem/product/product-offer/services/product-offer.service.ts

# 2. Vérifier les résultats
ls -la backend-nest/src/subsytem/product/product-offer/controllers/
ls -la backend-nest/src/subsytem/product/product-offer/services/

  


11. Migration des Modèles Anciens

Si VOUS, ou un utilisateur, trouvez des scripts ou de la documentation qui utilisent des modèles non compatibles (ex., syntaxe spécifique à Bash) :

    Identifier les Commandes Problématiques : Reconnaître les parties du script qui utilisent une syntaxe non multiplateforme.

    Remplacer par des Opérations Individuelles : Substituer les commandes problématiques par les alternatives séquentielles ou basées sur des scripts qui respectent ces directives.

    Tester sur les Plateformes Cibles : Exécuter le script ou les commandes mises à jour sur les différentes plateformes (Windows, Linux, macOS) pour confirmer leur bon fonctionnement.

    Mettre à Jour la Documentation : S'assurer que toute documentation ou guideline qui fait référence à ces modèles soit également mise à jour.

12. Conclusion

Suivre ces directives assure que les opérations du terminal sont cohérentes et fiables dans tous les environnements de développement Akuri. En cas de doute, VOUS devez préférer des commandes simples et individuelles à une syntaxe complexe ou spécifique aux shells. VOUS devez toujours tester les commandes dans l'environnement cible avant de dépendre d'elles dans des scripts ou de la documentation.

Rappel : L'objectif est d'atteindre des opérations fiables et maintenables qui fonctionnent pour toute l'équipe de développement, pas des raccourcis ingénieux qui ne sont fonctionnels que sur des systèmes spécifiques.