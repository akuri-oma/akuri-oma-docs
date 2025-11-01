---
trigger: example
description: Ejemplo completo de aplicación del workflow BUILD para gestión de productos.
status: active
---

# [EXAMPLE] BUILD Workflow - Gestión de Productos

## Contexto
Este ejemplo muestra la aplicación completa del workflow BUILD para implementar una funcionalidad de gestión de productos (CRUD) en el backend NestJS.

## Paso 1: REQUIREMENT (MODO CREATIVO)
```
[REQUIREMENT] product-management

### 1. Propósito
Implementar gestión completa de productos para el sistema de inventario.

### 2. Alcance
- Incluye: Crear, Leer, Actualizar, Eliminar productos
- Incluye: Validaciones básicas (nombre requerido, precio > 0)
- Excluye: Gestión de categorías, imágenes, inventario avanzado

### 3. Limitaciones
- Base de datos PostgreSQL
- Autenticación JWT requerida

### 4. Criterios de Aceptación
- API RESTful completa con 4 endpoints
- Validaciones implementadas
- Tests unitarios con 80% cobertura

### 5. Requisitos de Seguridad
- Autenticación requerida para todas las operaciones
- Validación de entrada para prevenir inyección SQL
```

## Paso 2: DESIGN (MODO CREATIVO)
```
[DESIGN] product-management

### 1. Entorno de Ejecución
- Backend: NestJS con TypeORM
- Base de datos: PostgreSQL
- Autenticación: JWT

### 2. Explicación de la Solución
Usaremos el patrón Repository de TypeORM para abstracción de datos, con servicios para lógica de negocio y controladores para endpoints REST.

### 3. Resolución de Problemas
- CRUD básico resuelto con operaciones estándar
- Validaciones implementadas con class-validator

### 4. Garantías de Criterios
- Endpoints implementados según OpenAPI spec
- Tests unitarios cubrirán todas las rutas
```

## Paso 3: PLAN (MODO DICTATORIAL)
```
[PLAN] product-management

### Estructura de Archivos
- src/modules/product/
  - product.entity.ts
  - product.service.ts
  - product.controller.ts
  - product.module.ts
  - dto/create-product.dto.ts
  - dto/update-product.dto.ts

### Funcionalidad por Archivo
- product.entity.ts: Modelo con campos id, name, price, description
- product.service.ts: Métodos CRUD con validaciones
- product.controller.ts: Endpoints GET, POST, PUT, DELETE
- DTOs: Validaciones con class-validator

### Tests
- product.service.spec.ts: Tests unitarios para lógica
- product.controller.spec.ts: Tests de integración para endpoints
```

## Paso 4: BUILD con TRACKER (MODO DICTATORIAL)
```
[TRACKER] product-management

### Checklist de Tareas
- [x] Crear product.entity.ts
- [x] Crear DTOs con validaciones
- [x] Implementar product.service.ts
- [x] Crear product.controller.ts
- [x] Registrar en product.module.ts
- [x] Crear tests unitarios
- [x] Ejecutar tests y verificar cobertura
- [x] Probar endpoints manualmente

### Notas de Implementación
- Usado @InjectRepository() para inyección de repositorio
- Implementadas validaciones con @IsNotEmpty(), @IsNumber()
- Tests usan Jest con mocks para repositorio
```

## Artefactos Generados
- Código funcional en src/modules/product/
- Tests completos con cobertura >80%
- Documentación API generada automáticamente

## Lecciones Aprendidas
- Importante definir DTOs antes de servicios
- Tests deben escribirse en paralelo al código
- Validaciones de entrada previenen muchos bugs

Este ejemplo demuestra cómo el workflow BUILD garantiza implementación completa y testeada siguiendo pasos estructurados.