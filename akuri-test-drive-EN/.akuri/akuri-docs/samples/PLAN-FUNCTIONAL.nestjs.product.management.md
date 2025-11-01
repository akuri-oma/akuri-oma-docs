---
trigger: sample
description: Example PLAN-FUNCTIONAL for product management in NestJS, detailing content of each file.
---

# PLAN-FUNCTIONAL: Product Management (NestJS)

## 1. General Information
- **Functionality**: Product Management
- **Type**: Functional Plan (File Contents)
- **Technology**: NestJS (akuri-oma)
- **Base Documents**:
  - [`PLAN-STRUCTURE.nestjs.product-management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-STRUCTURE.nestjs.product-management.md)

## 2. Objective
Detail the exact content of each file defined in PLAN-STRUCTURE, including technologies, imports, external modules, methods/objects/functions, and naming conventions. Allows precise reconstruction.

## 3. Details per File

### 3.1 product.entity.ts
- **Technologies**: TypeORM (import @Entity, @Column, @PrimaryGeneratedColumn).
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Properties: id (number), name (string), description (string), price (number), stock (number).
  - Conventions: PascalCase for class, camelCase for properties.

### 3.2 create-product.dto.ts
- **Technologies**: class-validator (@IsString, @IsNumber), class-transformer.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Properties: name (@IsString), price (@IsNumber), description (@IsString optional).
  - Conventions: PascalCase for class, camelCase for properties.

### 3.3 update-product.dto.ts
- **Technologies**: class-validator, Partial (from TypeScript).
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Extends create-product.dto with Partial.
  - Properties: same as create, optional.
  - Conventions: PascalCase for class.

### 3.4 product.response.ts
- **Technologies**: TypeScript interfaces.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Interface: ProductResponse { id: number; name: string; price: number; }.
  - Conventions: PascalCase for interface.

### 3.5 product.module.ts
- **Technologies**: @Module from NestJS.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - @Module({ controllers: [ProductController], providers: [ProductService], imports: [TypeOrmModule.forFeature([ProductEntity])] }).
  - Conventions: PascalCase for module.

### 3.6 product.controller.ts
- **Technologies**: @Controller, @Get/@Post/@Put/@Delete from NestJS.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Methods: getProducts(), createProduct(dto), updateProduct(id, dto), deleteProduct(id).
  - Conventions: camelCase for methods.

### 3.7 product.service.ts
- **Technologies**: @Injectable from NestJS, Repository from TypeORM.
- **External Modules**: None.
- **Special Files**: None.
- **Methods/Objects/Functions**:
  - Methods: findAll(), create(dto), update(id, dto), delete(id).
  - Injection: constructor(private repo: Repository<ProductEntity>).
  - Conventions: camelCase for methods.

## 4. Specific Technologies
- **TypeORM**: For entities and repositories (install if not in platform).
- **class-validator/class-transformer**: For DTOs (install if not present).

## 5. Acceptance Criteria
- Files contain exactly the listed elements.
- Compilation without errors.
- Naming conventions respected.

---

**Status**: Approved for BUILD.