# Manual de Usuario: Creación de Funcionalidades (Workflow de BUILD)

Este documento es una guía práctica para el rol de **Supervisor** sobre cómo dirigir al Agente Akuri para construir una nueva funcionalidad desde cero, siguiendo el `Flujo de Trabajo de Andamiaje Progresivo` (`akuri.progressive-scaffolding-workflow.guideline.md`).

El proceso es una secuencia de `prompts` y aprobaciones que guían al agente a través de las fases de diseño e implementación, asegurando calidad y consistencia.

---

### **Paso 0: Iniciar la Tarea**

-   **Tu Acción:** Usa el `prompt` genérico `start-task.prompt.md`.
-   **Diálogo con el Agente:**
    1.  Cuando el agente pregunte el "Tipo de Tarea", responde: **`BUILD`**.
    2.  Cuando pregunte el "Alcance", proporciona la ruta donde se creará la nueva funcionalidad.
    3.  El agente confirmará la tarea y esperará tu instrucción para comenzar.

---

### **Paso 1: Fases 1 y 2 - Conceptualización e Inventario (`MODO CREATIVO`)**

-   **Tu Objetivo:** Colaborar con el agente para definir qué debe hacer la nueva funcionalidad.
-   **Tu Rol (Supervisor):**
    -   Participa en el diálogo de `brainstorming` (Fase 1, opcional).
    -   Responde a las preguntas del agente para crear una lista detallada de requisitos funcionales (Fase 2).
-   **Punto de Aprobación:** Al final de esta etapa, el agente te presentará el documento `[INVENTORY]...md`. Debes revisarlo cuidadosamente y **aprobarlo explícitamente** para continuar.

---

### **Paso 2: Fases 3 a 6 - Diseño y Planificación (`MODO DICTATORIAL`)**

-   **Tu Objetivo:** Tomar las decisiones de arquitectura y validar los contratos técnicos antes de la construcción.
-   **Tu Rol (Supervisor):** El agente expandirá secuencialmente el documento `[PLAN]...md`. Tu trabajo es revisar y aprobar cada una de estas secciones:
    1.  **Blueprint Arquitectónico (Fase 3):**
        *   Proporciona (de forma "dictatorial") o aprueba la nomenclatura de la funcionalidad y sus sub-módulos.
        *   Revisa y aprueba el `tree` de carpetas y archivos.
    2.  **Esqueleto de Implementación (Fase 4):**
        *   Revisa y aprueba las firmas de las clases, interfaces y métodos.
    3.  **Blueprint Técnico (Fase 5):**
        *   Verifica la lista de dependencias y aprueba cualquier nueva librería propuesta.
        *   Confirma que el agente ha reconocido las convenciones de implementación clave.
    4.  **Contrato de API (Fase 6, solo Frontend):**
        *   Valida que el mapeo de endpoints sea correcto y que el estado de sincronización con el backend sea "✅ Exitoso".

**Cada una de estas aprobaciones es un punto de control bloqueante.**

---

### **Paso 3: Fase 7 - Implementación por Bloques (`MODO DICTATORIAL`)**

-   **Tu Objetivo:** Supervisar la construcción del código de manera segura y controlada.
-   **Tu Rol (Supervisor):**
    1.  Da la orden al agente para que inicie la fase de `BUILD`. El agente creará el documento `[EXECUTION]...md` con un checklist.
    2.  Tu tarea principal durante esta fase es dar la orden de "continuar" para que el agente ejecute la siguiente tarea del `checklist`.
    3.  Supervisa los resultados de las "Tareas de Validación de Compilación" después de cada bloque lógico para asegurar que la base de código se mantiene estable.

---

### **Paso 4: Fases 8, 9 y 10 - Finalización y Archivado**

-   **Tu Objetivo:** Validar el producto final y asegurar que la documentación se archive correctamente.
-   **Tu Rol (Supervisor):**
    1.  **Plan de Pruebas (Final de la Fase 7):** Revisa y aprueba el "Plan de Pruebas" que el agente añade al `PLAN`.
    2.  **Ejecución de Pruebas (Fase 8):** Dirige al agente para que ejecute las pruebas y corrija cualquier error encontrado.
    3.  **Documento de Handover (Fase 9, solo Backend):** Solicita y revisa el `[HANDOVER]...md`.
    4.  **Archivado de Especificaciones (Fase 10):** Da la orden final para que el agente mueva todos los artefactos de diseño (`INVENTORY`, `PLAN`, `HANDOVER`) desde `akuri-work/` a la nueva carpeta `akuri-specs/` dentro de la funcionalidad.

Al finalizar este `workflow`, tendrás una nueva funcionalidad construida, probada y con toda su documentación de diseño archivada permanentemente junto al código fuente.