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