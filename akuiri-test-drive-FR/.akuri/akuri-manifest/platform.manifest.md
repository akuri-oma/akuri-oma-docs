---
trigger: always_on
description: Manifeste de la plateforme AKURI_TEST qui décrit la structure, les objectifs et les responsabilités technologiques des projets nest-backend et angular-frontend pour une plateforme de tests de la méthodologie Akuri-oma.
---

# Manifeste de la Plateforme AKURI_TEST

## 1. Objectif
Plateforme de tests de la méthodologie Akuri-oma, utilisée pour démontrer et valider les processus, patterns et guides de développement définis dans la méthodologie.

## 2. Description
AKURI_TEST est une plateforme d'exemple qui implémente la méthodologie Akuri-oma, combinant un backend en NestJS et un frontend en Angular pour illustrer les meilleures pratiques et flux de travail de la méthodologie.

## 3. Structure de la Plateforme et Détails Techniques

Cette section décrit les projets qui constituent la plateforme et leurs contrats techniques clés.

-   **`nest-backend` :**
    -   **Rôle :** API Backend et Noyau de Logique Métier.
    -   **Technologie :** NestJS.
    -   **Description :** Gère la logique de domaine et sert comme source d'API pour le frontend.
    -   **`api_docs_url_local` :** `http://localhost:3000/explorer` (seule adresse utilisée).

-   **`angular-frontend` :**
    -   **Rôle :** Application Web Frontend.
    -   **Technologie :** Angular.
    -   **Dépend de :** `nest-backend`.
    -   **Description :** Interface utilisateur responsive qui consomme les APIs du backend.
    -   **`url_local` :** `http://localhost:4200` (seule adresse utilisée).


## 4. Responsabilités Technologiques et Pile Principale

-   **Logique Métier :** `nest-backend` est la seule source de vérité. Gère la logique de domaine et fournit des APIs pour le frontend.
-   **Logique de Présentation :** `angular-frontend` est responsable du rendu des données et de la capture de l'intention de l'utilisateur. Consomme les APIs du backend.
-   **Services Centraux de la Plateforme :** Aucun service externe comme Firebase n'est utilisé dans cette plateforme de tests.

## 5. Conventions de Nomenclature des Projets

-   En se référant à "backend", cela signifie le projet `nest-backend`.
-   En se référant à "frontend" ou "web", cela signifie le projet `angular-frontend`.
-   Il n'y a pas d'application mobile dans cette plateforme de tests.
-   S'il existe une ambiguïté dans les références du projet, TOI, en tant qu'Agent Akuri, DOIS demander une clarification à l'utilisateur avant de procéder.

## 6. Expansion Future
Cette plateforme de tests peut s'étendre avec de nouvelles fonctionnalités pour démontrer des aspects supplémentaires de la méthodologie Akuri-oma.