---
trigger: triaje_security
description: Workflow para implementación de medidas de ciberseguridad. Asegura protección desde el diseño hasta la implementación.
status: active
use_case: SECURITY
---

# Workflow: SECURITY - Medidas de Ciberseguridad

## 1. Propósito
Este workflow define los pasos para integrar medidas de ciberseguridad en el desarrollo, siguiendo principios OWASP y asegurando protección desde el diseño inicial.

## 2. Condiciones de Activación
- **Automática:** Triaje identifica SECURITY o riesgos en REQUIREMENT.
- **Manual:** Usuario especifica "Implementar seguridad para feature X".
- **Requisito:** Riesgos identificados en REQUIREMENT.

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT con Riesgos (MODO CREATIVO)
- **Propósito:** Identificar amenazas y requerimientos de seguridad.
- **Actividades:**
  - Crear `[REQUIREMENT].security.feature-name.md`.
  - Incluir: Análisis de riesgos, amenazas identificadas, medidas requeridas.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN de Medidas (MODO CREATIVO)
- **Propósito:** Diseñar controles de seguridad.
- **Actividades:**
  - Crear `[DESIGN].security.feature-name.md`.
  - Proponer autenticación, encriptación, validaciones.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN-SECURITY (MODO DICTATORIAL)
- **Propósito:** Detallar implementación de seguridad.
- **Actividades:**
  - Crear `[PLAN-SECURITY].feature-name.md`.
  - Especificar JWT, validaciones, encriptación.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: IMPLEMENT con TRACKER (MODO DICTATORIAL)
- **Propósito:** Aplicar medidas de seguridad.
- **Actividades:**
  - Crear `[TRACKER].security.feature-name.md`.
  - Implementar controles según PLAN.
  - Probar vulnerabilidades.
- **Validación:** Tests de seguridad pasan.
- **Salida:** Seguridad implementada.

## 4. Principios OWASP
- **Autenticación segura**
- **Validación de entrada**
- **Gestión de sesiones**
- **Encriptación de datos sensibles**

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.