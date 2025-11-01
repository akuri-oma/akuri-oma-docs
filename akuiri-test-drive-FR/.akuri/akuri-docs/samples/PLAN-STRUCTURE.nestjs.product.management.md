---
trigger: sample
description: Exemple de PLAN-STRUCTURE pour gestion de produits en NestJS, définissant architecture de fichiers et couches.
---

# PLAN-STRUCTURE : Gestion de Produits (NestJS)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan Structurel (Architecture de Fichiers/Couches)
- **Technologie** : NestJS (akuri-oma)
- **Emplacement** : `nest-backend/src/modules/product/`
- **Documents de Base** :
  - [`REQUIREMENT.product-management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](nest-backend/src/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objectif
Définir la structure de fichiers et couches pour la fonctionnalité, créant dossiers et fichiers de base sans contenu fonctionnel détaillé. Cela établit le squelette pour le PLAN-FUNCTIONAL ultérieur.

## 3. Portée
### Inclut
- Dossier racine : `product/`
- Sous-dossiers : `controllers/`, `services/`, `models/`
- Fichiers de base : Module, contrôleur, service, DTOs de base, entité.

### Exclut
- Contenu fonctionnel (logique de méthodes, validations détaillées) – couvert dans PLAN-FUNCTIONAL.
- Tests, configuration avancée.

## 4. Structure Détaillée

### 4.1 Dossier Racine
- `product/` : Dossier principal de la fonctionnalité.

### 4.2 Sous-Dossiers de Premier Niveau
- `controllers/` : Pour contrôleurs REST.
- `services/` : Pour services de logique métier.
- `models/` : Pour DTOs, entités et réponses.

### 4.3 Fichiers par Couche

#### Controllers
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.controller.ts` | Exposition d'endpoints REST | Décorateurs @Controller, méthodes de base (GET, POST, etc.) |

#### Services
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.service.ts` | Logique métier | Classe avec injection de dépendances, méthodes placeholders |

#### Models
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.entity.ts` | Entité de base de données | Décorateurs TypeORM (@Entity, @Column) |
| `create-product.dto.ts` | DTO pour création | Classe avec validations de base (@IsString, etc.) |
| `update-product.dto.ts` | DTO pour mise à jour | Similaire, avec champs optionnels |
| `product.response.ts` | Modèle de réponse | Interface pour payloads de sortie |
| `product.enum.ts` | Enum lié | Ex., status, category (optionnel si applicable) |

#### Configuration
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.module.ts` | Module NestJS | @Module avec imports, controllers, providers |

## 5. Itérations
1. Créer dossiers et fichiers de base.
2. Valider compilation sans erreurs.

## 6. Critères d'Acceptation
- Structure créée et compilable.
- Fichiers avec squelettes de base (imports, décorateurs).

---

**État** : Approuvé pour PLAN-FUNCTIONAL.