---
trigger: always_on
description: Définit la structure standard des projets dans la Méthodologie Akuri-oma, incluant l'organisation du dossier .akuri et ses sous-dossiers.
status: active
---

# Structure Standard des Projets Akuri

## 1. Dossier .akuri

Chaque projet doit contenir un dossier `.akuri` avec la structure suivante :

### akuri-docs/
- Documentation spécifique du projet
- Manuels utilisateur
- Diagrammes d'architecture

### akuri-guidelines/
- Guides d'implémentation spécifiques
- Patterns architecturaux
- Conventions de code

### akuri-history/
- Historique des changements
- Registres des décisions techniques
- Journaux de développement

### akuri-manifest/
- Manifeste du projet
- Technologies et dépendances
- Restrictions techniques

### akuri-prompts/
- Prompts initiaux du projet
- Exigences fonctionnelles
- Cas d'usage

### akuri-work/
- Travail en cours
- Documents temporaires
- Brouillons

### akuri-tasks/
- Listes de tâches
- Suivi des issues
- Planification

## 2. Flux d'Initialisation

1. Créer la structure de base du projet
2. Initialiser le dossier `.akuri` avec les sous-dossiers standards
3. Créer les documents initiaux minimaux :
   - `project.manifest.md`
   - `project.guideline.md`
   - `project.history.md`
4. Intégrer le projet avec le manifeste de la plateforme

## 3. Modèles de Base

Des modèles minimaux seront fournis pour chaque type de document dans le dossier `.akuri/templates/`

## 4. Dossier akuri-specs par Fonctionnalité

Chaque fonctionnalité ou module du projet (ex., `src/modules/property`, `src/modules/product`) doit inclure un sous-dossier dédié appelé `akuri-specs`. En tant qu'Agent Akuri, je suis responsable de créer ce dossier s'il n'existe pas au début du travail sur une fonctionnalité spécifique.

### Objectif
- Centraliser les documents "vivants" liés à cette fonctionnalité pendant qu'on interagit avec elle.
- Faciliter l'accès rapide aux références pendant les tâches comme BUILD, REFACTOR, AUDIT ou DEBUG, permettant la traçabilité et l'audit ultérieur.
- Maintenir un registre local dans la fonctionnalité pour éviter la perte d'information, complétant l'utilisation optionnelle de `.akuri/akuri-history/`.

### Contenu Recommandé
- `[INVENTORY]...md` : Liste des caractéristiques et exigences fonctionnelles.
- `[PLAN]...md` : Blueprint technique et plan de construction.
- `[TRACKER]...md` : Suivi des tâches pendant BUILD ou REFACTOR.
- Autres documents vivants : Spécifications temporaires, notes de conception, ou tout artefact généré pendant le processus (ex., CONCEPT, REQUIREMENT).

### Flux de Travail
1. Au début du travail sur une fonctionnalité, créer ou vérifier `akuri-specs` et stocker les documents actifs.
2. Maintenir les documents dans `akuri-specs` tant que la fonctionnalité est en développement ou modification.
3. L'archivage des documents dans `.akuri/akuri-history/` est optionnel et reste à la discrétion du développeur ; il n'existe pas de processus automatique qui oblige à les retirer de `akuri-specs`.

### Exemple de Structure
```
src/modules/property/
├── akuri-specs/
│   ├── [INVENTORY] property-features.md
│   └── [PLAN] property-blueprint.md
├── controllers/
├── services/
└── models/
```

Cela renforce l'organisation par fonctionnalité et améliore la maintenabilité du projet.