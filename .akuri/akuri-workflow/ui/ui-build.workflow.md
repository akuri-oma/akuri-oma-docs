---
trigger: triaje_ui_build
description: [LEGACY] Workflow anterior para UI. Usar BUILD-LOGIC + BUILD-UI para separación lógica vs visual.
status: deprecated
use_case: UI_BUILD
---

# Workflow: UI_BUILD - [DEPRECATED]

## ⚠️ **ESTE WORKFLOW ESTÁ DEPRECIADO**

**No usar para nuevos proyectos.** Este workflow ha sido reemplazado por la separación clara entre:

- **`BUILD-LOGIC`**: Para capa lógica (services, models, state, routes)
- **`BUILD-UI`**: Para capa visual (presentation/pages/components)

## 1. Propósito Original (Obsoleto)
Este workflow definía los pasos para crear la estructura visual básica de una interfaz de usuario, incluyendo HTML y conexiones funcionales iniciales, sin aplicar estilos visuales.

## 2. Nueva Implementación Recomendada

Para nuevos proyectos, usar la secuencia correcta:

1. **`BUILD-LOGIC`**: Construir capa lógica completa
2. **`BUILD-UI`**: Construir capa visual conectada a lógica existente
3. **`UI_SKIN`**: Aplicar design system

## 2. Condiciones de Activación (Legacy)
- **Automática:** Triaje clasifica como UI_BUILD.
- **Manual:** Usuario especifica "Construir UI para feature X".
- **Requisito:** Backend APIs disponibles (ver HANDOVER).

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir estructura visual requerida.
- **Actividades:**
  - Crear `[REQUIREMENT].ui.feature-name.md`.
  - Incluir: Componentes, layouts, interacciones básicas.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Diseñar estructura conceptual.
- **Actividades:**
  - Crear `[DESIGN].ui.feature-name.md`.
  - Describir componentes, navegación, estados.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN-UI (MODO DICTATORIAL)
- **Propósito:** Blueprint de componentes.
- **Actividades:**
  - Crear `[PLAN-STRUCTURE-UI].feature-name.md`.
  - Definir archivos HTML, componentes, bindings.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: BUILD-UI con TRACKER (MODO DICTATORIAL)
- **Propósito:** Implementar estructura visual.
- **Actividades:**
  - Crear `[TRACKER].ui.feature-name.md`.
  - Crear componentes HTML básicos.
  - Conectar con servicios backend.
- **Validación:** Estructura funcional, conexiones básicas.
- **Salida:** UI estructura implementada.

## 4. Reglas Específicas
- **Separación de responsabilidades:** Lógica en servicios, presentación en componentes.
- **Accesibilidad básica:** Estructura semántica HTML.
- **Responsive:** Considerar diferentes tamaños.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.