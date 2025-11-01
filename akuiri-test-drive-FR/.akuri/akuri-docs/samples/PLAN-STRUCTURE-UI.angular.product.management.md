---
trigger: sample
description: Exemple de PLAN-STRUCTURE-UI pour gestion de produits en Angular, définissant structure visuelle de pages et composants.
---

# PLAN-STRUCTURE-UI : Gestion de Produits (Angular)

## 1. Information Générale
- **Fonctionnalité** : Product Management UI
- **Type** : Plan Structurel de UI (Architecture Visuelle)
- **Technologie** : Angular (akuri-oma)
- **Emplacement** : `angular-frontend/src/app/modules/product/presentation/`
- **Documents de Base** :
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)
  - [`PLAN-STRUCTURE.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.product-management.md)
  - [`PLAN-FUNCTIONAL-LOGIC.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-LOGIC.product-management.md)

**Note :** Ce plan est créé après que la logique soit construite et testée. Aborde pages séparément avec tests en direct avant de passer à la suivante.

## 2. Objectif
Définir la structure visuelle de pages et composants spécifiques, suivant nomenclature akuri-oma. Crée dossiers et fichiers de base pour UI sans contenu fonctionnel détaillé (styles, interactions).

## 3. Portée
### Inclut
- Pages : list, create, detail (chacune dans dossier séparé avec fichiers ts, html, css/scss, sous-dossier ui).
- Composants communs/shared dans `components/`.
- Nomenclature : Fichiers `[feature].[description].[type].ts/html/css/scss` ; Dossiers `[description]-[type]`.

### Exclut
- Logique (déjà couverte dans plans précédents).
- Contenu fonctionnel (styles détaillés, interactions) – couvert dans PLAN-DETAIL-UI/UX.
- Tests.

## 4. Structure Détaillée

### 4.1 Components (Communs/Shared)
| Fichier | Objectif | Détails Techniques |
| --- | --- | --- |
| `product.card.component.ts` | Carte de produit | Composant shared |
| `product.card.component.html` | Template | Fichier HTML (remplaçable par .svg) |
| `product.card.component.css` | Styles | Fichier CSS (remplaçable par .scss) |

### 4.2 Pages
#### product-list-page/
- Fichiers : `product.list.page.ts`, `product.list.page.html`, `product.list.page.css`
- Sous-dossier `ui/` : Composants spécifiques (ex., `product.filter.component.ts`, `product.filter.component.html`, `product.filter.component.css`)

#### product-create-page/
- Fichiers : `product.create.page.ts`, `product.create.page.html`, `product.create.page.scss`
- Sous-dossier `ui/` : Composants spécifiques (ex., `product.form.component.ts`, `product.form.component.html`, `product.form.component.scss`)

#### product-detail-page/
- Fichiers : `product.detail.page.ts`, `product.detail.page.html`, `product.detail.page.scss`
- Sous-dossier `ui/` : Composants spécifiques (ex., `product.actions.component.ts`, `product.actions.component.html`, `product.actions.component.scss`)

## 5. Itérations
1. Créer page list avec ui de base, tester en direct.
2. Créer page create, tester.
3. Créer page detail, tester.

## 6. Critères d'Acceptation
- Structure créée, fichiers compilables.
- Nomenclature correcte.
- Pages accessibles via routing.

---

**État** : Approuvé pour PLAN-DETAIL-UI/UX.