---
trigger: always_on
description: Glossaire central des termes et artefacts de la Méthodologie Akuri-OMA. Ce document est la source unique de vérité pour toute la terminologie.
---

# Glossaire de la Méthodologie Akuri-OMA

Ce document définit les termes, artefacts et concepts clés utilisés dans l'écosystème de développement Akuri.

## Artefacts de Documentation

-   **Manifest :**
    -   **Objectif :** Un document déclaratif qui établit les **technologies, projets et restrictions** d'une `PLATEFORME` ou `PROJET`. Répond à la question : "Qu'est-ce que c'est et quelles technologies utilise-t-il ?".
    -   **Exemple :** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline :**
    -   **Objectif :** Un manuel d'instructions technique. Définit **comment** structurer le code, implémenter la logique ou suivre un flux de travail. Ce sont des règles d'**implémentation et d'architecture**.
    -   **Exemple :** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document :**
    -   **Objectif :** Un manuel d'identité visuelle. Définit **comment** une interface utilisateur doit apparaître et se sentir (couleurs, typographie, composants, etc.). Ce sont des règles d'**apparence et de comportement visuel**.
    -   **Exemple :** `angular-app.look-and-feel.design.md`.

## Artefacts du Flux de Travail

**Convention de Nomenclature pour les Documents :** `DOCUMENT_TYPE.feature.description.md` (ex., `REQUIREMENT.product.management.md`). Cela assure la cohérence et facilite la recherche.

-   **CONCEPT (`[CONCEPT]...md`) :**
    -   **Objectif :** Un document de brainstorming initial pour explorer des idées de haut niveau sans restrictions. Utilisé en `MODO CREATIVO`.

-   **REQUIREMENT (`[REQUIREMENT]...md`) :**
    -   **Objectif :** Définit des exigences spécifiques et détaillées pour une nouvelle fonctionnalité ou modification existante (ex., BUILD, REFACTOR, UI_BUILD). Répond à "De quoi a-t-on exactement besoin ?" et est obligatoire avant DESIGN/PLAN pour éviter des solutions non alignées. Inclut l'évaluation de faisabilité.
    -   **Éléments Obligatoires :** Objectif (pour quoi), Portée (ce qui est inclus/exclu), Limitations (viabilité technique/réaliste), Critères d'Acceptation (conditions vérifiables pour l'exhaustivité et la qualité), Exigences de Sécurité (risques identifiés, mesures de base).
    -   **Création :** En `MODO CREATIVO`, avec des questions à l'utilisateur pour clarifier.

-   **DESIGN (`[DESIGN]...md`) :**
    -   **Objectif :** Propose une solution conceptuelle en prose pour satisfaire le REQUIREMENT approuvé. Explique comment le problème est résolu de manière narrative, sans diagrammes ni détails techniques profonds. Obligatoire après REQUIREMENT et avant PLAN pour valider la viabilité de l'idée.
    -   **Éléments Obligatoires :** Description de l'environnement (infrastructure et outils), explication de la solution, comment elle résout les problèmes, et comment elle garantit les critères d'acceptation.
    -   **Création :** En `MODO CREATIVO`, basé sur le REQUIREMENT.

-   **INVENTORY (`[INVENTORY]...md`) :**
    -   **Objectif :** La liste détaillée des **exigences fonctionnelles** et caractéristiques d'une fonctionnalité. Répond à la question : "Que doit-elle faire ?". Créé en `MODO CREATIVO`.

-   **PLAN (`[PLAN]...md` ou sous-types comme `[PLAN-STRUCTURE]...md`) :**
    -   **Objectif :** Blueprint technique rigide pour la construction, divisé en sous-types par couches (structure vs. fonctionnel) et technologie. Obligatoire après DESIGN pour guider BUILD progressif. Une fois approuvé, il est rigide comme un plan d'ingénierie civile : les changements nécessitent un nouveau REQUIREMENT/DESIGN.
    -   **Sous-types :**
      - Structurel : Définit l'architecture des fichiers/couches (ex., dossiers, fichiers de base).
      - Fonctionnel : Détaille le contenu de chaque fichier (technologies, imports, modules externes, méthodes/objets/fonctions, conventions de noms). Permet une reconstruction précise si un fichier est supprimé.
      - Tests : Définit les tests unitaires alignés avec REQUIREMENT et critères d'acceptation (quoi tester, frameworks, métriques de couverture).
      - Security : Définit les mesures de cybersécurité (authentification, chiffrement, validations) alignées avec les risques identifiés dans REQUIREMENT.
      - Pour Frontend : Ajoute UI (structure visuelle + détails page par page avec tests itératifs).
    -   **Exemples :** `[PLAN-STRUCTURE.nestjs]...md` (backend), `[PLAN-FUNCTIONAL.nestjs]...md` (contenu backend), `[PLAN-TESTS.nestjs]...md` (tests), `[PLAN-SECURITY.nestjs]...md` (sécurité), `[PLAN-STRUCTURE-UI.angular]...md` (frontend visuel).
    -   **Notes pour Frontend (Angular akuri-oma) :** L'architecture sépare la logique (models, services) de la présentation (dossier `presentation/` avec `components` communs/shared et `pages`). L'UI est abordée dans un document séparé (ex., `[PLAN-STRUCTURE-UI]...md`) après que la logique soit testée. Nomenclature : Fichiers `[feature].[description].[type].ts/html/css/scss/svg` ; Dossiers de page `[description]-[type]`. Les pages incluent un sous-dossier `ui` pour les composants spécifiques.
    -   **Création :** En `MODO DICTATORIAL`, basé sur DESIGN.

-   **TRACKER (`[TRACKER]...md`) :**
    -   **Objectif :** Document de suivi en temps réel pour l'exécution d'un PLAN ou REFACTOR. Inclut des checklists de tâches marquées (complétées, en attente, en cours), assurant une progression progressive, validation de l'utilisateur et prévention des improvisations. Créé en `MODO DICTATORIAL` et stocké dans `akuri-specs` de la fonctionnalité.

-   **PATTERN (`[PATTERN]...md`) :**
    -   **Objectif :** Snippet de code testé et réutilisable pour résoudre des problèmes courants dans des technologies spécifiques (ex., CRUD en NestJS). Fait partie de la culture de travail d'Akuri-OMA, utilisé seulement avec consentement explicite (documenté dans PLAN ou demandé par l'utilisateur). Inclut explication, philosophie, exigences et code de base.
    -   **Utilisation :** Référencé dans PLAN-FUNCTIONAL ; non appliqué automatiquement.

-   **HANDOVER (`[HANDOVER]...md`) :**
    -   **Objectif :** Document de livraison technique du backend au frontend, généré à la fin de BUILD backend. Détaille les contrats d'API complets (endpoints, DTOs, responses, authentification, erreurs), description fonctionnelle, aspects critiques et critères d'acceptation implicites, permettant l'intégration sans friction. C'est le premier document que lit le frontend.
    -   **Éléments Obligatoires :** Description fonctionnelle, aspects critiques, critères implicites, DTOs/responses (avec schémas TypeScript/JSON), endpoints (URLs, méthodes, exemples), authentification, erreurs.
    -   **Création :** En `MODO DICTATORIAL`, après BUILD et tests backend.

## Concepts du Processus

-   **Triaje (Triage) :**
    -   **Objectif :** La première action de l'agent pour chaque `prompt`. Consiste à classer la tâche de l'utilisateur dans une catégorie spécifique (ex., `BUILD`, `AUDIT`, `UI_SKIN`) pour déterminer le flux de travail et les documents à consulter.

-   **MODO CREATIVO :**
    -   **Objectif :** Un mode opérationnel de l'agent où il agit comme un analyste et facilitateur. Son objectif est de poser des questions, explorer des idées et définir des exigences. Il n'est pas régi par des règles strictes d'implémentation.

-   **MODO DICTATORIAL :**
    -   **Objectif :** Un mode opérationnel de l'agent où il agit comme un exécuteur discipliné. Son objectif est de suivre les `guidelines` et les décisions de l'utilisateur avec une précision absolue pour construire et refactoriser le code.

-   **Patrón Arquitectónico (Architectural Pattern) :**
    -   **Objectif :** Un **modèle de structure de fichiers et dossiers** prédéfini et nommé avec une `key` (ex., `STANDARD`, `COMPLEX`). Utilisé pendant la phase de "Blueprint Architectural" pour générer rapidement la structure d'une nouvelle fonctionnalité.
    -   **Défini dans :** `[tecnología].architectural-patterns.guideline.md`.