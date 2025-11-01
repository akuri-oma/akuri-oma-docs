---
trigger: sample
description: Exemple de PLAN-TESTS pour gestion de produits en NestJS, définissant tests unitaires alignés avec REQUIREMENT.
---

# PLAN-TESTS : Gestion de Produits (NestJS)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan de Tests Unitaires
- **Technologie** : NestJS (Jest)
- **Documents de Base** :
  - [`REQUIREMENT.product.management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`PLAN-FUNCTIONAL.nestjs.product.management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-FUNCTIONAL.nestjs.product.management.md)

## 2. Objectif
Définir tests unitaires qui vérifient critères d'acceptation : endpoints répondent correctement, validations passent, couverture >80%, sans erreurs dans logs.

## 3. Framework de Tests
- **Jest** : Pour exécution de tests.
- **Supertest** : Pour tests d'endpoints HTTP.

## 4. Tests par Fichier

### 4.1 product.entity.ts
- **Tests** : Valider décorateurs TypeORM (id auto-généré, colonnes correctes).
- **Critères** : Couverture 100% dans propriétés.

### 4.2 create-product.dto.ts
- **Tests** : Valider validations (@IsString échoue avec nombres, @IsNumber positif).
- **Critères** : DTOs invalides rejettent, valides passent.

### 4.3 product.controller.ts
- **Tests** : Endpoints GET/POST/PUT/DELETE répondent avec status 200/201, gèrent erreurs 400/404.
- **Critères** : Réponses typées, appels à service corrects.

### 4.4 product.service.ts
- **Tests** : Méthodes findAll/create/update/delete avec mocks de repo.
- **Critères** : Logique correcte, exceptions lancées.

## 5. Métriques de Couverture
- **Lignes** : >80%.
- **Fonctions** : >90%.
- **Branches** : >75%.

## 6. Critères d'Acceptation
- Tests passent sans échecs.
- Couverture rapportée par Jest.
- Alignement avec REQUIREMENT (endpoints fonctionnels, validations).

---

**État** : Approuvé pour BUILD avec tests.