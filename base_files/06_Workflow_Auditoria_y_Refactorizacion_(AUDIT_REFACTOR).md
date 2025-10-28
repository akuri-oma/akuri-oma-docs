# Manual de Usuario: Auditoría y Refactorización (Workflows de AUDIT y REFACTOR)

Este documento es una guía práctica para el rol de **Supervisor** sobre cómo dirigir al Agente Akuri para auditar la calidad del código existente (`AUDIT`) y para corregir las desviaciones encontradas (`REFACTOR`).

Este `workflow` es fundamental para el mantenimiento, la mejora continua y para asegurar que la base de código se mantenga alineada con la metodología Akuri-OMA a lo largo del tiempo.

---

### **Paso 1: Iniciar una Tarea de `AUDIT`**

-   **Tu Objetivo:** Obtener un informe detallado sobre la conformidad de una funcionalidad existente.
-   **Tu Acción:** Usa el `prompt` genérico `start-task.prompt.md`.
-   **Diálogo con el Agente:**
    1.  Cuando el agente pregunte el "Tipo de Tarea", responde: **`AUDIT`** (o `UI_AUDIT` si es solo visual).
    2.  Cuando pregunte el "Alcance", proporciona la **ruta a la carpeta de la funcionalidad** que deseas revisar.
    3.  El agente confirmará la tarea, el `workflow` que seguirá (`audit-refactor.workflow.md`) y el artefacto que producirá.

-   **Ejecución:** El agente procederá de forma autónoma a ejecutar la auditoría en cascada, comparando el código contra todos los `guidelines` relevantes.
-   **Resultado:** El agente te presentará el documento `[AUDIT]...md` con una lista de todas las desviaciones encontradas o una declaración de conformidad total.

---

### **Paso 2: Revisar el Informe y Decidir el Siguiente Paso**

-   **Tu Objetivo:** Analizar el informe de auditoría y tomar una decisión estratégica.
-   **Tu Rol (Supervisor):**
    -   Lee el `[AUDIT]...md` cuidadosamente.
    -   **Decisión A:** Si el informe es "✅ **Conformidad Total**", el proceso termina. La funcionalidad es sólida.
    -   **Decisión B:** Si se encontraron desviaciones, el siguiente paso es iniciar una tarea de `REFACTOR`.

---

### **Paso 3: Iniciar una Tarea de `REFACTOR`**

-   **Tu Objetivo:** Crear un plan para corregir las desviaciones encontradas en la auditoría.
-   **Tu Acción:** Usa el `prompt` genérico `refactor.prompt.md` (o simplemente continúa la conversación).
-   **Diálogo con el Agente:**
    1.  Indica que quieres iniciar una tarea de `REFACTOR`.
    2.  Proporciona el **nombre del archivo `[AUDIT]...md`** que servirá como `input`.
    3.  Confirma la ruta de la funcionalidad a refactorizar.

-   **Ejecución del Agente (`MODO DICTATORIAL`):**
    1.  El agente analizará el informe de auditoría.
    2.  Diferenciará si los cambios son un `REFACTOR` (internos) o si requieren un `REMAKE` (cambios en la API pública). Si es `REMAKE`, te lo notificará y detendrá el flujo.
    3.  Creará el documento `[PLAN].[refactor]...md`, convirtiendo las recomendaciones del informe en un **checklist de tareas de corrección priorizadas**.

-   **Punto de Aprobación:** El agente te presentará el plan de refactorización. **Debes revisarlo y aprobarlo explícitamente** antes de que se modifique cualquier código.

---

### **Paso 4: Supervisar la Ejecución y Verificación del `REFACTOR`**

-   **Tu Objetivo:** Asegurar que las correcciones se apliquen correctamente.
-   **Tu Rol (Supervisor):**
    1.  **Ejecución:** Da la orden al agente para que ejecute las tareas del plan de refactorización. Para tareas complejas, puedes pedirle que proceda tarea por tarea.
    2.  **Verificación:** Una vez que el agente informe que ha completado todas las correcciones, su `guideline` le ordena realizar una **segunda `AUDIT` de verificación**.
    3.  **Resultado Final:** El agente te presentará un nuevo informe de auditoría que, idealmente, debería mostrar "✅ **Conformidad Total**". Si aún quedan desviaciones, se inicia un nuevo "micro-ciclo" de `REFACTOR`.

Al finalizar este `workflow`, tendrás una funcionalidad que ha sido auditada, corregida y validada, asegurando que su calidad cumple con los estándares de Akuri-OMA.