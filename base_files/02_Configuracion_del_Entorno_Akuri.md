# Configuración del Entorno Akuri

Para que la metodología Akuri-OMA funcione, requiere una estructura de carpetas específica y estandarizada. Esta estructura actúa como el "sistema de archivos" del sistema operativo Akuri, donde cada carpeta tiene un propósito claro y definido.

## Nivel 0
Guias generales para el gestor particular (windsur, kilocode, cursor, etc)

## 1. La Carpeta `.akuri`

La carpeta `.akuri` es el corazón de la gobernanza. Existe en dos niveles jerárquicos:

-   **Nivel de Plataforma (`./.akuri/`):**
    *   **Ubicación:** En la raíz del repositorio o monorepo.
    *   **Propósito:** Contiene los documentos que son **globales** y se aplican a **todos los proyectos** de la plataforma.

-   **Nivel de Proyecto (`./[nombre-proyecto]/.akuri/`):**
    *   **Ubicación:** En la raíz de cada proyecto individual (ej., `backend-nest/`, `webpage-angular/`).
    *   **Propósito:** Contiene los documentos **específicos** de ese proyecto, como sus `guidelines` tecnológicos o su sistema de diseño.

## 2. Estructura Detallada de la Carpeta `.akuri`

La siguiente estructura se replica, con variaciones, tanto a nivel de Plataforma como de Proyecto.


.akuri/
├── akuri-manifest/ # Los contratos declarativos.
├── akuri-guidelines/ # Los manuales de instrucciones (el "cómo").
├── akuri-design-system/ # La identidad visual (solo en frontends).
├── akuri-prompts/ # Plantillas de prompts para el usuario.
├── akuri-work/ # La mesa de trabajo temporal.
├── akuri-history/ # El archivo de tareas completadas.
└── akuri-docs/ # Documentación general y ejemplos.
    
### Descripción de cada Subcarpeta:

-   **`akuri-manifest/`**:
    *   Contiene los `manifests`. El `platform.manifest.md` define los proyectos, mientras que cada `project.manifest.md` declara la pila tecnológica y las restricciones de ese proyecto (ej., "usar Firebase", "archivo de dependencias es pubspec.yaml").

-   **`akuri-guidelines/`**:
    *   La base de conocimiento técnico. Está organizada jerárquicamente:
        *   `1_platform/`: Reglas operativas globales.
        *   `2_project/`: Flujos de trabajo (`workflows`) como `BUILD` o `AUDIT`.
        *   `3_technology/`: `Guidelines` específicos de cada tecnología (NestJS, Angular, etc.).
        *   `4_task/`: Tareas predefinidas y patrones de trabajo

-   **`akuri-design-system/`**:
    *   **Solo existe a nivel de Proyecto Frontend.** Contiene los manifiestos que definen el `Look & Feel`: colores, tipografía, componentes, iconografía, etc. asi como las directrices de diversas tecnologias utilizadas como parte del diseño visual (preporcesadores css, librerias de modulos, iconos, tipografias, etc)

-   **`akuri-prompts/`**:
    *   Contiene plantillas de `prompts` reutilizables para que el usuario inicie tareas comunes (`start-task.prompt.md`) de manera estandarizada.

-   **`akuri-work/`**:
    *   Es la carpeta de trabajo **temporal** del agente. Aquí se crean y modifican los artefactos (`INVENTORY`, `PLAN`, `AUDIT Report`) durante la ejecución de una tarea. Una vez que la tarea se completa, esta carpeta se limpia.

-   **`akuri-history/`**:
    *   Un archivo a largo plazo de los documentos de ejecución (`EXECUTION`) completados, para auditoría del proceso.

-   **`akuri-docs/`**:
    *   Contiene la documentación de apoyo, como el `akuri.glossary.md` (glosario de términos), ejemplos y tutoriales.

## 3. La Carpeta `akuri-specs` (El Historial de Diseño)

A diferencia de las carpetas anteriores, la carpeta `akuri-specs/` **no vive dentro de `.akuri`**.

-   **Ubicación:** Se crea en la **raíz de cada funcionalidad construida** (ej., `backend-nest/src/subsystem/provider/akuri-specs/`).
-   **Propósito:** Actúa como la "caja negra" o el registro histórico de una funcionalidad. Al finalizar un `BUILD`, los artefactos de diseño (`INVENTORY`, `PLAN`, `HANDOVER`) se mueven desde `akuri-work/` a esta carpeta.
-   **Ventaja:** Esto crea una **trazabilidad perfecta** desde el requisito original hasta el código fuente. Para entender por qué una funcionalidad fue construida de cierta manera, simplemente hay que leer las especificaciones que viven junto a ella.

  
