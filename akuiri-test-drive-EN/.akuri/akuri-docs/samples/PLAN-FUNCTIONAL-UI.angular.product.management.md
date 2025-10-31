---
trigger: sample
description: Example PLAN-FUNCTIONAL-UI for product management in Angular, detailing UI file contents.
---

# PLAN-FUNCTIONAL-UI: Product Management (Angular - UI)

## 1. General Information
- **Functionality**: Product Management (UI)
- **Type**: Functional UI Plan (Visual File Contents)
- **Technology**: Angular (akuri-oma)
- **Base Documents**:
  - [`PLAN-STRUCTURE-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE-UI.angular.product.management.md)

## 2. Objective
Detail the exact content of UI files (components, pages), including technologies, imports, styles, interactions, and conventions. Allows precise reconstruction of the visual layer.

## 3. Details per File

### 3.1 product.card.component.ts
- **Technologies**: @Component from Angular.
- **External Modules**: None.
- **Special Files**: product.card.component.html, product.card.component.css.
- **Methods/Objects/Functions**:
  - Properties: @Input() product: ProductEntity.
  - Methods: onSelect().
  - Conventions: camelCase for methods.

### 3.2 product.card.component.html
- **Technologies**: HTML with Angular directives.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Template: <div>{{ product.name }}</div> with *ngIf.
  - Conventions: camelCase for bindings.

### 3.3 product.card.component.css
- **Technologies**: CSS.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Styles: .card { border: 1px solid #ccc; }.
  - Conventions: camelCase for classes.

### 3.4 product.list.page.ts
- **Technologies**: @Component from Angular.
- **External Modules**: None.
- **Special Files**: product.list.page.html, product.list.page.css.
- **Methods/Objects/Functions**:
  - Properties: products: ProductEntity[].
  - Methods: ngOnInit(), loadProducts().
  - Injection: constructor(private service: ProductStateService).
  - Conventions: camelCase for methods.

### 3.5 product.list.page.html
- **Technologies**: HTML with Angular directives.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Template: <product-card *ngFor="let p of products" [product]="p"></product-card>.
  - Conventions: camelCase for bindings.

### 3.6 product.list.page.css
- **Technologies**: CSS/SCSS.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Styles: .list { display: grid; }.
  - Conventions: camelCase for classes.

## 4. Specific Technologies
- **PrimeNG**: For UI components (buttons, tables; install if not in manifest).
- **Tailwind CSS**: For utility styles (install if not present).
- **Iconify**: For icons (install if not present).
- **Angular Directives**: For bindings (*ngFor, [property]).
- **CSS/SCSS**: For custom styles.

## 5. Acceptance Criteria
- Files contain exactly the listed elements.
- Compilation without errors.
- Functional interactions (e.g., onSelect triggers event).
- Naming conventions respected.

---

**Status**: Approved for BUILD (UI).