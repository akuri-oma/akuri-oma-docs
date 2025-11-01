---
trigger: model_decision
description: Guideline orquestador que define el flujo de trabajo de AUDIT bajo el Modelo de Cascada Jerárquica. Invoca una secuencia de micro-guidelines para auditar la conformidad formal y luego funcional de una funcionalidad.
status: active
use_case: AUDIT, UI_AUDIT
---

# Flujo de Trabajo de Auditoría (audit.workflow.md)

## 1. Principio de Cascada Simple

Este flujo de trabajo sigue un modelo de cascada estricto. TÚ, como Agente Akuri, DEBES ejecutar cada paso en secuencia. Si un paso revela desviaciones críticas, el proceso de auditoría se detiene, se genera el reporte, y no se procede a los siguientes pasos hasta que las correcciones sean realizadas. **La conformidad formal precede a la conformidad funcional.**

## 2. El Flujo de Trabajo de Auditoría

### Fase 1: Ubicación del Feature (Entrada del Usuario)

-   **Objetivo:** Identificar sin ambigüedad el alcance de la auditoría.
-   **Tu Tarea:**
    1.  Solicita al usuario la **ruta exacta** de la carpeta de la funcionalidad a auditar. No debes buscarla por tu cuenta.
    2.  Si el usuario proporciona una lista de features, crea un plan para iterar sobre cada uno, generando un reporte de auditoría individual por feature.

### Fase 2: Auditoría de Conformidad Formal (Arquitectura)

#### Paso 2.1: Validación de Macro-Arquitectura
-   **Objetivo:** Verificar si la funcionalidad está en la ubicación correcta dentro del proyecto.
-   **Acción:** Invoca el micro-guideline `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Criterio de Éxito:** La carpeta del feature debe estar en una "zona" permitida (ej., `subsystem/`, `modules/`).

#### Paso 2.2: Validación del Patrón Arquitectónico
-   **Objetivo:** Verificar si la estructura interna de la funcionalidad sigue un patrón aprobado.
-   **Acción:** Invoca el micro-guideline `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Criterio de Éxito:** La estructura de carpetas (`models/`, `services/`, etc.) debe coincidir con uno de los patrones definidos (`STANDARD`, `COMPLEX`, etc.).

#### Paso 2.3: Validación de Nomenclatura de Archivos
-   **Objetivo:** Verificar si todos los archivos tienen el prefijo y la convención de nombres correcta.
-   **Acción:** Invoca el micro-guideline `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Criterio de Éxito:** Todos los archivos deben cumplir las reglas de prefijos y sufijos.

#### Paso 2.4: Validación de Estructura Interna de Archivos
-   **Objetivo:** Verificar si el nombre del archivo coincide con su contenido principal (ej., si la clase principal en `feature.service.ts` se llama `FeatureService`).
-   **Acción:** Invoca el micro-guideline `3_technology/[tech]/[tech].file-internal-class-naming.guideline.md`.
-   **Criterio de Éxito:** Debe existir una consistencia 1:1 entre el nombre del archivo y su clase/interfaz principal.

**Punto de Control:** Si se encuentran desviaciones críticas en la Fase 2, se genera el reporte y el proceso de auditoría para este feature finaliza aquí.

### Fase 3: Auditoría de Conformidad Funcional (Implementación)

#### Paso 3.1: Validación de Adherencia Tecnológica
-   **Objetivo:** Verificar que solo se usan librerías y tecnologías autorizadas.
-   **Acción:** Invoca el `project.manifest.md` y compara las importaciones del código contra el "Catálogo de Tecnologías Autorizadas".
-   **Criterio de Éxito:** No deben existir importaciones de librerías no autorizadas (ej., `ngx-toastr` en un proyecto PrimeNG).

#### Paso 3.2: Validación de Patrones de Implementación
-   **Objetivo:** Verificar si la implementación sigue los patrones de la metodología.
-   **Acción:** Invoca los micro-guidelines de implementación relevantes, tales como:
    -   `[tech].service-controller-method-conventions.guideline.md` (Para la lógica de backend).
    -   `[tech].presentation-layer-conventions.guideline.md` (Para la UI del frontend).
    -   `[tech].data-normalization.guideline.md` (Para la consistencia de datos).
-   **Criterio de Éxito:** El código debe seguir los patrones (ej., controladores delgados, separación API/Action, sintaxis de `@for` en Angular).

### Fase 4: Generación del Reporte

-   **Objetivo:** Consolidar todos los hallazgos en un único documento.
-   **Tu Tarea:** Genera el documento `[AUDIT].[nombre-feature].md`, agrupando las desviaciones encontradas por cada paso de la cascada.