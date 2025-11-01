---
trigger: sample
description: Exemple de TRACKER pour BUILD de gestion de produits en Angular, guidant logique et UI.
---

# TRACKER : Build de Gestion de Produits (Angular)

## Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Suivi de BUILD (Logique + UI)
- **Emplacement** : `angular-frontend/src/app/modules/product/akuri-specs/TRACKER.angular.product.build.md`
- **Documents de Base** :
  - [`PLAN-FUNCTIONAL.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL.angular.product.management.md)
  - [`PLAN-FUNCTIONAL-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-UI.angular.product.management.md)
  - [`PLAN-TESTS.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-TESTS.angular.product.management.md)

## État Général
- [x] PLAN-FUNCTIONAL approuvé
- [ ] BUILD logique complété
- [ ] BUILD UI complété
- [ ] Tests passés
- [ ] Validation finale de l'utilisateur

## Checklist de Tâches (Logique)

### Models
- [x] Créer product.entity.ts (interface avec id/name/price)
- [x] Créer create-product.dto.ts (classe avec validations)
- [x] Créer product.response.ts (interface pour backend)

### Services
- [ ] Créer product.api.service.ts (méthodes HTTP avec HttpClient)
- [ ] Créer product.logic.service.ts (validations pures)
- [ ] Créer product.state.service.ts (Signals/RxJS pour cache)

## Checklist de Tâches (UI)

### Components
- [ ] Créer product.card.component.ts/html/css (carte shared)
- [ ] Créer product-list-page/ fichiers (ts/html/css, sous-dossier ui)
- [ ] Créer product-create-page/ fichiers (ts/html/css, sous-dossier ui)
- [ ] Créer product-detail-page/ fichiers (ts/html/css, sous-dossier ui)

## Checklist de Tests
- [ ] Exécuter tests unitaires (Jasmine/Karma, couverture >80%)
- [ ] Valider interactions UI

## Notes de Progrès
- **Logique en cours** : Services prêts, testant state.
- **UI en attente** : Attend logique complétée.
- **Validation** : Approuver logique avant UI.
- **Prochaine** : Compléter services, puis commencer components.

## Critères de Finalisation
- Toutes les tâches marquées comme [x].
- Tests passent.
- Utilisateur approuve fonctionnalité.

---

**Dernière Mise à Jour** : 2025-10-30  
**État** : En cours (30% complété)