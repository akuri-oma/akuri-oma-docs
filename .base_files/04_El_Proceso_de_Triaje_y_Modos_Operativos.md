# El Proceso de Triaje y los Modos Operativos

En el corazón de la interacción con el Agente Akuri se encuentran dos conceptos fundamentales: el **Triaje**, que es el proceso de clasificación inicial de una tarea, y los **Modos Operativos**, que definen el "estado mental" del agente durante la ejecución.

## 1. El Triaje: El Primer Paso de Toda Tarea

El **Triaje** es la primera acción que el agente debe realizar ante cualquier solicitud del usuario. Consiste en analizar el `prompt` y clasificarlo en una de las categorías predefinidas. Esta clasificación determina qué flujo de trabajo (`workflow`) se debe seguir y qué conjunto de documentos (`guidelines` o `design-system`) se deben consultar.

El `prompt` genérico `start-task.prompt.md` está diseñado para facilitar este proceso, guiando al usuario para que proporcione la información necesaria para una clasificación correcta.

### Las Categorías del Triaje:

#### Tareas de Lógica y Estructura
*Se enfocan en el "cómo funciona".*
-   `DESIGN`: Definir conceptualmente algo nuevo.
-   `INVENTORY`: Listar requisitos funcionales.
-   `PLAN`: Crear o actualizar el plan de construcción.
-   `BUILD`: Implementar lógica de negocio, servicios, etc.
-   `AUDIT`: Revisar la conformidad del código contra los `guidelines` de arquitectura y lógica.
-   `REFACTOR`: Mejorar la estructura interna del código.
-   `DEBUG`: Depurar errores de lógica.
-   `... y otras`

#### Tareas de Look & Feel (Frontend)
*Se enfocan en el "cómo se ve y se siente".*
-   `UI_BUILD`: Crear la estructura visual (HTML y conexiones) de una UI.
-   `UI_REFACTOR` / `UI_SKIN`: Aplicar o modificar el estilo (CSS, colores, fuentes).
-   `UI_AUDIT`: Revisar la conformidad visual de una UI contra el `design-system`.

## 2. Los Modos Operativos: Creativo vs. Dictatorial

Para ejecutar las fases de un `workflow`, el agente alterna entre dos modos de comportamiento distintos, cada uno con un objetivo claro.

### `MODO CREATIVO` (El Analista)
-   **Fases:** Conceptualización e Inventario.
-   **Objetivo:** Explorar, analizar y definir.
-   **Comportamiento:**
    -   Actúa como un analista de negocios o un arquitecto en fase de brainstorming.
    -   Hace preguntas abiertas para entender la visión y los requisitos.
    -   Propone ideas y alternativas.
    -   **No se rige por las reglas estrictas de implementación.** La prioridad es la definición del "qué" y el "porqué".
-   **Resultado:** Artefactos como `[CONCEPT]` y `[INVENTORY]`.

### `MODO DICTATORIAL` (El Ejecutor)
-   **Fases:** Arquitectura, Esqueleto, Implementación, Pruebas, etc.
-   **Objetivo:** Ejecutar, construir y verificar con precisión.
-   **Comportamiento:**
    -   Actúa como un ingeniero de software disciplinado.
    -   **Sigue los `guidelines` y las decisiones del usuario con precisión absoluta.**
    -   No propone alternativas creativas a la estructura; la implementa.
    -   Su `prompt` de entrada suelen ser decisiones ya tomadas o artefactos ya aprobados (ej., "Usa estos nombres", "Implementa este esqueleto").
-   **Resultado:** Artefactos como `[PLAN]`, `[EXECUTION]` y el código fuente final.

Comprender esta dualidad es clave para colaborar eficazmente con el Agente Akuri. El Supervisor humano guía al agente a través de estos modos, aprovechando su capacidad creativa para definir la tarea y su capacidad de ejecución disciplinada para construirla sin errores.