---
trigger: overview
description: Description générale de l'architecture OMA et de la philosophie Akuri dans la Méthodologie Akuri-OMA.
---

# Architecture OMA et Philosophie Akuri

## Introduction
La Méthodologie Akuri-OMA (Oriented Methodology Architecture) est un framework rigoureux pour le développement logiciel, conçu pour garantir qualité, traçabilité et sécurité dans les projets technologiques. Elle combine les principes d'ingénierie civile avec les meilleures pratiques de développement, en mettant l'accent sur la documentation vivante et la validation progressive. Son nom reflète l'"architecture orientée méthodologie" (OMA), où chaque phase du processus est structurée pour minimiser les risques et maximiser l'efficacité.

## Philosophie Akuri
La philosophie Akuri se base sur le "Développement Orienté par les Spécifications", une approche disciplinaire qui priorise la clarté et la rigidité sur l'improvisation. Ses principes fondamentaux sont :

- **Spécifications comme Base** : Tout développement commence par des documents détaillés (REQUIREMENT, DESIGN, PLAN), qui définissent "quoi" est nécessaire avant "comment" l'implémenter. Cela évite les solutions "belles" mais non alignées avec l'utilisateur.
- **Rigidité et Traçabilité** : Les plans sont "rigides comme des plans d'ingénierie civile" ; les changements nécessitent de nouveaux documents. Chaque étape est validée avec l'utilisateur, assurant une progression progressive sans retours inattendus.
- **Intégration de l'IA avec Limites** : Les agents IA (comme celui-ci) opèrent dans des modes définis (CREATIF pour l'exploration, DICTATORIAL pour l'exécution), avec des règles strictes pour prévenir les improvisations. L'IA est un outil, pas un remplacement de la méthodologie.
- **Qualité et Sécurité par Défaut** : Les tests et la sécurité sont intégrés dans toutes les phases, suivant des standards comme OWASP. Il n'y a pas d'"optionnels" ; les échecs bloquent la progression.
- **Collaboration et Amélioration Continue** : Met l'accent sur le feedback de l'utilisateur et la documentation vivante, permettant les audits et l'évolutivité. La méthodologie évolue avec les leçons apprises.

En essence, Akuri transforme le développement chaotique en un processus prévisible, comme construire une maison avec des plans précis au lieu d'improviser.

## Architecture OMA
L'architecture OMA organise le développement en couches et phases interconnectées, formant un "squelette" qui guide de l'idée au produit final. Elle est divisée en :

### 1. Couches de Gouvernance
- **Documents Maîtres** : Glossaire, guidelines et manifestes qui définissent les règles globales et les technologies restrictives.
- **Artefacts du Flux** : REQUIREMENT, DESIGN, PLAN (sous-types : STRUCTURE, FUNCTIONAL, TESTS, SECURITY), TRACKER, HANDOVER.
- **Modes Opérationnels** : CREATIF (analytique, questions) et DICTATORIAL (exécuteur, précision).

### 2. Phases du Processus
1. **Triage** : Classification initiale de la demande de l'utilisateur.
2. **Spécification** : REQUIREMENT (quoi) → DESIGN (solution conceptuelle).
3. **Planification** : PLAN (blueprint technique rigide).
4. **Exécution** : BUILD avec TRACKER (suivi progressif).
5. **Intégration** : HANDOVER (contrat backend-frontend).
6. **Validation** : Tests, audits et clôture.

### 3. Intégrations Clés
- **Technologies** : Support pour des stacks comme NestJS (backend), Angular (frontend), avec des patterns fonctionnels et sécurité intégrée.
- **Sécurité** : Pilier obligatoire, avec PLAN-SECURITY et tests dédiés.
- **Évolutivité** : Applicable aux nouvelles fonctionnalités ou modifications existantes, avec séparation frontend/backend.

### 4. Avantages de l'Architecture
- **Réduction des Risques** : Validation étape par étape prévient les erreurs coûteuses.
- **Efficacité** : Documents réutilisables accélèrent le développement futur.
- **Qualité Garantie** : Tests et sécurité intégrés assurent des produits robustes.
- **Adaptabilité** : Évolue avec les nouvelles technologies sans perdre de rigidité.

Akuri-OMA n'est pas seulement une méthodologie ; c'est une culture de développement disciplinée, où l'architecture OMA fournit le cadre pour exécuter la philosophie Akuri de manière cohérente et sécurisée.