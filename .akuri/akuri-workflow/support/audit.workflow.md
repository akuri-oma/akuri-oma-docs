---
trigger: triaje_audit
description: Workflow para auditoría de código. Revisa conformidad con guidelines y arquitectura.
status: active
use_case: AUDIT
---

# Workflow: AUDIT - Auditoría de Código

## 1. Propósito
Este workflow define los pasos para auditar código existente contra los guidelines de arquitectura, lógica y diseño definidos en la metodología Akuri.

## 2. Condiciones de Activación
- **Automática:** Triaje clasifica como AUDIT.
- **Manual:** Usuario solicita "Auditar código de feature X".
- **Requisito:** Código existente a revisar.

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir alcance de auditoría.
- **Actividades:**
  - Crear `[REQUIREMENT].audit.feature-name.md`.
  - Incluir: Áreas a auditar, criterios específicos.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: AUDIT con TRACKER (MODO DICTATORIAL)
- **Propósito:** Ejecutar revisión sistemática.
- **Actividades:**
  - Crear `[TRACKER].audit.feature-name.md`.
  - Revisar contra guidelines: arquitectura, nomenclatura, patrones.
  - Documentar hallazgos y recomendaciones.
- **Validación:** Checklist completo de áreas auditadas.
- **Salida:** Reporte de auditoría.

### Paso 3: REPORT (MODO DICTATORIAL)
- **Propósito:** Presentar hallazgos.
- **Actividades:**
  - Crear `[REPORT].audit.feature-name.md`.
  - Resumir conformidades y no conformidades.
  - Priorizar recomendaciones de mejora.
- **Validación:** Aprobación del usuario del reporte.
- **Salida:** Reporte aprobado.

## 4. Áreas de Auditoría
- **Arquitectura:** Conformidad con patrones definidos.
- **Código:** Nomenclatura, estructura, legibilidad.
- **Seguridad:** Validaciones, encriptación.
- **Tests:** Cobertura y calidad.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.