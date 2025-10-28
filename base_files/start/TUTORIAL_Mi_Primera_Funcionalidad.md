# Tutorial de Akuri-OMA: Mi Primera Funcionalidad

Bienvenido a este tutorial guiado. En los próximos minutos, construiremos juntos una funcionalidad simple de "lista de tareas" (`todo`) en un backend NestJS, siguiendo el `Flujo de Trabajo de Andamiaje Progresivo`.

Este tutorial te enseñará el ritmo y el diálogo del desarrollo con Akuri-OMA, actuando tú como el **Supervisor** y tu agente de IA como el **Ejecutor**.

**Prerrequisitos:**
*   Haber completado la [Guía de Inicio Rápido](./QUICK_START.md).
*   Tener un proyecto NestJS vacío configurado dentro de tu plataforma.

---

### **Paso 1: Iniciar la Tarea**

-   **Tu Acción:** Abre el archivo `.akuri/akuri-prompts/start-task.prompt.md` y pégalo en el chat con tu agente de IA.

-   **Diálogo con el Agente:**
    *   **Agente:** "¿Qué tipo de tarea te gustaría realizar?"
    *   **Tú:** **`BUILD`**
    *   **Agente:** "¿Cuál es el alcance de esta tarea?"
    *   **Tú:** **`[ruta-a-tu-backend]/src/subsystem/todo`**
    *   **Agente:** (Confirmará la tarea y esperará tu instrucción).
    *   **Tú:** "Procede."

---

### **Paso 2: Fase 2 - Inventario de Características (`MODO CREATIVO`)**

-   **Agente:** (Iniciará un diálogo para crear el `INVENTORY`).
    *   **Agente:** "Vamos a detallar qué debe hacer la funcionalidad 'todo'. ¿Cuáles son sus características principales?"
-   **Tu Acción (Supervisor):** Responde con los requisitos.
    *   **Tú:** "1. Permitir crear una nueva tarea con un título. 2. Permitir ver una lista de todas las tareas. 3. Permitir marcar una tarea como completada. 4. Las tareas deben guardarse en Firestore."
-   **Resultado:** El agente te presentará un documento `[INVENTORY].todo.md` con estas características.
-   **Tu Acción:** Revisa el inventario y apruébalo.
    *   **Tú:** "El inventario es correcto. Aprobado."

---

### **Paso 3: Fase 3 - Blueprint Arquitectónico (`MODO DICTATORIAL`)**

-   **Agente:** (Iniciará la fase de diseño de nomenclatura).
    *   **Agente:** "Basado en el inventario, esta funcionalidad parece ser de tipo `STANDARD`. ¿Estás de acuerdo?"
    *   **Tú:** "Sí, `STANDARD` es correcto."
    *   **Agente:** "Confirmado. El nombre de la funcionalidad es `todo`. Ahora generaré el `tree` de archivos para el `[PLAN]`.
-   **Resultado:** El agente te presentará un `tree` de archivos en el `[PLAN].todo.md` que se verá algo así:
    ```
    todo/
    ├── models/
    │   ├── dto/
    │   ├── entity/
    │   └── response/
    ├── services/
    │   └── todo.service.ts
    ├── controllers/
    │   └── todo.controller.ts
    └── todo.module.ts
    ```
-   **Tu Acción:** Revisa el `tree` y apruébalo.
    *   **Tú:** "La estructura es correcta. Aprobada."

---

### **Paso 4: Fases 4, 5 y 6 - Refinamiento del `PLAN`**

-   **Agente:** (Te pedirá expandir el plan con los siguientes `blueprints`).
    *   **Esqueleto:** El agente propondrá las clases y métodos (`create`, `findAll`, `updateStatus`).
    *   **Técnico:** El agente declarará que usará `firebase-admin` y `class-validator`.
    *   **Contrato de API:** (Esta fase se omite para el backend).
-   **Tu Acción:** Revisa y aprueba cada sección a medida que el agente te la presente.
    *   **Tú:** "El esqueleto es correcto. Aprobado."
    *   **Tú:** "El blueprint técnico es correcto. Aprobado."

---

### **Paso 5: Fase 7 - Implementación (`MODO DICTATORIAL`)**

-   **Agente:** (Creará el `[EXECUTION].todo.md` con un checklist).
    *   **Agente:** "He creado el registro de ejecución. La primera tarea es: '[ ] Tarea 1: Crear la estructura de carpetas y archivos base'. ¿Procedo?"
-   **Tu Acción:** Da la orden para cada paso.
    *   **Tú:** "Procede."
    *   *(El agente completa la Tarea 1 y actualiza el `EXECUTION`)*
    *   **Agente:** "Tarea 1 completada. La siguiente tarea es: '[ ] Tarea 2: Implementar los modelos en 'todo/models/'. ¿Procedo?"
    *   **Tú:** "Procede."
-   **... y así sucesivamente**, supervisarás la construcción paso a paso, incluyendo las "Tareas de Validación de Compilación".

---

### **Conclusión del Tutorial**

¡Felicidades! Has supervisado la construcción de tu primera funcionalidad con Akuri-OMA.

Has aprendido el ritmo de la metodología:
1.  **Iniciar** la tarea de forma estructurada.
2.  **Definir** los requisitos en `MODO CREATIVO`.
3.  **Aprobar** las especificaciones técnicas (`PLAN`) en `MODO DICTATORIAL`.
4.  **Supervisar** la construcción paso a paso (`EXECUTION`).

Ahora estás listo para aplicar este flujo de trabajo a funcionalidades más complejas. Para más detalles, consulta la documentación completa en la carpeta `/docs/es/`.