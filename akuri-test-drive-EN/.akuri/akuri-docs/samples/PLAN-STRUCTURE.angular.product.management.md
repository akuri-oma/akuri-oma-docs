---
trigger: sample
description: Example PLAN-STRUCTURE for product management in Angular, defining file architecture and logical + UI layers.
---

# PLAN-STRUCTURE: Product Management (Angular)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Structural Plan (File/Capacity Architecture Logical + UI)
- **Technology**: Angular (akuri-oma)
- **Location**: `angular-frontend/src/app/modules/product/`
- **Base Documents**:
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objective
Define the file structure and layers for the functionality, including logic (same as backend) and UI (pages/components). Creates folders and base files without detailed functional content. Establishes the skeleton for subsequent PLAN-FUNCTIONAL-LOGIC and PLAN-DETAIL-UI/UX.

## 3. Scope
### Includes
- Root folder: `product/`
- Subfolders: `models/`, `services/`, `presentation/` (with `components/` common/shared and `pages/`)
- Base files: Module, services, models, basic components, routes.

### Excludes
- Functional content (method logic, styles, interactions) – covered in functional plans.
- Tests, advanced configuration.
- Detailed UI: Addressed in separate document (e.g., `[PLAN-STRUCTURE-UI]...md`) after tested logic.

## 4. Detailed Structure

### 4.1 Root Folder
- `product/`: Main functionality folder.

### 4.2 First Level Subfolders
- `models/`: For DTOs, entities and responses.
- `services/`: For API, action, logic and state services.
- `presentation/`: Folder for visual layer (separated from logic).
  - `components/`: Common/shared reusable components.
  - `pages/`: Main pages (list, create, detail).

### 4.3 Files by Layer

#### Models
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.entity.ts` | UI Entity | Interface with basic fields (id, name, price) |
| `create-product.dto.ts` | DTO for creation | Class with validations (@IsString) |
| `product.response.ts` | Response model | Interface for backend payloads |
| `product.enum.ts` | Related enum | E.g., status, category (optional if applicable) |

#### Services
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.api.service.ts` | HTTP calls | Class with HttpClient, placeholder methods |
| `product.logic.service.ts` | Validations | Class with pure functions |
| `product.state.service.ts` | Local state | Service with Signals/RxJS for cache |

#### Presentation/Components (Common/Shared)
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product-list.component.ts` | Product list (common) | Shared component with selector, reusable |

#### Presentation/Pages
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product-list.page.ts` | List page | Page component with routing, folder `product-list-page/` with separate files (ts, html, css/scss), `ui/` subfolder for specific components |
| `product-detail.page.ts` | Detail page | Similar, folder `product-detail-page/`, includes :id parameter |

**Naming Rules (akuri-oma):**
- Files: `[feature].[description].[type].ts/html/css/scss/svg` (e.g., `product.list.page.ts`).
- Page folders: `[description]-[type]` (e.g., `list-page`).
- UI addressed in separate document (e.g., `[PLAN-STRUCTURE-UI]...md`) after tested logic.

#### Configuration
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.routes.ts` | Routes | Array of Routes with lazy loading |
| `product.module.ts` | Module | NgModule with declarations, imports |

## 5. Iterations
1. Create folders and base files for logic.
2. Add basic components/pages.
3. Validate compilation without errors.

## 6. Acceptance Criteria
- Structure created and compilable.
- Files with basic skeletons (imports, decorators).
- Routes configured without placeholders.

---

**Status**: Approved for PLAN-FUNCTIONAL-LOGIC and PLAN-DETAIL-UI/UX.