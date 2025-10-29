
<img src="../../assets/logo-akuri-black.png" alt="Logo Akuri" align="left" width="25%" />
<br />
<hr />
<br />

# Introducción a la Metodología Akuri-OMA

Bienvenido a Akuri-OMA, una metodología de desarrollo de software diseñada para la era de la inteligencia artificial. Su objetivo es proporcionar un marco de trabajo disciplinado, predecible y escalable que permita a los equipos de desarrollo (tanto humanos como agentes de IA) colaborar de manera eficiente para construir software de alta calidad.

Este documento introduce los conceptos filosóficos que sustentan todo el sistema.

## 1. La Filosofía Central: Desarrollo Guiado por Especificaciones (SDD)

La base de Akuri-OMA es el **Desarrollo Guiado por Especificaciones** (Specification-Driven Development - SDD).

> El Desarrollo Guiado por Especificaciones (SDD) es una metodología donde **especificaciones detalladas y formales actúan como el "plano" central** para construir una aplicación, en lugar de ser solo una guía preliminar.
>
> Enfatiza la escritura de especificaciones claras y estructuradas **antes** de la implementación para guiar **todo el proceso**, incluyendo la generación de código, las pruebas y la validación.
>
> Este enfoque es especialmente crucial en el desarrollo asistido por IA, ya que asegura la claridad, la mantenibilidad y el control al **guiar a los agentes de IA a través de un plan estructurado, en lugar de darles comandos directos y sin guía.**

En Akuri-OMA, nunca le pedimos a un agente que "construya una funcionalidad". En su lugar, colaboramos con él para *especificar* la funcionalidad en detalle a través de artefactos como el `[INVENTORY]` y el `[PLAN]`. El código es simplemente el resultado final de una especificación bien definida.

### Ventajas del Enfoque SDD
- **Claridad y Predictibilidad:** Todos los involucrados saben exactamente qué se va a construir antes de escribir una línea de código.
- **Control y Gobernanza:** Permite un control de calidad riguroso en cada fase, asegurando que la implementación se adhiera a la arquitectura y los requisitos.
- **Eficiencia para la IA:** Proporciona a los agentes de IA un contexto limitado y enfocado, reduciendo drásticamente las "alucinaciones", los errores y la necesidad de retrabajo.
- **Auto-Documentación:** Los artefactos de especificación (`PLAN`, `INVENTORY`) se convierten en una documentación viva y precisa de la funcionalidad.

### Consideraciones (Contras)
- **Disciplina Requerida:** Exige una mayor inversión de tiempo en las fases de planificación y diseño en comparación con metodologías más ágiles y menos formales.
- **Rigidez Inicial:** El proceso es intencionadamente rígido. La creatividad se concentra en las fases de conceptualización, mientras que la implementación es un ejercicio de ejecución disciplinada.

## 2. El Modelo de Doble Agencia: Supervisor y Ejecutor

Para implementar SDD de manera efectiva con IA, Akuri-OMA propone un modelo de **doble agencia**, donde dos roles distintos colaboran:

-   **El Supervisor (El Arquitecto):**
    *   **Actor:** Típicamente un desarrollador humano (o una IA muy avanzada en el futuro), o un humano con una IA auxiliar.
    *   **Responsabilidad:** Tomar las decisiones estratégicas. Guía el proceso, hace las preguntas correctas, revisa los artefactos generados por el Ejecutor y da la aprobación final en cada punto de control. Su rol es el de un director de orquesta.

-   **El Ejecutor (El Implementador):**
    *   **Actor:** El agente de IA que opera dentro de un gestor de código (VSCode, Cursor, etc.).
    *   **Responsabilidad:** Seguir las instrucciones y los `guidelines` con precisión absoluta. Genera los artefactos (`PLAN`, código, etc.), ejecuta las tareas y reporta los resultados. Su rol es el de un músico experto que sigue la partitura.

Esta colaboración, donde el Supervisor se enfoca en el "qué" y el "porqué" y el Ejecutor se enfoca en el "cómo", es la clave para aprovechar al máximo el poder de la IA sin perder el control del proceso.
--- END OF FILE 00_Introduccion_a_Akuri_OMA.md ---

--- START OF FILE 01_Principios_Fundamentales_de_Akuri_OMA.md ---

# Principios Fundamentales de Akuri-OMA

Tras entender la filosofía del Desarrollo Guiado por Especificaciones (SDD), es crucial comprender los principios arquitectónicos y de proceso que hacen que la metodología Akuri-OMA sea robusta y escalable.

## 1. OMA: Arquitectura Modular Orquestada

Akuri-OMA se basa en el principio de **Orquestación Modular Arquitectónica (OMA)**. Esto significa que las aplicaciones se construyen como un conjunto de **módulos o funcionalidades desacopladas**, donde cada módulo es un experto en su propio dominio, pero todos son orquestados por reglas y contratos claros.

-   **Módulos (Funcionalidades):** Una funcionalidad (`feature`) es una unidad de software autocontenida que resuelve un problema de negocio específico (ej., `shopping-cart`, `provider-profile`).
-   **Desacoplamiento:** Los módulos no deben tener un conocimiento profundo de la implementación interna de otros módulos.
-   **Orquestación:** Se comunican entre sí a través de contratos bien definidos (APIs, eventos) y son gobernados por reglas arquitectónicas globales.

La principal ventaja de OMA es la **mantenibilidad y la escalabilidad**. Puedes modificar, reemplazar o auditar una funcionalidad sin afectar al resto del sistema, siempre y cuando los contratos se respeten.

## 2. Agnosticismo Tecnológico

La metodología Akuri-OMA es **agnóstica a la tecnología**. Los principios de SDD, la jerarquía de `guidelines` y los flujos de trabajo son conceptos universales de ingeniería de software.

-   **¿Cómo funciona?** La metodología separa los **`workflows` de proceso** (que son universales) de los **`guidelines` de tecnología** (que son específicos).
-   **Ejemplo:** El `Flujo de Trabajo de Andamiaje Progresivo` es el mismo para NestJS, Angular o Flutter. Lo que cambia es que, en la fase de `Blueprint Arquitectónico`, el agente invocará el `guideline` de `architectural-patterns` específico de la tecnología en la que está trabajando.

Esto permite que un equipo adopte Akuri-OMA en toda su pila tecnológica, manteniendo una forma de trabajar consistente incluso con diferentes lenguajes y frameworks.

## 3. Gobernanza Jerárquica

Las reglas y `guidelines` en Akuri-OMA no son una lista plana; existen en una **jerarquía de precedencia** estricta. Esto asegura que las decisiones de alto nivel siempre gobiernen sobre las de bajo nivel.

La jerarquía es:
1.  **Nivel 1 (Plataforma):** Reglas globales que se aplican a todos los proyectos (ej., el Protocolo de Triaje).
2.  **Nivel 2 (Proyecto):** Flujos de trabajo (`workflows`) que definen los procesos principales (ej., `BUILD`, `AUDIT`).
3.  **Nivel 3 (Tecnología):** `Guidelines` de implementación específicos para un framework (ej., cómo estructurar un módulo en NestJS).

Un `guideline` de Nivel 3 nunca puede contradecir una regla de Nivel 1.

## 4. Formalismo antes que Funcionalismo

Este es un principio fundamental del proceso de construcción, inspirado en la ingeniería civil: **no se construye el segundo piso sobre cimientos inestables.**

-   **Definición:** En Akuri-OMA, la **conformidad formal (arquitectónica)** siempre precede a la **conformidad funcional (implementación)**.
-   **En la Práctica:** Antes de implementar la lógica de negocio de un servicio, el sistema (a través del `Flujo de Trabajo de Andamiaje Progresivo`) se asegura de que:
    1.  La nomenclatura sea la correcta.
    2.  La estructura de carpetas y archivos sea la correcta.
    3.  El esqueleto de clases y métodos sea el correcto.

Si la arquitectura está mal, la funcionalidad, aunque "funcione", se considera inválida. Este principio es la clave para construir software de calidad que sea predecible, auditable y escalable a largo plazo.
--- END OF FILE 01_Principios_Fundamentales_de_Akuri_OMA.md ---

--- START OF FILE 02_Configuracion_del_Entorno_Akuri.md ---

# Configuración del Entorno Akuri

Para que la metodología Akuri-OMA funcione, requiere una estructura de carpetas específica y estandarizada. Esta estructura actúa como el "sistema de archivos" del sistema operativo Akuri, donde cada carpeta tiene un propósito claro y definido.

## Nivel 0
Guías generales para el gestor particular (windsur, kilocode, cursor, etc)

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
    *   **Solo existe a nivel de Proyecto Frontend.** Contiene los manifiestos que definen el `Look & Feel`: colores, tipografía, componentes, iconografía, etc. así como las directrices de diversas tecnologías utilizadas como parte del diseño visual (preprocesadores css, librerías de módulos, iconos, tipografías, etc)

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

  
--- END OF FILE 02_Configuracion_del_Entorno_Akuri.md ---

--- START OF FILE 03_Los_Artefactos_de_Akuri.md ---

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
--- END OF FILE 03_Los_Artefactos_de_Akuri.md ---

--- START OF FILE 04_El_Proceso_de_Triaje_y_Modos_Operativos.md ---

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
--- END OF FILE 04_El_Proceso_de_Triaje_y_Modos_Operativos.md ---

--- START OF FILE 05_Workflow_Creacion_de_Funcionalidades_(BUILD).md ---

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
--- END OF FILE 05_Workflow_Creacion_de_Funcionalidades_(BUILD).md ---

--- START OF FILE 06_Workflow_Auditoria_y_Refactorizacion_(AUDIT_REFACTOR).md ---

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
--- END OF FILE 06_Workflow_Auditoria_y_Refactorizacion_(AUDIT_REFACTOR).md ---

--- START OF FILE 07_Workflow_Depuracion_de_Errores_(DEBUG).md ---

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
--- END OF FILE 07_Workflow_Depuracion_de_Errores_(DEBUG).md ---