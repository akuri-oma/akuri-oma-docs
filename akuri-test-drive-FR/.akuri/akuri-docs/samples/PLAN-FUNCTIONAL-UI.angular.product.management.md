---
trigger: sample
description: Exemple de PLAN-FUNCTIONAL-UI pour gestion de produits en Angular, détaillant le contenu des fichiers UI.
---

# PLAN-FUNCTIONAL-UI : Gestion de Produits (Angular - UI)

## 1. Information Générale
- **Fonctionnalité** : Product Management (UI)
- **Type** : Plan Fonctionnel UI (Contenu des Fichiers Visuels)
- **Technologie** : Angular (akuri-oma)
- **Documents de Base** :
  - [`PLAN-STRUCTURE-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE-UI.angular.product.management.md)

## 2. Objectif
Détailler le contenu exact des fichiers UI (composants, pages), incluant technologies, imports, styles, interactions, et conventions. Permet la reconstruction précise de la couche visuelle.

## 3. Détails par Fichier

### 3.1 product.card.component.ts
- **Technologies** : @Component d'Angular.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : product.card.component.html, product.card.component.css.
- **Méthodes/Objets/Fonctions** :
  - Propriétés : @Input() product: ProductEntity.
  - Méthodes : onSelect().
  - Conventions : camelCase pour méthodes.

### 3.2 product.card.component.html
- **Technologies** : HTML avec Angular directives.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Template : <div>{{ product.name }}</div> avec *ngIf.
  - Conventions : camelCase pour bindings.

### 3.3 product.card.component.css
- **Technologies** : CSS.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Styles : .card { border: 1px solid #ccc; }.
  - Conventions : camelCase pour classes.

### 3.4 product.list.page.ts
- **Technologies** : @Component d'Angular.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : product.list.page.html, product.list.page.css.
- **Méthodes/Objets/Fonctions** :
  - Propriétés : products: ProductEntity[].
  - Méthodes : ngOnInit(), loadProducts().
  - Injection : constructor(private service: ProductStateService).
  - Conventions : camelCase pour méthodes.

### 3.5 product.list.page.html
- **Technologies** : HTML avec Angular directives.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Template : <product-card *ngFor="let p of products" [product]="p"></product-card>.
  - Conventions : camelCase pour bindings.

### 3.6 product.list.page.css
- **Technologies** : CSS/SCSS.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Styles : .list { display: grid; }.
  - Conventions : camelCase pour classes.

## 4. Technologies Spécifiques
- **PrimeNG** : Pour composants UI (boutons, tableaux ; installer si pas dans manifeste).
- **Tailwind CSS** : Pour styles utilitaires (installer si pas dans manifeste).
- **Iconify** : Pour icônes (installer si pas dans manifeste).
- **Angular Directives** : Pour bindings (*ngFor, [property]).
- **CSS/SCSS** : Pour styles personnalisés.

## 5. Critères d'Acceptation
- Fichiers contiennent exactement les éléments listés.
- Compilation sans erreurs.
- Interactions fonctionnelles (ex., onSelect déclenche événement).
- Conventions de noms respectées.

---

**État** : Approuvé pour BUILD (UI).