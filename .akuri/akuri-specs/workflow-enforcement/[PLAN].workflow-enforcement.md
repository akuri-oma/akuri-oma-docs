---
trigger: always_on
description: Blueprint técnico rígido para la creación de la carpeta akuri-workflow y sus contenidos, definiendo explícitamente workflows con triaje enforced para prevenir escritura de código sin autorización.
status: active
use_case: DESIGN, PLAN, BUILD
---

# [PLAN] Workflow Enforcement - Creación de akuri-workflow

## 1. Propósito
Crear la carpeta `.akuri/akuri-workflow/` como repositorio central de definiciones de workflows, integrando triaje explícito y enforcement para garantizar que solo se escriba código dentro de flujos autorizados (REQUIREMENT → DESIGN → PLAN → BUILD con TRACKER).

## 2. Alcance
- Crear estructura de carpetas en `.akuri/akuri-workflow/`.
- Definir documentos maestros y específicos para cada workflow.
- Integrar mecanismos de enforcement en triaje y modos operativos.
- Actualizar referencias en documentos existentes (`akuri.01-global-rules.md`, etc.).

## 3. Limitaciones
- No modificar código existente; solo crear documentos y estructura.
- Mantener compatibilidad con estructura actual de `.akuri`.
- Usar convenciones de nomenclatura Akuri-OMA.

## 4. Criterios de Aceptación
- Carpeta `akuri-workflow` creada con estructura completa.
- Documentos workflow definidos y referenciados.
- Triaje enforced implementado conceptualmente.
- Usuario aprueba el PLAN antes de BUILD.

## 5. Estructura de akuri-workflow (Blueprint Arquitectónico)

### 5.1 Estructura de Carpetas
```
.akuri/akuri-workflow/
├── core/                    # Workflows principales (BUILD, REFACTOR)
├── ui/                      # Workflows de UI (UI_BUILD, UI_SKIN)
├── support/                 # Workflows de soporte (AUDIT, DEBUG)
├── examples/                # Ejemplos aplicados de workflows
├── templates/               # Plantillas para documentos
└── workflow.master.md       # Documento maestro de workflows
```

### 5.2 Documentos a Crear

#### Documentos Maestros
- `workflow.master.md`: Lista de workflows, mapeo de triaje, reglas generales.

#### Documentos por Workflow (en subcarpetas)
- `core/build.workflow.md`: Workflow para BUILD (lógica backend/frontend).
- `core/refactor.workflow.md`: Workflow para REFACTOR.
- `core/security.workflow.md`: Workflow para SECURITY (medidas de ciberseguridad).
- `core/tests.workflow.md`: Workflow para TESTS (pruebas unitarias).
- `ui/ui-build.workflow.md`: Workflow para UI_BUILD.
- `ui/ui-skin.workflow.md`: Workflow para UI_SKIN.
- `support/audit.workflow.md`: Workflow para AUDIT.
- `support/debug.workflow.md`: Workflow para DEBUG.

#### Documentos de Enforcement
- `triage.enforcement.md`: Reglas para triaje obligatorio y visible.
- `mode.enforcement.md`: Reglas para modos CREATIVO/DICTATORIAL.

#### Templates y Ejemplos
- `templates/requirement.template.md`: Plantilla para REQUIREMENT.
- `templates/design.template.md`: Plantilla para DESIGN.
- `examples/build.product-management.example.md`: Ejemplo completo de BUILD aplicado.

## 6. Contenido Detallado por Documento

### 6.1 workflow.master.md
- **Propósito:** Fuente única de verdad para workflows disponibles.
- **Contenido:**
  - Lista de workflows con descripción.
  - Mapeo de triaje: "Si triaje = BUILD → aplicar core/build.workflow.md".
  - Reglas de activación (automática via triaje o manual por usuario).
  - Referencias a enforcement.

### 6.2 Workflows Específicos (Ejemplo: core/build.workflow.md)
- **Propósito:** Definir pasos obligatorios para BUILD.
- **Contenido:**
  - Descripción del workflow.
  - Condiciones de activación.
  - Pasos numerados: REQUIREMENT (CREATIVO) → DESIGN (CREATIVO) → PLAN (DICTATORIAL) → BUILD con TRACKER (DICTATORIAL).
  - Puntos de control: Aprobación requerida en cada paso.
  - Modos por paso.

### 6.3 Workflows de Seguridad y Tests (Ejemplos)
- **core/security.workflow.md:** Workflow para SECURITY - Pasos: REQUIREMENT con riesgos identificados → DESIGN de medidas → PLAN-SECURITY → IMPLEMENT con TRACKER.
- **core/tests.workflow.md:** Workflow para TESTS - Pasos: REQUIREMENT con criterios → DESIGN de estrategia → PLAN-TESTS → IMPLEMENT pruebas con TRACKER.

### 6.3 triage.enforcement.md
- **Propósito:** Hacer triaje obligatorio y visible.
- **Contenido:**
  - Formato estandarizado para triaje.
  - Regla: Clasificar antes de cualquier acción.
  - Integración con workflows.
  - Bloqueo: Si no clasificable, pedir aclaración.

### 6.4 mode.enforcement.md
- **Propósito:** Reglas para modos operativos.
- **Contenido:**
  - CREATIVO: Solo exploración (REQUIREMENT, DESIGN).
  - DICTATORIAL: Solo ejecución (PLAN, BUILD).
  - Transición: Solo con aprobación.

## 7. Mecanismos de Enforcement

### 7.1 Triaje Obligatorio
- En cada respuesta inicial: Sección "## Triaje Obligatorio" con formato estandarizado.
- Si BUILD/REFACTOR: Verificar documentos previos; si no, "No autorizado. Crear REQUIREMENT".

### 7.2 Modos Enforced
- CREATIVO: No escribir código.
- DICTATORIAL: Solo con alcance explícito.

### 7.3 Seguimiento
- TRACKER global en `.akuri/akuri-work/tracker.global.md` para estado de flujos.
- Checklist por sesión.

## 8. Integración con Estructura Existente
- Actualizar `akuri.01-global-rules.md`: Agregar referencia a `akuri-workflow`.
- Referencia en `akuri.workflow.overview.md`.
- Seguir `akuri.05-project-structure.md`.

## 9. Plan de Construcción (BUILD)
- Crear carpetas y documentos en orden: maestro → core → ui → support → templates/examples.
- Usar TRACKER para seguimiento.
- Validar contra criterios de aceptación.