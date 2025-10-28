---
trigger: always_on
description: Manifiesto de la plataforma AKURI_TEST que describe la estructura, objetivos y responsabilidades tecnológicas de los proyectos nest-backend y angular-frontend para una plataforma de pruebas de la metodología Akuri-oma.
---

# Manifiesto de la Plataforma AKURI_TEST

## 1. Objetivo
Plataforma de pruebas de la metodología Akuri-oma, utilizada para demostrar y validar los procesos, patrones y guías de desarrollo definidos en la metodología.

## 2. Descripción
AKURI_TEST es una plataforma de ejemplo que implementa la metodología Akuri-oma, combinando un backend en NestJS y un frontend en Angular para ilustrar las mejores prácticas y flujos de trabajo de la metodología.

## 3. Estructura de la Plataforma y Detalles Técnicos

Esta sección describe los proyectos que constituyen la plataforma y sus contratos técnicos clave.

-   **`nest-backend`:**
    -   **Rol:** API de Backend y Núcleo de Lógica de Negocio.
    -   **Tecnología:** NestJS.
    -   **Descripción:** Gestiona la lógica de dominio y sirve como la fuente de API para el frontend.
    -   **`api_docs_url_local`:** `http://localhost:3000/explorer` (única dirección utilizada).

-   **`angular-frontend`:**
    -   **Rol:** Aplicación Web Frontend.
    -   **Tecnología:** Angular.
    -   **Depende de:** `nest-backend`.
    -   **Descripción:** Interfaz de usuario responsiva que consume las APIs del backend.
    -   **`url_local`:** `http://localhost:4200` (única dirección utilizada).


## 4. Responsabilidades Tecnológicas y Pila Principal

-   **Lógica de Negocio:** `nest-backend` es la única fuente de verdad. Gestiona la lógica de dominio y proporciona APIs para el frontend.
-   **Lógica de Presentación:** `angular-frontend` es responsable de renderizar los datos y capturar la intención del usuario. Consume las APIs del backend.
-   **Servicios Centrales de la Plataforma:** No se utilizan servicios externos como Firebase en esta plataforma de pruebas.

## 5. Convenciones de Nomenclatura de Proyectos

-   Al referirse a "backend", significa el proyecto `nest-backend`.
-   Al referirse a "frontend" o "web", significa el proyecto `angular-frontend`.
-   No hay aplicación móvil en esta plataforma de pruebas.
-   Si existe alguna ambigüedad en las referencias del proyecto, TÚ, como Agente Akuri, DEBES pedir una aclaración al usuario antes de proceder.

## 6. Expansión Futura
Esta plataforma de pruebas puede expandirse con nuevas funcionalidades para demostrar aspectos adicionales de la metodología Akuri-oma.