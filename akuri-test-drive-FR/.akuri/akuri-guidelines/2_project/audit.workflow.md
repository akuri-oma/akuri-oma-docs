---
trigger: model_decision
description: Guideline orchestrateur qui définit le flux de travail d'AUDIT sous le Modèle de Cascade Hiérarchique. Invoque une séquence de micro-guidelines pour auditer la conformité formelle puis fonctionnelle d'une fonctionnalité.
status: active
use_case: AUDIT, UI_AUDIT
---

# Flux de Travail d'Auditoría (audit.workflow.md)

## 1. Principe de Cascade Simple

Ce flux de travail suit un modèle de cascade strict. VOUS, en tant qu'Agent Akuri, DEVEZ exécuter chaque étape en séquence. Si une étape révèle des déviations critiques, le processus d'auditoría s'arrête, le rapport est généré, et on ne procède pas aux étapes suivantes jusqu'à ce que les corrections soient réalisées. **La conformité formelle précède la conformité fonctionnelle.**

## 2. Le Flux de Travail d'Auditoría

### Phase 1 : Localisation du Feature (Entrée de l'Utilisateur)

-   **Objectif :** Identifier sans ambiguïté la portée de l'auditoría.
-   **Votre Tâche :**
    1.  Demandez à l'utilisateur le **chemin exact** du dossier de la fonctionnalité à auditer. Ne cherchez pas par vous-même.
    2.  Si l'utilisateur fournit une liste de features, créez un plan pour itérer sur chacun, générant un rapport d'auditoría individuel par feature.

### Phase 2 : Auditoría de Conformité Formelle (Architecture)

#### Étape 2.1 : Validation de Macro-Architecture
-   **Objectif :** Vérifier si la fonctionnalité est à l'emplacement correct dans le projet.
-   **Action :** Invoquez le micro-guideline `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Critère de Succès :** Le dossier du feature doit être dans une "zone" autorisée (ex., `subsystem/`, `modules/`).

#### Étape 2.2 : Validation du Patron Architectonique
-   **Objectif :** Vérifier si la structure interne de la fonctionnalité suit un patron approuvé.
-   **Action :** Invoquez le micro-guideline `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Critère de Succès :** La structure de dossiers (`models/`, `services/`, etc.) doit correspondre à l'un des patrons définis (`STANDARD`, `COMPLEX`, etc.).

#### Étape 2.3 : Validation de Nomenclature de Fichiers
-   **Objectif :** Vérifier si tous les fichiers ont le préfixe et la convention de noms correcte.
-   **Action :** Invoquez le micro-guideline `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Critère de Succès :** Tous les fichiers doivent respecter les règles de préfixes et suffixes.

#### Étape 2.4 : Validation de Structure Interne de Fichiers
-   **Objectif :** Vérifier si le nom du fichier correspond à son contenu principal (ex., si la classe principale dans `feature.service.ts` s'appelle `FeatureService`).
-   **Action :** Invoquez le micro-guideline `3_technology/[tech]/[tech].file-internal-class-naming.guideline.md`.
-   **Critère de Succès :** Il doit exister une consistance 1:1 entre le nom du fichier et sa classe/interface principale.

**Point de Contrôle :** Si des déviations critiques sont trouvées dans la Phase 2, le rapport est généré et le processus d'auditoría pour ce feature se termine ici.

### Phase 3 : Auditoría de Conformité Fonctionnelle (Implémentation)

#### Étape 3.1 : Validation d'Adhérence Technologique
-   **Objectif :** Vérifier que seules les bibliothèques et technologies autorisées sont utilisées.
-   **Action :** Invoquez le `project.manifest.md` et comparez les importations du code contre le "Catalogue de Technologies Autorizées".
-   **Critère de Succès :** Il ne doit pas y avoir d'importations de bibliothèques non autorisées (ex., `ngx-toastr` dans un projet PrimeNG).

#### Étape 3.2 : Validation de Patrons d'Implémentation
-   **Objectif :** Vérifier si l'implémentation suit les patrons de la méthodologie.
-   **Action :** Invoquez les micro-guidelines d'implémentation pertinents, tels que :
    -   `[tech].service-controller-method-conventions.guideline.md` (Pour la logique de backend).
    -   `[tech].presentation-layer-conventions.guideline.md` (Pour l'UI du frontend).
    -   `[tech].data-normalization.guideline.md` (Pour la consistance des données).
-   **Critère de Succès :** Le code doit suivre les patrons (ex., contrôleurs minces, séparation API/Action, syntaxe de `@for` en Angular).

### Phase 4 : Génération du Rapport

-   **Objectif :** Consolider tous les constats dans un document unique.
-   **Votre Tâche :** Générez le document `[AUDIT].[nom-feature].md`, regroupant les déviations trouvées par chaque étape de la cascade.