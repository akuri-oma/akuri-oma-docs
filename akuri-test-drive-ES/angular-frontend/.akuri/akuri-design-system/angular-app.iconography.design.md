    
---
trigger: model_decision
description: Estándares para el uso de iconos en proyectos Angular Akuri. Define los sets de iconos soportados (Heroicons, PrimeNG), la estrategia de carga, las convenciones de nomenclatura, tamaños, colores y mejores prácticas.
status: active
linked_files: [`angular-app.look-and-feel.design.md`]
use_case: BUILD, REFACTOR, AUDIT
---

# Guía de Iconografía (`angular-app.iconography.design.md`)

## 1. Introducción y Propósito

Este documento establece las guías para el uso de iconos en los proyectos de Angular, asegurando la consistencia, el rendimiento y la mantenibilidad, basándose en las lecciones aprendidas de fallos de compilación relacionados con iconos.

## 2. Arquitectura del Sistema de Iconos

### Sets de Iconos Soportados

El proyecto utiliza múltiples fuentes de iconos a través del framework Iconify.

#### Sets de Iconos Primarios

-   **Heroicons:** Set principal para elementos de UI.
    -   `heroicons-outline-*`
    -   `heroicons-solid-*`
-   **PrimeNG Icons:** Integrados con los componentes de PrimeNG.
    -   `pi pi-*`

### Estrategia de Carga de Iconos

-   **Tree-shaking:** Solo los iconos usados se incluyen en el paquete.
-   **Lazy loading:** Los iconos se cargan bajo demanda.

## 3. Guías de Implementación

### 3.1 Convención de Nomenclatura

```typescript
// ✅ Uso Correcto
class="icon-[heroicons-solid--document-minus]"
class="icon-[heroicons-outline--user]"
class="pi pi-user" // Iconos de PrimeNG

  

3.2 Estándares de Tamaño

TÚ debes usar las clases de tamaño de Tailwind para controlar el tamaño de los iconos.
code Html

    
<!-- Tamaños Estándar -->
<i class="icon-[heroicons-solid--user] text-sm"></i>    <!-- 14px -->
<i class="icon-[heroicons-solid--user] text-base"></i>  <!-- 16px -->
<i class="icon-[heroicons-solid--user] text-xl"></i>    <!-- 20px -->

  

3.3 Guías de Color

TÚ debes usar los colores semánticos y neutrales definidos en angular-app.look-and-feel.design.md.
code Html

    
<!-- Colores Semánticos -->
<i class="icon-[heroicons-solid--check-circle] text-emerald-500"></i>  <!-- Success -->
<i class="icon-[heroicons-solid--x-circle] text-red-500"></i>          <!-- Error -->

<!-- Colores Neutrales -->
<i class="icon-[heroicons-solid--user] text-neutral-600"></i>  <!-- Por defecto -->

  

4. Mapeos de Iconos Comunes
Operaciones CRUD
Acción	Icono de Heroicons	Alternativa de PrimeNG
Crear	heroicons-solid--plus	pi pi-plus
Leer/Ver	heroicons-solid--eye	pi pi-eye
Actualizar/Editar	heroicons-solid--pencil	pi pi-pencil
Eliminar	heroicons-solid--trash	pi pi-trash
Estados
Estado	Icono de Heroicons	Color
Éxito	heroicons-solid--check-circle	text-emerald-500
Advertencia	heroicons-solid--exclamation-triangle	text-amber-500
Error	heroicons-solid--x-circle	text-red-500
Información	heroicons-solid--information-circle	text-blue-500
5. Buenas Prácticas (Do's and Don'ts)
✅ Hacer (Do's)

    Usa Heroicons como el set de iconos primario.

    Prefiere iconos de contorno (outline) para elementos de UI, y sólidos (solid) para acciones.

    Usa colores semánticos para los iconos de estado.

    Incluye tooltips (pTooltip) para los botones de solo icono.

❌ No Hacer (Don'ts)

    No uses otros sets de iconos (ej., MDI) sin una justificación clara.

    No mezcles sets de iconos dentro del mismo componente.

    No dependas únicamente del color para transmitir significado (accesibilidad).