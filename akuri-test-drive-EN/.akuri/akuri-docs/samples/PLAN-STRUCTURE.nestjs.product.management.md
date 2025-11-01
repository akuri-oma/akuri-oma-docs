---
trigger: sample
description: Example PLAN-STRUCTURE for product management in NestJS, defining file architecture and layers.
---

# PLAN-STRUCTURE: Product Management (NestJS)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Structural Plan (File/Capacity Architecture)
- **Technology**: NestJS (akuri-oma)
- **Location**: `nest-backend/src/modules/product/`
- **Base Documents**:
  - [`REQUIREMENT.product-management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](nest-backend/src/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objective
Define the file structure and layers for the functionality, creating folders and base files without detailed functional content. This establishes the skeleton for the subsequent PLAN-FUNCTIONAL.

## 3. Scope
### Includes
- Root folder: `product/`
- Subfolders: `controllers/`, `services/`, `models/`
- Base files: Module, controller, service, basic DTOs, entity.

### Excludes
- Functional content (method logic, detailed validations) – covered in PLAN-FUNCTIONAL.
- Tests, advanced configuration.

## 4. Detailed Structure

### 4.1 Root Folder
- `product/`: Main functionality folder.

### 4.2 First Level Subfolders
- `controllers/`: For REST controllers.
- `services/`: For business logic services.
- `models/`: For DTOs, entities and responses.

### 4.3 Files by Layer

#### Controllers
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.controller.ts` | REST endpoints exposure | @Controller decorators, basic methods (GET, POST, etc.) |

#### Services
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.service.ts` | Business logic | Class with dependency injection, placeholder methods |

#### Models
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.entity.ts` | Database entity | TypeORM decorators (@Entity, @Column) |
| `create-product.dto.ts` | DTO for creation | Class with basic validations (@IsString, etc.) |
| `update-product.dto.ts` | DTO for update | Similar, with optional fields |
| `product.response.ts` | Response model | Interface for output payloads |
| `product.enum.ts` | Related enum | E.g., status, category (optional if applicable) |

#### Configuration
| File | Purpose | Technical Details |
| --- | --- | --- |
| `product.module.ts` | NestJS module | @Module with imports, controllers, providers |

## 5. Iterations
1. Create folders and base files.
2. Validate compilation without errors.

## 6. Acceptance Criteria
- Structure created and compilable.
- Files with basic skeletons (imports, decorators).

---

**Status**: Approved for PLAN-FUNCTIONAL.