---
trigger: model_decision
description: Le guideline maître qui définit le Flux de Travail d'Andamiaje Progressif. Détaille les phases incrémentales depuis la conceptualisation jusqu'à l'implémentation et l'archivage final des spécifications au sein de la propre fonctionnalité. Est universel et applicable à toute technologie.
status: active
linked_files: [/* Seront liés dynamiquement selon le projet */]
use_case: PLAN, BUILD, DESIGN, INVENTORY
---

# Akuri-OMA : Flux de Travail d'Andamiaje Progressif (akuri.progressive-scaffolding-workflow.guideline.md)

## 1. Introduction et Philosophie

Ce document définit le **flux de travail principal et universel** pour la création de toute fonctionnalité dans la Méthodologie Akuri-OMA. Il est basé sur un modèle **incrémental et progressif**, où les artefacts de conception (`PLAN`, `INVENTORY`) sont créés, approuvés et, finalement, archivés au sein de la propre fonctionnalité pour une traçabilité complète.

## 2. Modes Opérationnels de l'Agent

-   **`MODE CREATIF` (Brainstorming & Analysis) :** Utilisé dans les Phases 1 et 2. Priorise l'exploration et la définition des exigences.
-   **`MODE DICTATORIAL` (Architecture & Execution) :** Utilisé dans les Phases 3 et suivantes. Priorise la discipline, l'adhérence aux règles et l'exécution des décisions.

## 3. Le Flux de Travail Progressif (10 Phases)

### Phase 1 : Conceptualisation (`MODE CREATIF`)
-   **Objectif :** Explorer l'idée initiale. (Optionnel).
-   **Artefact Produit :** `[CONCEPT]...md` dans `akuri-work/`.

### Phase 2 : Inventaire des Caractéristiques (`MODE CREATIF`)
-   **Objectif :** Traduire les concepts en une liste d'exigences fonctionnelles.
-   **Artefact Produit :** `[INVENTORY]...md` dans `akuri-work/`.
-   **Point d'Approbation :** L'utilisateur doit approuver cet inventaire.

### Phase 3 : Blueprint Architectonique (`MODE DICTATORIAL`)
-   **Objectif :** Définir la structure rigide de dossiers et fichiers.
-   **Votre Tâche :** Initier le document vivant `[PLAN]...md` dans `akuri-work/`, définissant la nomenclature et l'`tree` de fichiers.
-   **Point d'Approbation :** L'utilisateur doit approuver la structure architectonique.

### Phase 4 : Squelette d'Implémentation (`MODE DICTATORIAL`)
-   **Objectif :** Définir le contenu ("quoi") de chaque fichier.
-   **Votre Tâche :** Étendre le `PLAN` avec le squelette de chaque classe, propriétés et signatures de méthodes.
-   **Point d'Approbation :** L'utilisateur doit approuver le squelette.

### Phase 5 : Blueprint Technique et de Dépendances (`MODE DICTATORIAL`)
-   **Objectif :** Prévenir les erreurs de technologie, importation et version.
-   **Votre Tâche :** Étendre le `PLAN` avec une section "Blueprint Technique".
-   **Point d'Approbation :** L'utilisateur DOIT approuver ce blueprint technique.

### Phase 6 : Contrat d'API et Synchronisation (Seulement pour Frontend) (`MODE DICTATORIAL`)
-   **Objectif :** Garantir que le frontend sera construit sur une base d'API **existante et vérifiée**.
-   **Votre Tâche :** Étendre le `PLAN` avec une section "Contrat d'API", validant les endpoints contre la documentation du backend.
-   **Point d'Approbation :** **Vous ne pouvez pas procéder** jusqu'à ce qu'une "Synchronisation Réussie" soit atteinte.

### Phase 7 : Implémentation par Blocs Validés (`MODE DICTATORIAL`)
-   **Principe :** "Construction par Couches Stables".
-   **Votre Tâche (Début du `BUILD`) :** Créer le document `[EXECUTION]...md` dans `akuri-work/` avec une checklist de tâches et points de validation de compilation.
-   **Votre Tâche (Cycle de `BUILD`) :** Exécuter les tâches du `[EXECUTION]...md` une par une, validant la compilation après chaque bloc logique.
-   **Finalisation :** À la fin de l'implémentation, ajouter un "Plan de Tests" au `[PLAN]` original.

### Phase 8 : Exécution de Tests et Correction (`MODE DICTATORIAL`)
-   **Objectif :** Valider que l'implémentation satisfait le `INVENTORY`.
-   **Votre Tâche :** Exécuter le "Plan de Tests" et corriger les erreurs.

### Phase 9 : Création du Document de Handover (Seulement pour Backend)
-   **Objectif :** Créer un résumé pour faciliter le développement du frontend.
-   **Déclencheur :** S'exécute à la fin de la construction d'une fonctionnalité de Backend.
-   **Artefact Produit :** Un document `[HANDOVER]...md` dans `akuri-work/`.

### Phase 10 : Archivage des Spécifications (`MODE DICTATORIAL`)
-   **Objectif :** Créer un enregistrement historique et de référence permanent au sein de la propre fonctionnalité.
-   **Déclencheur :** Est la **dernière phase** du flux de `BUILD`, après que les tests aient passé et la fonctionnalité soit considérée "complète".
-   **Votre Tâche :**
    1.  Créez un dossier `akuri-specs/` à la racine de la fonctionnalité nouvellement construite (ex., `backend-nest/src/subsystem/provider/akuri-specs/`).
    2.  **Déplacez** les artefacts suivants depuis le dossier `akuri-work/` vers le nouveau dossier `akuri-specs/` :
        *   Le `[INVENTORY]...md` final.
        *   Le `[PLAN]...md` final et complet.
        *   Le `[HANDOVER]...md` (s'il a été généré).
    3.  Confirmez que les fichiers ont été déplacés et que le dossier `akuri-work/` a été nettoyé de ces artefacts liés à la tâche complétée.