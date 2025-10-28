




# Akuri-OMA - Proyectos de Inicio para Tutoriales

¡Bienvenido! Este repositorio contiene los proyectos de inicio para el tutorial oficial de Akuri-OMA. Su propósito es proporcionarte un entorno limpio y pre-configurado para que puedas experimentar el Desarrollo Guiado por Especificaciones (SDD) con un agente de IA desde cero.

Este repositorio está destinado a desarrolladores con un **conocimiento de moderado a avanzado** en las tecnologías utilizadas (NestJS, Angular). El enfoque está en aplicar la metodología, no en enseñar los fundamentos de los frameworks.

---

## ¿Qué Contiene?

Este monorepo contiene dos proyectos base, recién creados con sus respectivos CLIs:

-   **`nestjs-backend/`**: Un proyecto de backend mínimo en NestJS.
-   **`angular-frontend/`**: Un proyecto de frontend mínimo en Angular.

La única modificación realizada en estos proyectos es la adición de la estructura de carpetas `.akuri/` completa, incluyendo los `guidelines`, manifiestos y `prompts` base para cada tecnología. Esto te permite comenzar el tutorial de inmediato.

¡Sientase libre de cambiar a otras tecnologias o frameworks una vez comprenda los coneptos fundamentales!

---

## El Flujo de Trabajo de Doble Agente Recomendado

Para aprovechar al máximo la metodología Akuri-OMA, recomendamos encarecidamente una configuración de **dos pantallas y doble agente**. Tú, el desarrollador humano, actuarás como el **Supervisor**, orquestando dos agentes de IA especializados.

### Pantalla 1: El Supervisor de IA (Tu Socio Estratégico)
-   **Herramienta:** Tu IA preferida basada en navegador (nosotros usamos **Google AI Studio**, pero otras funcionan también).
-   **Rol:** Esta IA conoce la **metodología**. Actuará como tu asistente para crear `prompts`, revisar resultados y proporcionar orientación estratégica.
-   **Configuración:** En una nueva sesión de chat, **subirás todos los documentos de contexto** del repositorio `akuri-oma-methodology` (todos los `guidelines`, `workflows`, manifiestos, etc.). Esto le da a la IA un profundo conocimiento de todo el sistema Akuri-OMA.

### Pantalla 2: El Ejecutor de IA (Tu Asistente de Código)
-   **Herramienta:** Tu editor de código preferido con asistente de IA (ej., **Cursor, WindSorf, KiloCode**).
-   **Rol:** Esta IA conoce la **base del código**. Ejecutará tareas, escribirá código y correrá comandos.
-   **Configuración:** Debes configurar las reglas del espacio de trabajo de tu editor para que utilice el archivo **`00-akuri-bootstrap.md`** ubicado en la carpeta `.akuri/` de la plataforma. Este archivo instruye al Ejecutor de IA para que siga las reglas maestras de la metodología Akuri-OMA.

---

## Prerrequisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente:
-   Node.js (versión LTS)
-   Angular CLI (`npm install -g @angular/cli`)
-   NestJS CLI (`npm install -g @nestjs/cli`)
-   Acceso a una IA de navegador y a un editor de código con IA.

## Cómo Usar este Repositorio

1.  **Clona el Repositorio:**
    ```bash
    git clone [URL_DE_ESTE_REPOSITORIO_DE_TUTORIALES]
    cd [nombre-repositorio]
    ```

2.  **Instala las Dependencias:**
    Ejecuta `npm install` dentro de las carpetas de ambos proyectos:
    ```bash
    cd nestjs-backend
    npm install
    cd ../angular-frontend
    npm install
    ```

3.  **Configura el Supervisor de IA:**
    -   Abre tu IA de navegador (ej., Google AI Studio).
    -   Inicia una nueva sesión y sube todos los archivos de `guidelines` y documentación de tu copia local del repositorio `akuri-oma-methodology`.

4.  **Configura el Ejecutor de IA:**
    -   Abre la carpeta de este repositorio en tu editor de código con IA (ej., Cursor).
    -   Configura sus reglas de espacio de trabajo para usar el archivo `akuri-prompts/00-akuri-bootstrap.md` como una regla principal.

5.  **Inicia el Tutorial:**
    -   Ahora estás listo para comenzar. Sigue la guía paso a paso en el repositorio principal de la metodología:
        ➡️ **[TUTORIAL_Mi_Primera_Funcionalidad.md](https://github.com/user/akuri-oma-methodology/blob/main/TUTORIAL_Mi_Primera_Funcionalidad.md)**

## Estructura del Repositorio
/
.akuri # Carpeta que gobierna la plataforma
├── nestjs-backend/
│ ├── .akuri/ # Carpeta Akuri pre-configurada para NestJS
│ └── src/
├── angular-frontend/
│ ├── .akuri/ # Carpeta Akuri pre-configurada para Angular
│ └── src/

└── README.md # Este archivo en Inglés
