---
trigger: model_decision
description: Guideline orchestrateur qui définit le flux de travail de DEBUG. Détaille le processus systématique pour diagnostiquer et résoudre les erreurs, différenciant entre erreurs de compilation/syntaxe et erreurs de logique/comportement.
status: active
use_case: DEBUG_BASIC, DEBUG_ADVANCED
---

# Flux de Travail de Débogage (debug.workflow.md)

## 1. Introduction et Principe Fondamental

Ce document définit le flux de travail systématique que VOUS, en tant qu'Agent Akuri, devez suivre pour diagnostiquer et résoudre les erreurs (`DEBUG`).

Le principe fondamental est : **"Une architecture conforme est la première étape pour un code sans erreurs."** Avant de chercher une erreur de logique, VOUS devez assurer que le code adhère à l'architecture établie, car beaucoup de défaillances de comportement trouvent leur origine dans des déviations structurelles.

## 2. Le Flux de Travail de Débogage

### Phase 1 : Triage et Classification de l'Erreur (`CLARIFY`)

Votre première action est de comprendre la nature de l'erreur.

1.  **Recueillir les Informations de l'Utilisateur :**
    *   **Questions Clés :**
        *   "Veuillez fournir le **message d'erreur exact** et, si possible, le `stack trace` complet qui apparaît dans la console."
        *   "Dans quel(s) fichier(s) et ligne(s) l'erreur est-elle rapportée ?"
        *   "Décrivez les **étapes pour reproduire** l'erreur. Que tentiez-vous de faire quand elle s'est produite ?"
        *   "Quel était le **comportement attendu** et quel a été le **comportement réel** ?"

2.  **Classifier l'Erreur :** Basé sur la réponse, VOUS classerez le problème dans l'une des deux catégories :
    *   **Erreur de Compilation/Syntaxe :** Le code ne compile pas ou échoue au démarrage. La console affiche des erreurs claires sur la syntaxe, les types, les importations manquantes, etc.
    *   **Erreur de Logique/Comportement :** Le code compile et s'exécute, mais ne fait pas ce qui est attendu.

### Phase 2 : Diagnostic des Erreurs de Compilation/Syntaxe

Ces erreurs sont généralement une "liste de tâches" fournie par le compilateur.

1.  **Analyse de la Console :** VOUS analyserez la liste d'erreurs de la console.
2.  **Solution Itérative (Modèle Cascade) :**
    *   **Action :** VOUS aborderez les erreurs **une par une, depuis la première de la liste vers le bas**.
    *   **Raisonnement :** Expliquez à l'utilisateur : "Souvent, corriger une erreur initiale (comme une importation incorrecte) résout beaucoup des erreurs subséquentes en cascade."
    *   **Cycle de Correction :**
        a.  Identifiez la première erreur.
        b.  Proposez la correction.
        c.  Simulez (ou demandez) une nouvelle compilation.
        d.  Ré-analysez la nouvelle liste d'erreurs.
        e.  Répétez jusqu'à ce qu'il n'y ait plus d'erreurs.

### Phase 3 : Diagnostic des Erreurs de Logique/Comportement

Ces erreurs sont plus complexes et nécessitent une approche plus profonde, suivant le principe de "architecture d'abord".

1.  **Étape 3.1 : Mini-Auditoría de Conformité Architectonique (Optionnel mais Recommandé) :**
    *   **Objectif :** Écarter que l'erreur soit due à une déviation architectonique.
    *   **Action :** Effectuez une version rapide du `audit.workflow.md` sur la fonctionnalité affectée, en vous concentrant sur :
        *   **Nomenclature et Emplacement de Fichiers :** Les fichiers sont-ils où ils devraient être ?
        *   **Structure de Services (Frontend) :** La séparation `API`/`Action`/`State` est-elle respectée ?
        *   **Patron de Contrôleur Mince (Backend) :** La logique est-elle dans le service ?
    *   **Communication :** "Avant de déboguer la logique, je réaliserai une rapide auditoría pour assurer que la structure du code est correcte, car cela révèle souvent la cause racine des problèmes de comportement."

2.  **Étape 3.2 : Analyse de Flux de Données ("Suivre la Piste") :**
    *   **Objectif :** Tracer le flux de données depuis l'entrée de l'utilisateur jusqu'au point où le comportement diverge de ce qui est attendu.
    *   **Action (Frontend) :**
        a.  Commencez dans le **composant de `Presentation`** : L'événement utilisateur (`click`, `submit`) appelle-t-il correctement la méthode du `Action Service` ?
        b.  Allez au **`Action Service`** : L'état `isLoading` se met-il à jour ? L'`API Service` est-il appelé avec les paramètres corrects ?
        c.  Allez au **`API Service`** : La requête HTTP se construit-elle correctement ?
        d.  Analysez la **réponse du `API Service`** : L'`Action Service` gère-t-il correctement le `next` (succès) et l'`error` ?
        e.  Allez au **`State Service`** : L'état se met-il à jour avec les données correctes ?
        f.  Retournez au **composant de `Presentation`** : S'abonne-t-il correctement au `State` et rend-il les données attendues ?
    *   **Action (Backend) :** Suivez un flux similaire depuis le `Controller` -> `Service` -> `Repository/Base de Données` et retour.

3.  **Étape 3.3 : Formulation d'Hypothèse et Proposition de Solution :**
    *   **Action :** Basé sur l'analyse de flux, VOUS formulerez une hypothèse sur la cause de l'erreur. (ex., "Mon hypothèse est que l'`Action Service` ne gère pas le cas d'erreur de l'API, donc l'état `isLoading` ne se remet jamais à `false`").
    *   **Proposition :** Proposez la modification de code spécifique pour résoudre le problème.

### Phase 4 : Implémentation de la Correction et Vérification

1.  **Appliquer le Changement :** Une fois que l'utilisateur approuve la solution, VOUS appliquerez la correction.
2.  **Vérification :** VOUS devez proposer ou décrire les étapes pour vérifier que la correction a non seulement résolu le problème original, mais n'a pas introduit de nouveaux erreurs (tests de régression).