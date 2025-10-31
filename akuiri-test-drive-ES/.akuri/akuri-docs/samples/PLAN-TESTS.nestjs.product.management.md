---
trigger: sample
description: Ejemplo de PLAN-TESTS para gestión de productos en NestJS, definiendo pruebas unitarias alineadas con REQUIREMENT.
---

# PLAN-TESTS: Gestión de Productos (NestJS)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan de Pruebas Unitarias
- **Tecnología**: NestJS (Jest)
- **Documentos Base**:
  - [`REQUIREMENT.product.management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product.management.md)
  - [`PLAN-FUNCTIONAL.nestjs.product.management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-FUNCTIONAL.nestjs.product.management.md)

## 2. Objetivo
Definir pruebas unitarias que verifiquen criterios de aceptación: endpoints responden correctamente, validaciones pasan, cobertura >80%, sin errores en logs.

## 3. Framework de Pruebas
- **Jest**: Para ejecución de tests.
- **Supertest**: Para pruebas de endpoints HTTP.

## 4. Pruebas por Archivo

### 4.1 product.entity.ts
- **Pruebas**: Validar decoradores TypeORM (id auto-generado, columnas correctas).
- **Criterios**: Cobertura 100% en propiedades.

### 4.2 create-product.dto.ts
- **Pruebas**: Validar validaciones (@IsString falla con números, @IsNumber positivo).
- **Criterios**: DTOs inválidos rechazan, válidos pasan.

### 4.3 product.controller.ts
- **Pruebas**: Endpoints GET/POST/PUT/DELETE responden con status 200/201, manejan errores 400/404.
- **Criterios**: Respuestas tipadas, llamadas a service correctas.

### 4.4 product.service.ts
- **Pruebas**: Métodos findAll/create/update/delete con mocks de repo.
- **Criterios**: Lógica correcta, excepciones lanzadas.

## 5. Métricas de Cobertura
- **Líneas**: >80%.
- **Funciones**: >90%.
- **Ramas**: >75%.

## 6. Criterios de Aceptación
- Tests pasan sin fallos.
- Cobertura reportada por Jest.
- Alineación con REQUIREMENT (endpoints funcionales, validaciones).

---

**Estado**: Aprobado para BUILD con tests.