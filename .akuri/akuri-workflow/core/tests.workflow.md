---
trigger: triaje_tests
description: Workflow para desarrollo de pruebas unitarias. Asegura cobertura y calidad del código.
status: active
use_case: TESTS
---

# Workflow: TESTS - Desarrollo de Pruebas Unitarias

## 1. Propósito
Este workflow define los pasos para crear y mantener pruebas unitarias que validen la funcionalidad del código y prevengan regresiones.

## 2. Condiciones de Activación
- **Automática:** Parte de BUILD o triaje TESTS.
- **Manual:** Usuario solicita "Crear tests para feature X".
- **Requisito:** Código existente o en desarrollo.

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT con Criterios (MODO CREATIVO)
- **Propósito:** Definir qué probar y criterios de calidad.
- **Actividades:**
  - Crear `[REQUIREMENT].tests.feature-name.md`.
  - Incluir: Escenarios a probar, métricas de cobertura.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN de Estrategia (MODO CREATIVO)
- **Propósito:** Planear approach de testing.
- **Actividades:**
  - Crear `[DESIGN].tests.feature-name.md`.
  - Definir frameworks, mocks, casos edge.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN-TESTS (MODO DICTATORIAL)
- **Propósito:** Detallar pruebas específicas.
- **Actividades:**
  - Crear `[PLAN-TESTS].feature-name.md`.
  - Listar test cases, assertions, fixtures.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: IMPLEMENT Pruebas con TRACKER (MODO DICTATORIAL)
- **Propósito:** Escribir y ejecutar tests.
- **Actividades:**
  - Crear `[TRACKER].tests.feature-name.md`.
  - Implementar tests según PLAN.
  - Ejecutar suite, verificar cobertura.
- **Validación:** Tests pasan, cobertura mínima alcanzada.
- **Salida:** Tests implementados.

## 4. Mejores Prácticas
- **Cobertura mínima:** 80% líneas, 90% ramas.
- **Tests independientes:** No dependen entre sí.
- **Mocks/Stubs:** Para dependencias externas.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.