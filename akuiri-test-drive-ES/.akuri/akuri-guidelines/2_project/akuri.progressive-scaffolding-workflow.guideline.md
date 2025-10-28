---
trigger: model_decision
description: El guideline maestro que define el Flujo de Trabajo de Andamiaje Progresivo. Detalla las fases incrementales desde la conceptualización hasta la implementación y el archivado final de especificaciones dentro de la propia funcionalidad. Es universal y aplicable a cualquier tecnología.
status: active
linked_files: [/* Se enlazarán dinámicamente según el proyecto */]
use_case: PLAN, BUILD, DESIGN, INVENTORY
---

# Akuri-OMA: Flujo de Trabajo de Andamiaje Progresivo (akuri.progressive-scaffolding-workflow.guideline.md)

## 1. Introducción y Filosofía

Este documento define el **flujo de trabajo principal y universal** para la creación de cualquier funcionalidad en la Metodología Akuri-OMA. Se basa en un modelo **incremental y progresivo**, donde los artefactos de diseño (`PLAN`, `INVENTORY`) se crean, aprueban y, finalmente, se archivan dentro de la propia funcionalidad para una trazabilidad completa.

## 2. Modos Operativos del Agente

-   **`MODO CREATIVO` (Brainstorming & Analysis):** Se usa en Fases 1 y 2. Prioriza la exploración y la definición de requisitos.
-   **`MODO DICTATORIAL` (Architecture & Execution):** Se usa en Fases 3 en adelante. Prioriza la disciplina, la adherencia a las reglas y la ejecución de decisiones.

## 3. El Flujo de Trabajo Progresivo (10 Fases)

### Fase 1: Conceptualización (`MODO CREATIVO`)
-   **Objetivo:** Explorar la idea inicial. (Opcional).
-   **Artefacto Producido:** `[CONCEPT]...md` en `akuri-work/`.

### Fase 2: Inventario de Características (`MODO CREATIVO`)
-   **Objetivo:** Traducir conceptos en una lista de requisitos funcionales.
-   **Artefacto Producido:** `[INVENTORY]...md` en `akuri-work/`.
-   **Punto de Aprobación:** El usuario debe aprobar este inventario.

### Fase 3: Blueprint Arquitectónico (`MODO DICTATORIAL`)
-   **Objetivo:** Definir la estructura rígida de carpetas y archivos.
-   **Tu Tarea:** Iniciar el documento vivo `[PLAN]...md` en `akuri-work/`, definiendo la nomenclatura y el `tree` de archivos.
-   **Punto de Aprobación:** El usuario debe aprobar la estructura arquitectónica.

### Fase 4: Esqueleto de Implementación (`MODO DICTATORIAL`)
-   **Objetivo:** Definir el contenido ("qué") de cada archivo.
-   **Tu Tarea:** Expandir el `PLAN` con el esqueleto de cada clase, propiedades y firmas de métodos.
-   **Punto de Aprobación:** El usuario debe aprobar el esqueleto.

### Fase 5: Blueprint Técnico y de Dependencias (`MODO DICTATORIAL`)
-   **Objetivo:** Prevenir errores de tecnología, importación y versión.
-   **Tu Tarea:** Expandir el `PLAN` con una sección "Blueprint Técnico".
-   **Punto de Aprobación:** El usuario DEBE aprobar este blueprint técnico.

### Fase 6: Contrato de API y Sincronización (Solo para Frontend) (`MODO DICTATORIAL`)
-   **Objetivo:** Garantizar que el frontend se construirá sobre una base de API **existente y verificada**.
-   **Tu Tarea:** Expandir el `PLAN` con una sección "Contrato de API", validando los endpoints contra la documentación del backend.
-   **Punto de Aprobación:** **NO puedes proceder** hasta que se logre una "Sincronización Exitosa".

### Fase 7: Implementación por Bloques Validados (`MODO DICTATORIAL`)
-   **Principio:** "Construcción por Capas Estables".
-   **Tu Tarea (Inicio del `BUILD`):** Crear el documento `[EXECUTION]...md` en `akuri-work/` con un checklist de tareas y puntos de validación de compilación.
-   **Tu Tarea (Ciclo de `BUILD`):** Ejecutar las tareas del `[EXECUTION]...md` una por una, validando la compilación después de cada bloque lógico.
-   **Finalización:** Al completar la implementación, añadir un "Plan de Pruebas" al `[PLAN]` original.

### Fase 8: Ejecución de Pruebas y Corrección (`MODO DICTATORIAL`)
-   **Objetivo:** Validar que la implementación cumple con el `INVENTORY`.
-   **Tu Tarea:** Ejecutar el "Plan de Pruebas" y corregir los errores.

### Fase 9: Creación del Documento de Handover (Solo para Backend)
-   **Objetivo:** Crear un resumen para facilitar el desarrollo del frontend.
-   **Gatillo:** Se ejecuta al finalizar la construcción de una funcionalidad de Backend.
-   **Artefacto Producido:** Un documento `[HANDOVER]...md` en `akuri-work/`.

### Fase 10: Archivado de Especificaciones (`MODO DICTATORIAL`)
-   **Objetivo:** Crear un registro histórico y de referencia permanente dentro de la propia funcionalidad.
-   **Gatillo:** Es la **última fase** del flujo de `BUILD`, después de que las pruebas hayan pasado y la funcionalidad se considere "completa".
-   **Tu Tarea:**
    1.  Crea una carpeta `akuri-specs/` en la raíz de la funcionalidad recién construida (ej., `backend-nest/src/subsystem/provider/akuri-specs/`).
    2.  **Mueve** los siguientes artefactos desde la carpeta `akuri-work/` a la nueva carpeta `akuri-specs/`:
        *   El `[INVENTORY]...md` final.
        *   El `[PLAN]...md` final y completo.
        *   El `[HANDOVER]...md` (si se generó).
    3.  Confirma que los archivos han sido movidos y que la carpeta `akuri-work/` ha sido limpiada de estos artefactos relacionados con la tarea completada.