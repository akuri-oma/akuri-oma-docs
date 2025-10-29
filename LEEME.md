 
<img src="assets/logo-akuri-black.png" alt="Logo Akuri" align="left" width="25%" />
<br />
<hr />
<br />

   
# Metodología Akuri-OMA

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Documentation Status](https://img.shields.io/badge/docs-actualizada-brightgreen.svg)](/docs/es/)
[![PRs Welcome](https://img.shields.io/badge/PRs-bienvenidos-brightgreen.svg)](CONTRIBUTING.md)

**Una metodología de Desarrollo Guiado por Especificaciones (SDD) para construir software de alta calidad, escalable y predecible con agentes de IA.**

---

## El Problema: Los Agentes de IA son Brillantes, pero Caóticos

Los Modelos de Lenguaje Grandes (LLMs) son generadores de código increíblemente poderosos. Sin embargo, cuando se usan sin un marco de trabajo estructurado, a menudo se comportan como un becario brillante pero indisciplinado:
-   **Alucinan:** Inventan librerías, métodos y patrones arquitectónicos que no encajan en el proyecto.
-   **Son Inconsistentes:** Aplican diferentes estilos de código y estructuras de una tarea a la siguiente.
-   **Carecen de Contexto:** Olvidan correcciones anteriores y repiten los mismos errores.
-   **Son Difíciles de Gobernar:** Los comandos directos y sin guía conducen a resultados impredecibles, requiriendo ciclos extensos y frustrantes de revisión y corrección.

## La Solución: Akuri-OMA - Una Capa de Gobernanza para la IA

**Akuri-OMA (Arquitectura Modular Orquestada)** no es otro framework o librería. Es una **capa de gobernanza** y un **sistema de diálogo estructurado** que transforma al agente de IA de un socio caótico a un ejecutor disciplinado y predecible.

En lugar de decirle a la IA *qué construir*, colaboras con ella para crear una **Especificación** formal. La IA luego usa esta especificación como su "partitura" para ejecutar la implementación con precisión.

### ¿Por qué Akuri-OMA?

-   **Predictibilidad y Control:** Al forzar un proceso paso a paso de especificación y aprobación, eliminas las sorpresas. Sabes exactamente qué se va a construir antes de escribir una línea de código.
-   **Código de Alta Calidad y Consistente:** La metodología es reforzada por un sistema de `guidelines` jerárquicos. La IA está obligada a seguir los patrones arquitectónicos, las convenciones de nomenclatura y las restricciones tecnológicas de tu proyecto.
-   **Agnóstica a la Tecnología:** Los flujos de trabajo principales son universales. Proporcionamos `guidelines` listos para usar para **NestJS, Angular y Flutter**, pero los principios se pueden adaptar a cualquier pila tecnológica.
-   **Auto-Documentado por Diseño:** Los artefactos creados durante el proceso de desarrollo (`[INVENTORY]`, `[PLAN]`, `[HANDOVER]`) se archivan dentro de cada funcionalidad, creando una trazabilidad perfecta y permanente desde el requisito hasta el código.

## El Flujo de Trabajo Central

La metodología sigue un modelo de "Andamiaje Progresivo" (Progressive Scaffolding), guiado por dos modos operativos.

`Supervisor (Tú)` ↔ `Ejecutor (Agente de IA)`

  

[ MODO CREATIVO ]

    INVENTARIO: Definir "qué" debe hacer la funcionalidad.
    ↓ (Aprobación)
    [ MODO DICTATORIAL ]

    BLUEPRINT ARQUITECTÓNICO: Definir "dónde" vivirá el código (carpetas y archivos).
    ↓ (Aprobación)

    ESQUELETO DE IMPLEMENTACIÓN: Definir la "forma" del código (clases y métodos).
    ↓ (Aprobación)

    BLUEPRINT TÉCNICO: Definir las "herramientas" a usar (dependencias y convenciones).
    ↓ (Aprobación)

    CONSTRUCCIÓN: La IA ejecuta el plan, construyendo el código bloque por bloque.

code Code

    
## 🚀 Cómo Empezar

1.  **Comprende los fundamentos:** Lee la [Introducción a Akuri-OMA](./docs/es/01-akuri-oma-intro.es.md) para entender el Desarrollo Guiado por Especificaciones (SDD) y la Arquitectura Modular Orquestada (OMA).

2.  **Configura tu entorno:** Sigue la [Guía de Inicio Rápido](./docs/es/02-akuri-oma-tutorial.es.md#guia-de-inicio-rapido-de-akuri-oma) y continua con el [Tutorial Mi Primera Funcionalidad](./docs/es/02-akuri-oma-tutorial.es.md#tutorial-akuri-oma-mi-primera-funcionalidad) para vivir el flujo de Andamiaje Progresivo de principio a fin.

3.  **Experimenta con el Test Drive:** Clona el sandbox [Akuri Test Drive (ES)](./akuiri-test-drive-ES/README.md), que incluye proyectos emparejados NestJS y Angular para practicar SDD y OMA en acción.

4.  **Profundiza en la documentación completa:** Explora la base de conocimiento más amplia en tu idioma preferido.
    -   ➡️ **[Documentación en Español](./docs/es/01-akuri-oma-intro.es.md)**
    -   ➡️ **[Documentación en Inglés](./docs/en/01-akuri-oma-intro.en.md)**

## 📦 Proyectos de Ejemplo

La mejor manera de aprender es viendo una implementación completa. Estos repositorios sirven como una "referencia de oro" para la metodología Akuri-OMA.

-   **Ejemplo de Backend (NestJS):** [Enlace al repositorio `akuri-oma-example-nestjs` - *próximamente*]
-   **Ejemplo de Frontend (Angular):** [Enlace al repositorio `akuri-oma-example-angular` - *próximamente*]

## 🤝 Cómo Contribuir

Akuri-OMA es un proyecto de código abierto, y damos la bienvenida a las contribuciones de la comunidad. Ya sea mejorando la documentación, traduciéndola a un nuevo idioma o adaptando los `guidelines` a una nueva tecnología (como React, Vue o Svelte), tu aporte es valioso.

Por favor, lee nuestra **[Guía de Contribución](./CONTRIBUIR.md)** para empezar.

## 📜 Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo **[LICENSE](./LICENSE)** para más detalles.

  