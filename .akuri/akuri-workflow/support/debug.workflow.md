---
trigger: triaje_debug
description: Workflow para depuración de errores. Sistemático troubleshooting de issues en código.
status: active
use_case: DEBUG
---

# Workflow: DEBUG - Depuración de Errores

## 1. Propósito
Este workflow define los pasos para identificar, diagnosticar y resolver errores en el código de manera sistemática y documentada.

## 2. Condiciones de Activación
- **Automática:** Triaje clasifica como DEBUG_*.
- **Manual:** Usuario reporta "Error en feature X, debuggear".
- **Requisito:** Error reproducible identificado.

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir problema a resolver.
- **Actividades:**
  - Crear `[REQUIREMENT].debug.feature-name.md`.
  - Incluir: Descripción del error, pasos para reproducir.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DIAGNOSTIC (MODO DICTATORIAL)
- **Propósito:** Investigar causa raíz.
- **Actividades:**
  - Crear `[TRACKER].debug.feature-name.md`.
  - Revisar logs, stack traces, código relacionado.
  - Identificar hipótesis de causa.
- **Validación:** Hipótesis documentadas.
- **Salida:** Diagnóstico preliminar.

### Paso 3: FIX con TRACKER (MODO DICTATORIAL)
- **Propósito:** Implementar solución.
- **Actividades:**
  - Aplicar corrección basada en diagnóstico.
  - Probar fix en entorno controlado.
  - Verificar no-regresión.
- **Validación:** Error resuelto, tests pasan.
- **Salida:** Código corregido.

### Paso 4: VERIFY (MODO DICTATORIAL)
- **Propósito:** Confirmar resolución completa.
- **Actividades:**
  - Ejecutar tests completos.
  - Validar en diferentes entornos.
  - Documentar solución.
- **Validación:** Usuario confirma resolución.
- **Salida:** Debug completado.

## 4. Técnicas de Debug
- **Reproducción:** Aislar condiciones del error.
- **Logging:** Añadir logs temporales si necesario.
- **Herramientas:** Usar debuggers, profilers según tecnología.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.