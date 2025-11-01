---
trigger: always_on
description: Documento maestro de workflows en la Metodología Akuri-OMA. Lista todos los workflows disponibles, reglas de activación y mapeo con triaje.
status: active
use_case: [CLARIFY, DESIGN, PLAN, BUILD, AUDIT, REFACTOR, UI_BUILD, UI_SKIN, UI_AUDIT, DEBUG]
---

# Workflows Maestros de la Metodología Akuri-OMA

## 1. Propósito
Este documento es la **fuente única de verdad** para todos los workflows disponibles en Akuri-OMA. Define cómo se activan los workflows (automáticamente via triaje o manualmente por usuario) y garantiza que cada tarea siga un flujo estructurado para prevenir escritura de código sin autorización.

## 2. Reglas Generales de Activación
- **Automática:** El triaje clasifica la solicitud del usuario y mapea automáticamente al workflow correspondiente.
- **Manual:** El usuario puede especificar explícitamente: "Quiero aplicar workflow BUILD para feature X".
- **Enforcement:** Si no se puede clasificar, pedir aclaración. Nunca proceder sin workflow identificado.

## 3. Lista de Workflows Disponibles

### 3.1 Workflows Core (Lógica y Arquitectura)
- **`BUILD`**: Construcción de lógica de negocio y servicios.
  - **Archivo:** `core/build.workflow.md`
  - **Activación:** Triaje = BUILD o usuario lo especifica.
  - **Pasos:** REQUIREMENT → DESIGN → PLAN → BUILD con TRACKER.
  - **Modo:** CREATIVO para exploración, DICTATORIAL para ejecución.

- **`REFACTOR`**: Mejora de estructura interna del código.
  - **Archivo:** `core/refactor.workflow.md`
  - **Activación:** Triaje = REFACTOR.
  - **Pasos:** REQUIREMENT → DESIGN → PLAN → REFACTOR con TRACKER.

- **`SECURITY`**: Implementación de medidas de ciberseguridad.
  - **Archivo:** `core/security.workflow.md`
  - **Activación:** Triaje = SECURITY o identificado en REQUIREMENT.
  - **Pasos:** REQUIREMENT con riesgos → DESIGN de medidas → PLAN-SECURITY → IMPLEMENT con TRACKER.

- **`TESTS`**: Desarrollo de pruebas unitarias.
  - **Archivo:** `core/tests.workflow.md`
  - **Activación:** Triaje = TESTS o parte de BUILD.
  - **Pasos:** REQUIREMENT con criterios → DESIGN de estrategia → PLAN-TESTS → IMPLEMENT pruebas con TRACKER.

### 3.2 Workflows UI (Look & Feel - Frontend)
- **`BUILD-LOGIC`**: Construcción de capa lógica (services, models, state, routes).
  - **Archivo:** `core/build-logic.workflow.md`
  - **Activación:** Triaje identifica lógica frontend o usuario lo especifica.
  - **Pasos:** REQUIREMENT → DESIGN → PLAN → BUILD-LOGIC con TRACKER.
  - **Alcance:** Solo `services/`, `models/`, rutas - NADA visual.

- **`BUILD-UI`**: Construcción de capa visual (presentation/pages/components).
  - **Archivo:** `ui/build-ui.workflow.md`
  - **Activación:** Triaje identifica UI frontend o usuario lo especifica.
  - **Pasos:** REQUIREMENT → DESIGN → PLAN-UI → BUILD-UI con TRACKER.
  - **Alcance:** Solo `presentation/` - lógica ya existe.

- **`UI_SKIN`**: Aplicación de Look & Feel (CSS, colores).
  - **Archivo:** `ui/ui-skin.workflow.md`
  - **Activación:** Triaje = UI_SKIN.
  - **Pasos:** REQUIREMENT → DESIGN → PLAN-UI → SKIN con TRACKER.

### 3.3 Workflows Support (Auditoría y Depuración)
- **`AUDIT`**: Revisión de código contra guidelines.
  - **Archivo:** `support/audit.workflow.md`
  - **Activación:** Triaje = AUDIT.
  - **Pasos:** REQUIREMENT → AUDIT con TRACKER → REPORT.

- **`DEBUG`**: Depuración de errores.
  - **Archivo:** `support/debug.workflow.md`
  - **Activación:** Triaje = DEBUG_*.
  - **Pasos:** REQUIREMENT → DEBUG con TRACKER → FIX.

## 4. Mapeo de Triaje a Workflows
- `CLARIFY` → Pedir más información (sin workflow específico).
- `RESEARCH` → Investigación (sin workflow específico).
- `INVENTORY` → Lista de características (sin workflow específico).
- `DESIGN` → Diseño conceptual (sin workflow específico).
- `REQUIREMENT` → Definición de requisitos (sin workflow específico).
- `PLAN` → Planificación (sin workflow específico).
- `BUILD` → `core/build.workflow.md` (backend) o `core/build-logic.workflow.md` (frontend lógica)
- `BUILD-LOGIC` → `core/build-logic.workflow.md` (frontend - capa lógica)
- `BUILD-UI` → `ui/build-ui.workflow.md` (frontend - capa visual)
- `AUDIT` → `support/audit.workflow.md`
- `REFACTOR` → `core/refactor.workflow.md`
- `UI_BUILD` → `ui/build-ui.workflow.md` (legacy - usar BUILD-UI)
- `UI_SKIN` → `ui/ui-skin.workflow.md`
- `UI_AUDIT` → `support/audit.workflow.md` (con foco UI)
- `DEBUG_*` → `support/debug.workflow.md`

## 5. Reglas de Enforcement
- **Triaje Obligatorio:** Toda respuesta inicial incluye sección "## Triaje Obligatorio" con clasificación.
- **Bloqueo de Código:** Si workflow requiere REQUIREMENT previo y no existe, responder: "Workflow no autorizado. Crear REQUIREMENT primero."
- **Modos Enforced:** CREATIVO solo para exploración, DICTATORIAL solo para ejecución.
- **TRACKER Obligatorio:** Todo BUILD/REFACTOR requiere TRACKER para seguimiento.

## 6. Referencias
- Ver `akuri.01-global-rules.md` para reglas operativas.
- Ver `akuri.04-glossary.md` para definiciones de artefactos.
- Ver `akuri.workflow.overview.md` para diagrama general.