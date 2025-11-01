---
trigger: sample
description: Example PLAN-TESTS for product management in Angular, defining unit tests for logic and UI.
---

# PLAN-TESTS: Product Management (Angular)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Unit Tests Plan (Logic + UI)
- **Technology**: Angular (Jasmine/Karma)
- **Base Documents**:
  - [`REQUIREMENT.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product.management.md)
  - [`PLAN-FUNCTIONAL.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL.angular.product.management.md)
  - [`PLAN-FUNCTIONAL-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-UI.angular.product.management.md)

## 2. Objective
Define unit tests for logic and UI, verifying acceptance criteria: compilation without errors, functional interactions, coverage >80%.

## 3. Testing Framework
- **Jasmine/Karma**: For unit tests.
- **Angular Testing Utilities**: For components and services.

## 4. Tests by File (Logic)

### 4.1 product.entity.ts
- **Tests**: Validate interfaces (correct types).
- **Criteria**: 100% coverage on properties.

### 4.2 product.api.service.ts
- **Tests**: HTTP methods with mocks (HttpClientTestingModule).
- **Criteria**: Correct calls, error handling.

### 4.3 product.logic.service.ts
- **Tests**: Pure validations.
- **Criteria**: Valid/invalid cases pass.

### 4.4 product.state.service.ts
- **Tests**: Signals/RxJS update correctly.
- **Criteria**: State changes as expected.

## 5. Tests by File (UI)

### 5.1 product.card.component.ts
- **Tests**: @Input bindings, emitted events.
- **Criteria**: Template renders data.

### 5.2 product.list.page.ts
- **Tests**: ngOnInit loads data, interactions.
- **Criteria**: Page responds to state.

## 6. Coverage Metrics
- **Lines**: >80%.
- **Functions**: >90%.
- **Branches**: >75%.

## 7. Acceptance Criteria
- Tests pass without failures.
- Coverage reported by Karma.
- Alignment with REQUIREMENT (compilation, interactions).

---

**Status**: Approved for BUILD with tests.