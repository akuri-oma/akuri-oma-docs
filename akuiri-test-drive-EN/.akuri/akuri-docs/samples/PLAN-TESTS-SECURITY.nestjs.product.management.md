---
trigger: sample
description: Example PLAN-TESTS-SECURITY for product management in NestJS, defining cybersecurity tests.
---

# PLAN-TESTS-SECURITY: Product Management (NestJS)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Security Tests Plan
- **Technology**: NestJS (Jest, security tools)
- **Base Documents**:
  - [`PLAN-SECURITY.nestjs.product.management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-SECURITY.nestjs.product.management.md)

## 2. Objective
Define tests that verify compliance with security measures, preventing vulnerabilities.

## 3. Tests by Category

### 3.1 Authentication
- **Tests**: Verify guards block requests without valid JWT, expired tokens fail.
- **Tools**: Supertest to simulate requests.

### 3.2 Validation
- **Tests**: Malicious inputs (SQL injection: "'; DROP TABLE;") are rejected.
- **Criteria**: DTOs throw validation errors.

### 3.3 Error Handling
- **Tests**: Endpoints do not expose stack traces, return generic messages.

## 4. Metrics
- **Security Coverage**: 100% on critical endpoints.
- **OWASP Compliance**: Verify Top 10 risks mitigated.

## 5. Acceptance Criteria
- All tests pass without known vulnerabilities.
- Security report generated.

---

**Status**: Approved for BUILD.