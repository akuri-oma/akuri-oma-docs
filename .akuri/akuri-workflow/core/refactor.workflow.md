---
trigger: triaje_refactor
description: Workflow para refactorización de código existente. Mejora estructura interna sin cambiar funcionalidad externa.
status: active
use_case: REFACTOR
---

# Workflow: REFACTOR - Mejora de Estructura Interna

## 1. Propósito
Este workflow define los pasos para refactorizar código existente, mejorando su estructura interna, legibilidad y mantenibilidad sin alterar la funcionalidad externa o comportamiento observable.

## 2. Condiciones de Activación
- **Automática:** Triaje clasifica como REFACTOR.
- **Manual:** Usuario especifica "Refactorizar feature X".
- **Requisito:** Código existente a refactorizar debe estar identificado.

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir qué aspectos del código necesitan mejora.
- **Actividades:**
  - Crear `[REQUIREMENT].refactor.feature-name.md`.
  - Incluir: Problemas actuales, objetivos de mejora, alcance, criterios de no-regresión.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Proponer cambios estructurales.
- **Actividades:**
  - Crear `[DESIGN].refactor.feature-name.md`.
  - Describir mejoras propuestas, impacto, riesgos.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN (MODO DICTATORIAL)
- **Propósito:** Detallar cambios exactos.
- **Actividades:**
  - Crear `[PLAN].refactor.feature-name.md`.
  - Listar archivos a modificar, cambios específicos.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: REFACTOR con TRACKER (MODO DICTATORIAL)
- **Propósito:** Aplicar cambios siguiendo PLAN.
- **Actividades:**
  - Crear `[TRACKER].refactor.feature-name.md`.
  - Ejecutar cambios paso a paso.
  - Ejecutar tests para asegurar no-regresión.
- **Validación:** Tests pasan, TRACKER completo.
- **Salida:** Código refactorizado.

## 4. Reglas Específicas
- **No cambiar funcionalidad:** Solo estructura interna.
- **Tests obligatorios:** Asegurar no-regresión.
- **Commits pequeños:** Para facilitar rollback si necesario.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.