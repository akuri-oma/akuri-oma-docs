---
trigger: presentation
description: Résumé du flux de travail complet de la Méthodologie Akuri-OMA pour présentations, avec diagramme et explications par artefact.
---

# Flux de Travail Complet : Méthodologie Akuri-OMA

## Diagramme Général du Flux (Lame 1)

```
[Utilisateur Demande] → Triage → REQUIREMENT (MODE CREATIF)
    ↓
Validation de Faisabilité → Approbation
    ↓
DESIGN (MODE CREATIF) → Approbation
    ↓
PLAN (Sous-types : STRUCTURE, FUNCTIONAL, TESTS, SECURITY) (MODE DICTATORIAL)
    ↓
BUILD avec TRACKER (MODE DICTATORIAL) → Tests
    ↓
HANDOVER (Backend → Frontend) → Intégration
    ↓
Finalisation et Audit
```

**Notes Clés :**
- Modes : CREATIF (exploration), DICTATORIAL (exécution rigide).
- Sécurité intégrée dans toutes les phases.
- Validation étape par étape ; ne pas avancer sans approbation.

## Explication par Artefact (Lames Suivantes)

### 1. REQUIREMENT
- **Objectif** : Définit "quoi" est nécessaire (objectif, portée, limitations, critères d'acceptation, exigences de sécurité).
- **Quand** : Début de toute nouvelle fonctionnalité/modification.
- **Mode** : CREATIF (questions à l'utilisateur).
- **Exemple** : Pour gestion de produits : "CRUD de produits avec validations, sans accès non autorisé".

### 2. DESIGN
- **Objectif** : Solution conceptuelle narrative (environnement, explication, résolution de problèmes, garanties de critères).
- **Quand** : Après REQUIREMENT approuvé.
- **Mode** : CREATIF.
- **Exemple** : "Utiliser NestJS pour backend avec Angular pour frontend, garantissant <500ms responses".

### 3. PLAN (Sous-types)
- **Objectif** : Blueprint rigide (structure de fichiers, contenu fonctionnel, tests, sécurité).
- **Sous-types** :
  - STRUCTURE : Architecture de dossiers/fichiers.
  - FUNCTIONAL : Contenu détaillé des fichiers.
  - TESTS : Tests unitaires + sécurité.
  - SECURITY : Mesures de cybersécurité.
- **Quand** : Après DESIGN.
- **Mode** : DICTATORIAL.
- **Exemple** : PLAN-STRUCTURE définit les modules en NestJS ; PLAN-SECURITY détaille JWT.

### 4. TRACKER
- **Objectif** : Suivi en temps réel de BUILD (checklists marquées, progrès, validation).
- **Quand** : Pendant BUILD.
- **Mode** : DICTATORIAL.
- **Exemple** : Checklist des tâches complétées, notes de risques.

### 5. HANDOVER
- **Objectif** : Contrat d'intégration backend-frontend (endpoints, DTOs, responses, sécurité).
- **Quand** : Fin de BUILD backend.
- **Mode** : DICTATORIAL.
- **Exemple** : Détails d'API avec schémas JSON et authentification.

### 6. Sécurité (Intégrée)
- **Objectif** : Pilier obligatoire (OWASP, chiffrement, validations).
- **Quand** : Toutes les phases.
- **Exemple** : Exigences dans REQUIREMENT, mesures dans PLAN-SECURITY.

Ce flux assure un développement rigoureux, traçable et sécurisé.