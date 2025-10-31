---
trigger: sample
description: Example PLAN-TESTS for product management in NestJS, defining unit tests aligned with REQUIREMENT.
---

# PLAN-TESTS: Product Management (NestJS)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Unit Tests Plan
- **Technology**: NestJS (Jest)
- **Base Documents**:
  - [`REQUIREMENT.product.management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product.management.md)
  - [`PLAN-FUNCTIONAL.nestjs.product.management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-FUNCTIONAL.nestjs.product.management.md)

## 2. Objective
Define unit tests that verify acceptance criteria: endpoints respond correctly, validations pass, coverage >80%, no errors in logs.

## 3. Testing Framework
- **Jest**: For test execution.
- **Supertest**: For HTTP endpoint tests.

## 4. Tests by File

### 4.1 product.entity.ts
- **Tests**: Validate TypeORM decorators (auto-generated id, correct columns).
- **Criteria**: 100% coverage on properties.

### 4.2 create-product.dto.ts
- **Tests**: Validate validations (@IsString fails with numbers, @IsNumber positive).
- **Criteria**: Invalid DTOs reject, valid ones pass.

### 4.3 product.controller.ts
- **Tests**: GET/POST/PUT/DELETE endpoints respond with 200/201 status, handle 400/404 errors.
- **Criteria**: Typed responses, correct service calls.

### 4.4 product.service.ts
- **Tests**: findAll/create/update/delete methods with repo mocks.
- **Criteria**: Correct logic, exceptions thrown.

## 5. Coverage Metrics
- **Lines**: >80%.
- **Functions**: >90%.
- **Branches**: >75%.

## 6. Acceptance Criteria
- Tests pass without failures.
- Coverage reported by Jest.
- Alignment with REQUIREMENT (functional endpoints, validations).

---

**Status**: Approved for BUILD with tests.