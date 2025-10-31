---
trigger: sample
description: Ejemplo de PLAN-TESTS para gestión de productos en Angular, definiendo pruebas unitarias para lógica y UI.
---

# PLAN-TESTS: Gestión de Productos (Angular)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan de Pruebas Unitarias (Lógica + UI)
- **Tecnología**: Angular (Jasmine/Karma)
- **Documentos Base**:
  - [`REQUIREMENT.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product.management.md)
  - [`PLAN-FUNCTIONAL.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL.angular.product.management.md)
  - [`PLAN-FUNCTIONAL-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-UI.angular.product.management.md)

## 2. Objetivo
Definir pruebas unitarias para lógica y UI, verificando criterios de aceptación: compilación sin errores, interacciones funcionales, cobertura >80%.

## 3. Framework de Pruebas
- **Jasmine/Karma**: Para tests unitarios.
- **Angular Testing Utilities**: Para componentes y servicios.

## 4. Pruebas por Archivo (Lógica)

### 4.1 product.entity.ts
- **Pruebas**: Validar interfaces (tipos correctos).
- **Criterios**: Cobertura 100% en propiedades.

### 4.2 product.api.service.ts
- **Pruebas**: Métodos HTTP con mocks (HttpClientTestingModule).
- **Criterios**: Llamadas correctas, manejo de errores.

### 4.3 product.logic.service.ts
- **Pruebas**: Validaciones puras.
- **Criterios**: Casos válidos/inválidos pasan.

### 4.4 product.state.service.ts
- **Pruebas**: Signals/RxJS actualizan correctamente.
- **Criterios**: Estado cambia como esperado.

## 5. Pruebas por Archivo (UI)

### 5.1 product.card.component.ts
- **Pruebas**: @Input bindings, eventos emitidos.
- **Criterios**: Template renderiza datos.

### 5.2 product.list.page.ts
- **Pruebas**: ngOnInit carga datos, interacciones.
- **Criterios**: Página responde a estado.

## 6. Métricas de Cobertura
- **Líneas**: >80%.
- **Funciones**: >90%.
- **Ramas**: >75%.

## 7. Criterios de Aceptación
- Tests pasan sin fallos.
- Cobertura reportada por Karma.
- Alineación con REQUIREMENT (compilación, interacciones).

---

**Estado**: Aprobado para BUILD con tests.