---
trigger: sample
description: Exemple de PLAN-STRUCTURE pour gestion de produits en Angular, définissant architecture de fichiers et couches logiques + UI.
---

# PLAN-STRUCTURE : Gestion de Produits (Angular)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan Structurel (Architecture de Fichiers/Couches Logiques + UI)
- **Technologie** : Angular (akuri-oma)
- **Emplacement** : `angular-frontend/src/app/modules/product/`
- **Documents de Base** :
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objectif
Définir la structure de fichiers et couches pour la fonctionnalité, incluant logique (égale au backend) et UI (pages/composants). Crée dossiers et fichiers de base sans contenu fonctionnel détaillé. Établit le squelette pour PLAN-FUNCTIONAL-LOGIC et PLAN-DETAIL-UI/UX ultérieurs.

## 3. Portée
### Inclut
- Dossier racine : `product/`
- Sous-dossiers : `models/`, `services/`, `presentation/` (avec `components/` communs/shared et `pages/`)
- Fichiers de base : Module, services, modèles, composants de base, routes.

### Exclut
- Contenu fonctionnel (logique de méthodes, styles, interactions) – couvert dans plans fonctionnels.
- Tests, configuration avancée.
- UI détaillée : Abordée dans document séparé (ex., `[PLAN-STRUCTURE-UI]...md`) après logique testée.

## 4. Structure Détaillée

### 4.1 Dossier Racine
- `product/` : Dossier principal de la fonctionnalité.

### 4.2 Sous-Dossiers de Premier Niveau
- `models/` : Pour DTOs, entités et réponses.
- `services/` : Pour API, action, logic et state services.
- `presentation/` : Dossier pour couche visuelle (séparée de logique).
  - `components/` : Composants communs/shared réutilisables.
  - `pages/` : Pages principales (list, create, detail).

### 4.3 Fichiers par Couche

#### Models
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.entity.ts` | Entité UI | Interface avec champs de base (id, name, price) |
| `create-product.dto.ts` | DTO pour création | Classe avec validations (@IsString) |
| `product.response.ts` | Modèle de réponse | Interface pour payloads du backend |
| `product.enum.ts` | Enum lié | Ex., status, category (optionnel si applicable) |

#### Services
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.api.service.ts` | Appels HTTP | Classe avec HttpClient, méthodes placeholders |
| `product.logic.service.ts` | Validations | Classe avec fonctions pures |
| `product.state.service.ts` | État local | Service avec Signals/RxJS pour cache |

#### Presentation/Components (Communs/Shared)
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product-list.component.ts` | Liste de produits (commun) | Composant shared avec selector, réutilisable |

#### Presentation/Pages
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product-list.page.ts` | Page de liste | Composant page avec routing, dossier `product-list-page/` avec fichiers séparés (ts, html, css/scss), sous-dossier `ui/` pour composants spécifiques |
| `product-detail.page.ts` | Page de détail | Similaire, dossier `product-detail-page/`, inclut paramètre :id |

**Règles de Nomenclature (akuri-oma) :**
- Fichiers : `[feature].[description].[type].ts/html/css/scss/svg` (ex., `product.list.page.ts`).
- Dossiers de page : `[description]-[type]` (ex., `list-page`).
- UI abordée dans document séparé (ex., `[PLAN-STRUCTURE-UI]...md`) après logique testée.

#### Configuration
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.routes.ts` | Routes | Array de Routes avec lazy loading |
| `product.module.ts` | Module | NgModule avec declarations, imports |

## 5. Itérations
1. Créer dossiers et fichiers de base pour logique.
2. Ajouter composants/pages de base.
3. Valider compilation sans erreurs.

## 6. Critères d'Acceptation
- Structure créée et compilable.
- Fichiers avec squelettes de base (imports, décorateurs).
- Routes configurées sans placeholders.

---

**État** : Approuvé pour PLAN-FUNCTIONAL-LOGIC et PLAN-DETAIL-UI/UX.