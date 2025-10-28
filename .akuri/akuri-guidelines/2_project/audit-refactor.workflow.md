---
trigger: model_decision
description: Guideline orquestador que define los flujos de trabajo de AUDIT y REFACTOR bajo el Modelo de Cascada Jerárquica. Invoca una secuencia de micro-guidelines para auditar la conformidad formal (arquitectura) y luego funcional (implementación) de una funcionalidad.
status: active
use_case: AUDIT, UI_AUDIT, REFACTOR, UI_REFACTOR
---

# Flujo de Trabajo de Auditoría y Refactorización (audit-refactor.workflow.md)

## 1. Principios del Flujo de Trabajo

-   **Principio de Cascada Simple:** TÚ, como Agente Akuri, DEBES ejecutar cada paso de la auditoría en secuencia. Si un paso revela desviaciones críticas, el proceso se detiene, se genera el reporte, y no se procede a los siguientes pasos. **La conformidad formal precede a la conformidad funcional.**
-   **Secuencia `AUDIT` -> `REFACTOR`:** Una tarea de `REFACTOR` siempre debe ser precedida por una `AUDIT`. El reporte de la auditoría es el `input` para el plan de refactorización.

## 2. Flujo de Trabajo de `AUDIT`

### Fase 1: Ubicación del Feature (Entrada del Usuario)

-   **Objetivo:** Identificar sin ambigüedad el alcance de la auditoría.
-   **Tu Tarea:**
    1.  Solicita al usuario la **ruta exacta** de la carpeta de la funcionalidad a auditar.
    2.  Si el usuario proporciona una lista, crea un plan para iterar sobre cada una, generando un reporte de auditoría individual.

### Fase 2: Auditoría de Conformidad Formal (Arquitectura)

#### Paso 2.1: Validación de Macro-Arquitectura
-   **Objetivo:** Verificar si la funcionalidad está en la ubicación correcta.
-   **Acción:** Invoca el `guideline` `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Criterio de Éxito:** La carpeta debe estar en una "zona" permitida (ej., `subsystem/`, `modules/`).

#### Paso 2.2: Validación del Patrón Arquitectónico
-   **Objetivo:** Verificar si la estructura interna sigue un patrón aprobado.
-   **Acción:** Invoca el `guideline` `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Criterio de Éxito:** La estructura de carpetas (`models/`, `services/`, etc.) debe coincidir con un patrón definido (`STANDARD`, `COMPLEX`, etc.).

#### Paso 2.3: Validación de Nomenclatura de Archivos
-   **Objetivo:** Verificar si todos los archivos tienen el prefijo y la convención correcta.
-   **Acción:** Invoca el `guideline` `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Criterio de Éxito:** Todos los archivos deben cumplir las reglas de prefijos y sufijos.

**Punto de Control:** Si se encuentran desviaciones críticas en estos pasos, se genera el reporte y el proceso de auditoría finaliza aquí.

### Fase 3: Auditoría de Conformidad Funcional (Implementación)

#### Paso 3.1: Validación de Adherencia Tecnológica
-   **Objetivo:** Verificar que solo se usan librerías y tecnologías autorizadas.
-   **Acción:** Invoca el `project.manifest.md` y compara las importaciones del código contra las tecnologías autorizadas.
-   **Criterio de Éxito:** No deben existir importaciones de librerías no autorizadas.

#### Paso 3.2: Validación de Patrones de Implementación
-   **Objetivo:** Verificar si el código sigue los patrones de la metodología.
-   **Acción:** Invoca los `guidelines` de implementación relevantes de la carpeta `3_technology/[tech]/`.
-   **Criterio de Éxito:** El código debe seguir los patrones (ej., controladores delgados, separación API/Action, sintaxis de `@for`, etc.).

### Fase 4: Generación del Reporte

-   **Objetivo:** Consolidar todos los hallazgos.
-   **Tu Tarea:** Genera el documento `[AUDIT].[nombre-feature].md`, agrupando las desviaciones por cada paso de la cascada.

## 3. Flujo de Trabajo de `REFACTOR`

### Fase 1: Planificación (`PLAN`)
-   **Objetivo:** Crear un plan de acción basado en un reporte de auditoría.
-   **Tu Tarea:**
    1.  Usa un reporte `[AUDIT]...md` como entrada.
    2.  Diferencia entre `REFACTOR` (cambios internos) y `REMAKE` (cambios en la API pública). Si es `REMAKE`, detén el flujo y propón un `DESIGN`.
    3.  Crea un documento `[PLAN].[refactor]-[nombre-feature].md` que liste las tareas de corrección en un orden lógico.
    4.  Solicita la aprobación del usuario para este plan.

### Fase 2: Ejecución (`BUILD`)
-   **Objetivo:** Aplicar las correcciones.
-   **Tu Tarea:** **SOLO después de la aprobación del plan**, ejecuta las tareas de modificación de código.

### Fase 3: Verificación
-   **Objetivo:** Confirmar que todas las desviaciones han sido corregidas.
-   **Tu Tarea:** Ejecuta una nueva `AUDIT` sobre la funcionalidad refactorizada y presenta los resultados.