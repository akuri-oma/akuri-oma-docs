---
trigger: sample
description: Example PLAN-STRUCTURE-UI for product management in Angular, defining visual structure of pages and components.
---

# PLAN-STRUCTURE-UI: Product Management (Angular)

## 1. General Information
- **Functionality**: Product Management UI
- **Type**: UI Structural Plan (Visual Architecture)
- **Technology**: Angular (akuri-oma)
- **Location**: `angular-frontend/src/app/modules/product/presentation/`
- **Base Documents**:
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)
  - [`PLAN-STRUCTURE.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.product-management.md)
  - [`PLAN-FUNCTIONAL-LOGIC.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-LOGIC.product-management.md)

**Note:** This plan is created after logic is built and tested. It addresses pages separately with live testing before moving to the next.

## 2. Objective
Define the visual structure of specific pages and components, following akuri-oma nomenclature. Creates folders and base files for UI without detailed functional content (styles, interactions).

## 3. Scope
### Includes
- Pages: list, create, detail (each in separate folder with ts, html, css/scss files, ui subfolder).
- Common/shared components in `components/`.
- Nomenclature: Files `[feature].[description].[type].ts/html/css/scss`; Folders `[description]-[type]`.

### Excludes
- Logic (already covered in previous plans).
- Functional content (detailed styles, interactions) – covered in PLAN-DETAIL-UI/UX.
- Tests.

## 4. Detailed Structure

### 4.1 Components (Common/Shared)
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.card.component.ts` | Product card | Shared component |
| `product.card.component.html` | Template | HTML file (replaceable by .svg) |
| `product.card.component.css` | Styles | CSS file (replaceable by .scss) |

### 4.2 Pages
#### product-list-page/
- Files: `product.list.page.ts`, `product.list.page.html`, `product.list.page.css`
- Subfolder `ui/`: Specific components (e.g., `product.filter.component.ts`, `product.filter.component.html`, `product.filter.component.css`)

#### product-create-page/
- Files: `product.create.page.ts`, `product.create.page.html`, `product.create.page.scss`
- Subfolder `ui/`: Specific components (e.g., `product.form.component.ts`, `product.form.component.html`, `product.form.component.scss`)

#### product-detail-page/
- Files: `product.detail.page.ts`, `product.detail.page.html`, `product.detail.page.scss`
- Subfolder `ui/`: Specific components (e.g., `product.actions.component.ts`, `product.actions.component.html`, `product.actions.component.scss`)

## 5. Iterations
1. Create list page with basic ui, test live.
2. Create create page, test.
3. Create detail page, test.

## 6. Acceptance Criteria
- Structure created, files compilable.
- Correct nomenclature.
- Pages accessible via routing.

---

**Status**: Approved for PLAN-DETAIL-UI/UX.