---
trigger: sample
description: Example PLAN-FUNCTIONAL for product management in Angular (logic), detailing logical file contents.
---

# PLAN-FUNCTIONAL: Product Management (Angular - Logic)

## 1. General Information
- **Functionality**: Product Management (Logic)
- **Type**: Functional Plan (Logical File Contents)
- **Technology**: Angular (akuri-oma)
- **Base Documents**:
  - [`PLAN-STRUCTURE.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.angular.product.management.md)

## 2. Objective
Detail the exact content of logical files (models, services), including technologies, imports, external modules, methods/objects/functions, and conventions. Allows precise reconstruction.

## 2.1 Frontend Prerequisites
1. Read backend HANDOVER if it exists; if not, consult Swagger documentation or request the user to generate HANDOVER.
2. Create models synchronized with the backend (based on HANDOVER).

## 3. Details per File

### 3.1 product.entity.ts
- **Technologies**: TypeScript interfaces.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Interface: ProductEntity { id: number; name: string; price: number; }.
  - Conventions: PascalCase for interface, camelCase for properties.

### 3.2 create-product.dto.ts
- **Technologies**: TypeScript classes.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Class: CreateProductDto { name: string; price: number; }.
  - Conventions: PascalCase for class.

### 3.3 product.response.ts
- **Technologies**: TypeScript interfaces.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Interface: ProductResponse { id: number; name: string; }.
  - Conventions: PascalCase for interface.

### 3.4 product.api.service.ts
- **Technologies**: HttpClient from Angular.
- **External Modules**: None.
- **Special Files**: environment.ts (for API URL).
- **Methods/Objects/Functions**:
  - Methods: getProducts(): Observable<ProductResponse[]>, createProduct(dto: CreateProductDto): Observable<ProductResponse>.
  - Injection: constructor(private http: HttpClient).
  - Conventions: camelCase for methods.

### 3.5 product.logic.service.ts
- **Technologies**: RxJS.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Methods: validateProduct(dto): boolean, normalizePrice(price): number.
  - Conventions: camelCase for methods.

### 3.6 product.state.service.ts
- **Technologies**: Signals/RxJS from Angular.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Signals: products$ = signal<ProductEntity[]>([]).
  - Methods: setProducts(products), getProducts().
  - Conventions: camelCase for methods.

## 4. Specific Technologies
- **RxJS**: For observables (install if not present).
- **HttpClient**: For APIs (part of Angular).

## 5. Acceptance Criteria
- Files contain exactly the listed elements.
- Compilation without errors.
- Naming conventions respected.

---

**Status**: Approved for BUILD (logic).