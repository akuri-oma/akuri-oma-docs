    
---
trigger: model_decision
description: Guía visual maestra para proyectos Angular Akuri. Define el sistema de diseño visual, incluyendo paletas de colores, tipografía, layout, espaciado y estilos para componentes centrales, integrando Tailwind CSS y PrimeNG.
status: active
linked_files: []
use_case: BUILD, REFACTOR, AUDIT
---

# Look & Feel Design System (`angular-app.look-and-feel.design.md`)

## 1. Introducción y Propósito

Este documento define el sistema visual para los proyectos frontend de Angular, asegurando la consistencia en todas las páginas y componentes. Establece las utilidades de Tailwind CSS alineadas con los componentes de PrimeNG, creando un lenguaje de diseño cohesivo.

## 2. Filosofía de Diseño

-   **Tailwind-First:** Todo el estilizado prioriza las utilidades de Tailwind CSS sobre CSS personalizado.
-   **Integración con PrimeNG:** Los componentes de PrimeNG se adaptan con los tokens de Tailwind para mayor consistencia.
-   **Diseño Responsivo:** Enfoque "mobile-first" con mejora progresiva.
-   **Accesibilidad:** Cumplimiento de WCAG AA con relaciones de contraste adecuadas y marcado semántico.
-   **Rendimiento:** Carga optimizada con uso eficiente de CSS y componentes.

## 3. Paleta de Colores y Tokens de Diseño

### 3.1 Esquema de Color Primario

| Token       | HEX       | Tailwind Utility | Uso                                        |
| ----------- | --------- | ---------------- | ------------------------------------------ |
| Primary 50  | `#eff6ff` | `bg-blue-50`     | Fondos claros, resaltados sutiles          |
| Primary 500 | `#3b82f6` | `bg-blue-500`    | Botones primarios, enlaces, acentos        |
| Primary 600 | `#2563eb` | `bg-blue-600`    | Acentos más oscuros, estados hover         |
| Primary 700 | `#1d4ed8` | `bg-blue-700`    | Texto sobre fondos claros                  |

*(...y el resto de la escala de colores primarios)*

### 3.2 Esquema de Color Neutral

| Token       | HEX       | Tailwind Utility   | Uso                                        |
| ----------- | --------- | ------------------ | ------------------------------------------ |
| Neutral 50  | `#fafafa` | `bg-neutral-50`    | Fondos de página, secciones claras         |
| Neutral 200 | `#e5e5e5` | `bg-neutral-200`   | Bordes, divisores                          |
| Neutral 300 | `#d4d4d4` | `bg-neutral-300`   | Bordes de inputs                           |
| Neutral 600 | `#525252` | `bg-neutral-600`   | Texto de cuerpo                            |
| Neutral 900 | `#171717` | `bg-neutral-900`   | Títulos primarios, fondos de hero          |

*(...y el resto de la escala de colores neutrales)*

### 3.3 Colores Semánticos

| Token   | HEX       | Tailwind Utility   | Uso                                        |
| ------- | --------- | ------------------ | ------------------------------------------ |
| Success | `#10b981` | `bg-emerald-500`   | Estados de éxito, confirmaciones           |
| Warning | `#f59e0b` | `bg-amber-500`     | Advertencias, estados de atención          |
| Error   | `#ef4444` | `bg-red-500`       | Errores, acciones destructivas             |
| Info    | `#3b82f6` | `bg-blue-500`      | Información, estados neutrales             |

## 4. Tipografía

### 4.1 Familia de Fuentes

-   **Fuente Primaria**: Inter (Google Fonts)
-   **Fallback**: `"Helvetica Neue", Arial, sans-serif`

### 4.2 Escala Tipográfica

| Elemento       | Tamaño           | Peso           | Altura de Línea    | Uso                |
| -------------- | ---------------- | -------------- | ------------------ | ------------------ |
| Display Large  | `text-5xl` (48px) | `font-bold`    | `leading-tight`    | Títulos de hero    |
| Heading 1      | `text-3xl` (30px) | `font-semibold` | `leading-tight`    | Títulos de página  |
| Body Regular   | `text-base` (16px) | `font-normal`   | `leading-relaxed`  | Texto de cuerpo    |
| Caption        | `text-xs` (12px) | `font-medium`   | `leading-normal`   | Etiquetas, metadatos |

*(...y el resto de la escala tipográfica)*

## 5. Layout y Espaciado

### 5.1 Sistema de Contenedores

-   **Ancho Máximo**: `max-w-7xl` (1280px) para el contenido principal.
-   **Padding**: `px-6` (24px) en móvil, `lg:px-8` (32px) en escritorio.

### 5.2 Escala de Espaciado

-   **Unidad Base**: 4px (por defecto en Tailwind).
-   **Espaciado Común**: `space-y-4`, `p-6`, `gap-8`, etc.

## 6. Componentes Centrales

### 6.1 Botón Primario

```html
<button pButton type="button" class="!bg-primary-500 !border-primary-500 !text-white px-6 py-3 rounded-lg font-semibold hover:!bg-primary-600 transition-colors">
  Acción Primaria
</button>

  

6.2 Componente de Tarjeta (Card)
code Html

    
<div class="rounded-2xl border border-neutral-200 bg-white p-6 shadow-sm">
  <!-- Contenido de la Tarjeta -->
</div>

  

(...y otros componentes base)
7. Implementación
7.1 Configuración de Tailwind
code JavaScript

    
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: { 50: '#eff6ff', /* ... */ 500: '#3b82f6', /* ... */ },
        neutral: { 50: '#fafafa', /* ... */ 900: '#171717', /* ... */ },
      },
      fontFamily: {
        sans: ['Inter', 'Helvetica Neue', 'Arial', 'sans-serif']
      }
    }
  }
}

  

7.2 Integración con Tema de PrimeNG
code Scss

    
// styles.scss
.p-button:not(.p-button-outlined):not(.p-button-text) {
  @apply bg-primary-500 hover:bg-primary-600 text-white;
}

.p-inputtext {
  @apply border-neutral-300 focus:ring-primary-500 focus:border-primary-500;
}

  