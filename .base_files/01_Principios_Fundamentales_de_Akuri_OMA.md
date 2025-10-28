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