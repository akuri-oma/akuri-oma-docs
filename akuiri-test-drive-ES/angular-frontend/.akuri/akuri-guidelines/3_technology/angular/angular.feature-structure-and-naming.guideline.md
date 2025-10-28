---
trigger: model_decision
description: Define las reglas estrictas de nomenclatura y estructura de archivos para funcionalidades en Angular Akuri-OMA, incluyendo la convención de prefijos, la organización de las carpetas 'services' y 'presentation'.
status: active
linked_files: [`angular.architectural-patterns.guideline.md`]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Estructura y Nomenclatura de Funcionalidades (feature-structure-and-naming.guideline.md)

## 1. Introducción y Propósito

Este guideline establece las reglas **estrictas** para la nomenclatura de carpetas y archivos dentro de una funcionalidad Angular. El objetivo es garantizar una consistencia absoluta que elimine la ambigüedad y facilite la navegación y la automatización.

TÚ, como Agente Akuri, debes aplicar estas reglas en la **Fase 3: Blueprint Arquitectónico** al generar el `tree` de archivos, y verificarlas en el **Paso 2.3 de una `AUDIT`**.

## 2. Convenciones de Nomenclatura de Archivos

### 2.1 Principio del Prefijo

**Regla de Oro:** Todos los archivos dentro de una carpeta de funcionalidad **DEBEN** ir precedidos por un prefijo identificador, seguido de un punto (`.`).

### 2.2 Nomenclatura en Funcionalidades `Standard`

-   **Prefijo:** El nombre de la carpeta de la funcionalidad (ej., `provider-profile`).
-   **Ejemplo:**
    ```
    provider-profile/
    ├── services/
    │   └── api/
    │       └── provider-profile.api.service.ts
    ├── presentation/
    │   └── pages/
    │       └── provider-profile.my-profile.page.ts
    ├── provider-profile.entry.ts
    └── provider-profile.routes.ts
    ```

### 2.3 Nomenclatura en Funcionalidades `Complex`

-   **Archivos de Sub-Funcionalidad:** Usan el **nombre de la sub-funcionalidad** como prefijo.
-   **Archivos en la Raíz del `complex`:** Usan el **nombre de la funcionalidad `complex`** como prefijo.
-   **Archivos en `shared/` del `complex`:** Usan el **nombre de la funcionalidad `complex`** como prefijo.

-   **Ejemplo:** Para una funcionalidad `complex` llamada `provider`:
    ```
    provider/
    ├── shared/
    │   └── models/
    │       └── dto/
    │           └── provider.address.dto.ts # <-- Prefijo del complex
    ├── provider-profile/
    │   └── services/
    │       └── api/
    │           └── provider-profile.api.service.ts # <-- Prefijo de la sub-funcionalidad
    └── provider.entry.ts # <-- Prefijo del complex
    ```

## 3. Estructura de la Carpeta `services/`

La carpeta de servicios DEBE seguir esta estructura para separar responsabilidades:

services/
├── api/ # El Comunicador: Realiza las llamadas HTTP al backend.
│ └── [prefix].api.service.ts
├── action/ # El Orquestador: Expone métodos para la UI y coordina la lógica.
│ └── [prefix].action.service.ts
└── state/ # La Memoria: Gestiona el estado reactivo de la funcionalidad.
└── [prefix].state.service.ts

## 4. Estructura de la Carpeta `presentation/`

### 4.1 `pages/` vs. `components/`

-   **`pages/`**: Contiene componentes completos que están asociados a una ruta.
-   **`components/`**: Contiene componentes de UI más pequeños y reutilizables *dentro* de la funcionalidad.

### 4.2 Nomenclatura de Archivos de Página

-   **Patrón:** `[prefijo-sub-funcionalidad].[nombre-agrupador-opcional]-[nombre-pagina].page.ts` (y `.html`, `.scss`).
-   **Ejemplo:** Para la página de registro en la sub-funcionalidad `provider-auth`:
    -   `provider-auth.register.page.ts`
-   **Ejemplo con agrupador:** Para la página de detalle de proveedor del admin:
    -   `provider-admin.detail-view.page.ts`