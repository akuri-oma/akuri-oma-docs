# Los Artefactos de Akuri

La metodología Akuri-OMA se basa en la generación y evolución de una serie de documentos formales, o "artefactos". Cada artefacto tiene un propósito específico y se utiliza en una fase concreta del flujo de trabajo. Comprender el rol de cada uno es fundamental para guiar al agente de IA.

## 1. Artefactos de Gobernanza (Configuración)

Estos documentos establecen las reglas y el contexto del entorno. Rara vez cambian.

-   **Manifest (`*.manifest.md`):**
    *   **Propósito:** Un documento declarativo que establece las **tecnologías, proyectos y restricciones** de una `PLATAFORMA` o `PROYECTO`. Responde a la pregunta: "¿Qué es y qué tecnologías usa?".
    *   **Ejemplos:** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline (`*.guideline.md` o `*.workflow.md`):**
    *   **Propósito:** Un manual de instrucciones técnico. Define **"cómo"** se debe estructurar el código, implementar la lógica o seguir un proceso. Son las reglas de **implementación y arquitectura**.
    *   **Ejemplo:** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document (`*.design.md`):**
    *   **Propósito:** Un manual de identidad visual. Define **"cómo"** debe verse y sentirse una interfaz de usuario. Son las reglas de **apariencia y comportamiento visual**.
    *   **Ejemplo:** `angular-app.look-and-feel.design.md`.

-   **Prompt Template (`*.prompt.md`):**
    *   **Propósito:** Una plantilla reutilizable para que el usuario inicie una tarea estandarizada, asegurando que el agente reciba el contexto correcto.
    *   **Ejemplo:** `start-task.prompt.md`.

## 2. Artefactos del Flujo de Trabajo (Operativos)

Estos documentos se crean y se modifican durante la ejecución de una tarea. Viven temporalmente en la carpeta `akuri-work/`.

-   **CONCEPT (`[CONCEPT]...md`):**
    *   **Fase:** 1 (Conceptualización).
    *   **Propósito:** Un documento de brainstorming inicial para explorar ideas de alto nivel sin restricciones, operando en `MODO CREATIVO`.

-   **INVENTORY (`[INVENTORY]...md`):**
    *   **Fase:** 2 (Inventario de Características).
    *   **Propósito:** La lista detallada de **requisitos funcionales** de una funcionalidad. Responde a la pregunta: "¿Qué debe hacer?". Se crea en `MODO CREATIVO`.

-   **PLAN (`[PLAN]...md`):**
    *   **Fases:** 3 a 7.
    *   **Propósito:** Es el **documento vivo** y blueprint técnico para la construcción. Evoluciona a través de las fases, desde la arquitectura (`tree`), pasando por el esqueleto de implementación, el blueprint técnico, el contrato de API, y finalizando con el plan de pruebas. Se crea y se gestiona en `MODO DICTATORIAL`.

-   **EXECUTION (`[EXECUTION]...md`):**
    *   **Fase:** 7 (Implementación).
    *   **Propósito:** Un "cuaderno de construcción" con un checklist de tareas de implementación y puntos de validación. Permite gestionar tareas de `BUILD` complejas de forma secuencial y a prueba de errores, evitando problemas de contexto.

-   **HANDOVER (`[HANDOVER]...md`):**
    *   **Fase:** 9 (Post-`BUILD` de Backend).
    *   **Propósito:** El documento de transferencia del backend al frontend. Resume las capacidades de negocio, sugiere las páginas a construir y proporciona un resumen del contrato de la API.

-   **AUDIT Report (`[AUDIT]...md`):**
    *   **Fase:** `AUDIT`.
    *   **Propósito:** El informe resultante de una auditoría. Detalla las desviaciones encontradas en el código en comparación con los `guidelines` y manifiestos. Es el `input` para una tarea de `REFACTOR`.