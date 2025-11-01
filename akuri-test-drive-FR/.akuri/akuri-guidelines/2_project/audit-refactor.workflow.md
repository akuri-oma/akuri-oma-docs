---
trigger: model_decision
description: Guideline orchestrateur qui définit les flux de travail d'AUDIT et REFACTOR sous le Modèle de Cascade Hiérarchique. Invoque une séquence de micro-guidelines pour auditer la conformité formelle (architecture) puis fonctionnelle (implémentation) d'une fonctionnalité.
status: active
use_case: AUDIT, UI_AUDIT, REFACTOR, UI_REFACTOR
---

# Flux de Travail d'Auditoría et Refactorización (audit-refactor.workflow.md)

## 1. Principes du Flux de Travail

-   **Principe de Cascade Simple :** VOUS, en tant qu'Agent Akuri, DEVEZ exécuter chaque étape de l'auditoría en séquence. Si une étape révèle des déviations critiques, le processus s'arrête, le rapport est généré, et on ne procède pas aux étapes suivantes. **La conformité formelle précède la conformité fonctionnelle.**
-   **Séquence `AUDIT` -> `REFACTOR` :** Une tâche de `REFACTOR` doit toujours être précédée par une `AUDIT`. Le rapport de l'auditoría est l'`input` pour le plan de refactorización.

## 2. Flux de Travail de `AUDIT`

### Phase 1 : Localisation du Feature (Entrée de l'Utilisateur)

-   **Objectif :** Identifier sans ambiguïté la portée de l'auditoría.
-   **Votre Tâche :**
    1.  Demandez à l'utilisateur le **chemin exact** du dossier de la fonctionnalité à auditer.
    2.  Si l'utilisateur fournit une liste, créez un plan pour itérer sur chacune, générant un rapport d'auditoría individuel.

### Phase 2 : Auditoría de Conformité Formelle (Architecture)

#### Étape 2.1 : Validation de Macro-Architecture
-   **Objectif :** Vérifier si la fonctionnalité est à l'emplacement correct.
-   **Action :** Invoquez le `guideline` `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Critère de Succès :** Le dossier doit être dans une "zone" autorisée (ex., `subsystem/`, `modules/`).

#### Étape 2.2 : Validation du Patron Architectonique
-   **Objectif :** Vérifier si la structure interne suit un patron approuvé.
-   **Action :** Invoquez le `guideline` `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Critère de Succès :** La structure de dossiers (`models/`, `services/`, etc.) doit correspondre à un patron défini (`STANDARD`, `COMPLEX`, etc.).

#### Étape 2.3 : Validation de Nomenclature de Fichiers
-   **Objectif :** Vérifier si tous les fichiers ont le préfixe et la convention correcte.
-   **Action :** Invoquez le `guideline` `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Critère de Succès :** Tous les fichiers doivent respecter les règles de préfixes et suffixes.

**Point de Contrôle :** Si des déviations critiques sont trouvées dans ces étapes, le rapport est généré et le processus d'auditoría se termine ici.

### Phase 3 : Auditoría de Conformité Fonctionnelle (Implémentation)

#### Étape 3.1 : Validation d'Adhérence Technologique
-   **Objectif :** Vérifier que seules les bibliothèques et technologies autorisées sont utilisées.
-   **Action :** Invoquez le `project.manifest.md` et comparez les importations du code contre les technologies autorisées.
-   **Critère de Succès :** Il ne doit pas y avoir d'importations de bibliothèques non autorisées.

#### Étape 3.2 : Validation de Patrons d'Implémentation
-   **Objectif :** Vérifier si le code suit les patrons de la méthodologie.
-   **Action :** Invoquez les `guidelines` d'implémentation pertinents du dossier `3_technology/[tech]/`.
-   **Critère de Succès :** Le code doit suivre les patrons (ex., contrôleurs minces, séparation API/Action, syntaxe de `@for`, etc.).

### Phase 4 : Génération du Rapport

-   **Objectif :** Consolider tous les constats.
-   **Votre Tâche :** Générez le document `[AUDIT].[nom-feature].md`, regroupant les déviations par chaque étape de la cascade.

## 3. Flux de Travail de `REFACTOR`

### Phase 1 : Planification (`PLAN`)
-   **Objectif :** Créer un plan d'action basé sur un rapport d'auditoría.
-   **Votre Tâche :**
    1.  Utilisez un rapport `[AUDIT]...md` comme entrée.
    2.  Différenciez entre `REFACTOR` (changements internes) et `REMAKE` (changements dans l'API publique). Si c'est `REMAKE`, arrêtez le flux et proposez un `DESIGN`.
    3.  Créez un document `[PLAN].[refactor]-[nom-feature].md` qui liste les tâches de correction dans un ordre logique.
    4.  Demandez l'approbation de l'utilisateur pour ce plan.

### Phase 2 : Exécution (`BUILD`)
-   **Objectif :** Appliquer les corrections.
-   **Votre Tâche :** **SEULEMENT après l'approbation du plan**, exécutez les tâches de modification de code.

### Phase 3 : Vérification
-   **Objectif :** Confirmer que toutes les déviations ont été corrigées.
-   **Votre Tâche :** Exécutez une nouvelle `AUDIT` sur la fonctionnalité refactorisée et présentez les résultats.