# Manual de Usuario: Depuración de Errores (Workflow de DEBUG)

Este documento es una guía práctica para el rol de **Supervisor** sobre cómo dirigir al Agente Akuri para diagnosticar y resolver errores en el código, siguiendo el `debug.workflow.md`.

El objetivo es proporcionar un proceso sistemático que permita al agente identificar la causa raíz de un problema, proponer una solución y verificar su efectividad.

---

### **Paso 1: Iniciar una Tarea de `DEBUG`**

-   **Tu Objetivo:** Reportar un error de la manera más clara posible para que el agente pueda empezar a trabajar.
-   **Tu Acción:** Usa el `prompt` genérico `start-task.prompt.md` o simplemente inicia una conversación.
-   **Diálogo con el Agente (Fase de `CLARIFY`):**
    1.  **Tipo de Tarea:** Indica que quieres iniciar una tarea de `DEBUG`.
    2.  **Alcance:** Proporciona la ruta a la funcionalidad donde ocurre el error.
    3.  **Información Esencial:** El agente te hará una serie de preguntas clave. Para una depuración efectiva, es **crucial** que proporciones:
        *   El **mensaje de error exacto** y el `stack trace` (si es un error de compilación).
        *   Los **pasos para reproducir** el error.
        *   La descripción del **comportamiento esperado** vs. el **comportamiento real** (si es un error de lógica).

-   **Clasificación del Agente:** Basado en tu información, el agente clasificará el error como "Error de Compilación/Sintaxis" o "Error de Lógica/Comportamiento".

---

### **Paso 2: Supervisar el Diagnóstico**

-   **Tu Objetivo:** Seguir el razonamiento del agente mientras investiga la causa del error.
-   **Tu Rol (Supervisor):**
    -   **Si es un Error de Compilación:** El agente te propondrá correcciones una por una, siguiendo la lista de errores de la consola. Tu rol es validar si la corrección propuesta es lógica antes de que la aplique.
    -   **Si es un Error de Lógica:** El agente seguirá un proceso más profundo:
        1.  **Mini-Auditoría (Opcional):** Puede que primero realice una rápida revisión de la arquitectura para descartar problemas estructurales.
        2.  **Análisis de Flujo de Datos:** Te explicará cómo está "siguiendo la pista" del dato o la acción a través de las capas (Componente -> Action Service -> API Service, etc.).
        3.  **Formulación de Hipótesis:** Te presentará su hipótesis sobre la causa raíz del problema. (ej., "Mi hipótesis es que el `State` no se está actualizando porque la suscripción a la API está en el lugar incorrecto.").

---

### **Paso 3: Aprobar la Solución y Verificar**

-   **Tu Objetivo:** Validar la solución propuesta y confirmar que el error ha sido resuelto.
-   **Tu Rol (Supervisor):**
    1.  **Aprobación de la Solución:** El agente te presentará el cambio de código específico que propone para solucionar el error. Debes revisarlo y **aprobarlo explícitamente**.
    2.  **Ejecución:** Una vez aprobado, el agente aplicará el cambio.
    3.  **Verificación:** El agente te pedirá que verifiques que el error ya no ocurre. Tu tarea es realizar los pasos de reproducción y confirmar si el comportamiento ahora es el esperado.

Al finalizar este `workflow`, tendrás un error diagnosticado, corregido y verificado, siguiendo un proceso lógico y trazable.