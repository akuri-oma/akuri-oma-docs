---
trigger: model_decision
description: Define la Macro-Arquitectura para proyectos Angular. Establece la estructura de carpetas de alto nivel dentro de 'src/app' (system, shared, subsystem) y el principio de nomenclatura sincronizada con el backend.
status: active
linked_files: [`angular.architectural-patterns.guideline.md`]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Visión General de la Macro-Arquitectura (architecture-overview.guideline.md)

## 1. Introducción y Propósito

Este guideline define la **Macro-Arquitectura** de un proyecto Angular en Akuri-OMA. Su propósito es establecer la estructura de carpetas de más alto nivel dentro de `src/app/`, definiendo las "zonas" donde deben residir los diferentes tipos de código.

Este documento trabaja en conjunto con el `angular.architectural-patterns.guideline.md`, que define la **Micro-Arquitectura** (las plantillas para las funcionalidades individuales que se colocarán dentro de estas zonas).

## 2. Principio Fundamental: Sincronización de Nomenclatura

Esta es una regla clave para la cohesión entre el frontend y el backend.

-   **Regla de Sincronización:** El nombre de una funcionalidad de negocio que existe tanto en el backend como en el frontend **DEBE ser idéntico**.
-   **Ejemplo:**
    *   ❌ **Incorrecto:** Backend: `property`, Frontend: `real-estate`.
    *   ✅ **Correcto:** Backend: `property`, Frontend: `property`.

## 3. Estructura de Carpetas de Primer Nivel en `src/app/`

La carpeta `src/app/` es el contenedor principal de toda la lógica de la aplicación. Se organiza de la siguiente manera:

src/app/
├── system/ # Servicios de infraestructura y configuración transversal.
├── shared/ # Componentes, servicios y utilidades reutilizables en TODA la aplicación.
└── subsystem/ # Agrupación principal de funcionalidades de negocio por dominio.

## 4. Descripción de las Carpetas ("Zonas")

### 4.1 `system/` (Configuración e Infraestructura)

-   **Propósito:** Contiene los servicios y la lógica que actúan como la infraestructura de la aplicación. No implementa funcionalidades de negocio visibles, sino que da soporte a toda la aplicación.
-   **Contenido Típico:** Servicios de autenticación (`auth.service.ts`), HTTP Interceptors, Route Guards globales, servicios de configuración global.

### 4.2 `shared/` (Elementos Reutilizables Globales)

-   **Propósito:** Contiene elementos completamente agnósticos de la lógica de negocio que pueden ser reutilizados en cualquier parte de la aplicación. Es el "UI Kit" y la librería de utilidades de la aplicación.
-   **Contenido Típico:**
    -   `shared/components/` o `shared/ui/`: Componentes de UI genéricos (botones, inputs, modales).
    -   `shared/pipes/`: Pipes reutilizables (formato de fechas, monedas).
    -   `shared/services/`: Servicios de utilidad general (ej., `notification.service.ts`).
    -   `shared/models/`: Interfaces o tipos de datos muy genéricos.

### 4.3 `subsystem/` (Lógica de Negocio)

-   **Propósito:** Es la "zona" principal donde residen todas las funcionalidades de negocio de la aplicación (ej., `provider`, `shopping-cart`).
-   **Contenido:** Dentro de esta carpeta se crearán las carpetas de las funcionalidades, siguiendo los patrones definidos en `angular.architectural-patterns.guideline.md`.