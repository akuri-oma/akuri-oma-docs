---
trigger: triaje_ui_skin
description: Workflow para aplicación de Look & Feel. Aplica CSS, colores y estilos visuales a UI existente.
status: active
use_case: UI_SKIN
---

# Workflow: UI_SKIN - Aplicación de Look & Feel

## 1. Propósito
Este workflow define los pasos para aplicar estilos visuales (CSS, colores, fuentes, animaciones) a una estructura UI ya construida, siguiendo el design system definido.

## 2. Condiciones de Activación
- **Automática:** Triaje clasifica como UI_SKIN.
- **Manual:** Usuario especifica "Aplicar estilos a UI de feature X".
- **Requisito:** Estructura UI básica ya implementada (UI_BUILD completado).

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir apariencia visual requerida.
- **Actividades:**
  - Crear `[REQUIREMENT].skin.feature-name.md`.
  - Referenciar design system, colores, tipografía.
- **Validación:** Aprobación del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Diseñar aplicación de estilos.
- **Actividades:**
  - Crear `[DESIGN].skin.feature-name.md`.
  - Describir paleta, componentes estilizados.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN-UI (MODO DICTATORIAL)
- **Propósito:** Detallar estilos a aplicar.
- **Actividades:**
  - Crear `[PLAN-UI].skin.feature-name.md`.
  - Especificar CSS, clases, responsive design.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: SKIN con TRACKER (MODO DICTATORIAL)
- **Propósito:** Aplicar estilos visuales.
- **Actividades:**
  - Crear `[TRACKER].skin.feature-name.md`.
  - Implementar CSS según design system.
  - Verificar consistencia visual.
- **Validación:** Apariencia conforme a design system.
- **Salida:** UI estilizada.

## 4. Reglas Específicas
- **Design System:** Seguir `*.design.md` definido.
- **Consistencia:** Mantener estilos uniformes.
- **Performance:** Optimizar CSS para carga rápida.

## 5. Referencias
- Ver `workflow.master.md`.
- Ver `akuri.04-glossary.md`.