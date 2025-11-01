---
trigger: sample
description: Exemple de PLAN-TESTS pour gestion de produits en Angular, définissant tests unitaires pour logique et UI.
---

# PLAN-TESTS : Gestion de Produits (Angular)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan de Tests Unitaires (Logique + UI)
- **Technologie** : Angular (Jasmine/Karma)
- **Documents de Base** :
  - [`REQUIREMENT.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`PLAN-FUNCTIONAL.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL.angular.product.management.md)
  - [`PLAN-FUNCTIONAL-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-UI.angular.product.management.md)

## 2. Objectif
Définir tests unitaires pour logique et UI, vérifiant critères d'acceptation : compilation sans erreurs, interactions fonctionnelles, couverture >80%.

## 3. Framework de Tests
- **Jasmine/Karma** : Pour tests unitaires.
- **Angular Testing Utilities** : Pour composants et services.

## 4. Tests par Fichier (Logique)

### 4.1 product.entity.ts
- **Tests** : Valider interfaces (types corrects).
- **Critères** : Couverture 100% dans propriétés.

### 4.2 product.api.service.ts
- **Tests** : Méthodes HTTP avec mocks (HttpClientTestingModule).
- **Critères** : Appels corrects, gestion d'erreurs.

### 4.3 product.logic.service.ts
- **Tests** : Validations pures.
- **Critères** : Cas valides/invalides passent.

### 4.4 product.state.service.ts
- **Tests** : Signals/RxJS mettent à jour correctement.
- **Critères** : État change comme attendu.

## 5. Tests par Fichier (UI)

### 5.1 product.card.component.ts
- **Tests** : @Input bindings, événements émis.
- **Critères** : Template rend données.

### 5.2 product.list.page.ts
- **Tests** : ngOnInit charge données, interactions.
- **Critères** : Page répond à état.

## 6. Métriques de Couverture
- **Lignes** : >80%.
- **Fonctions** : >90%.
- **Branches** : >75%.

## 7. Critères d'Acceptation
- Tests passent sans échecs.
- Couverture rapportée par Karma.
- Alignement avec REQUIREMENT (compilation, interactions).

---

**État** : Approuvé pour BUILD avec tests.