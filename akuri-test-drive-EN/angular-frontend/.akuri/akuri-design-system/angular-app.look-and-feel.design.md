---
trigger: model_decision
description: Master visual guide for Angular Akuri projects. Defines the visual design system, including color palettes, typography, layout, spacing, and styles for core components, integrating Tailwind CSS and PrimeNG.
status: active
linked_files: []
use_case: BUILD, REFACTOR, AUDIT
---

# Look & Feel Design System (`angular-app.look-and-feel.design.md`)

## 1. Introduction and Purpose

This document defines the visual system for Angular frontend projects, ensuring consistency across all pages and components. It establishes Tailwind CSS utilities aligned with PrimeNG components, creating a cohesive design language.

## 2. Design Philosophy

-   **Tailwind-First:** All styling prioritizes Tailwind CSS utilities over custom CSS.
-   **Integration with PrimeNG:** PrimeNG components are adapted with Tailwind tokens for greater consistency.
-   **Responsive Design:** "Mobile-first" approach with progressive enhancement.
-   **Accessibility:** WCAG AA compliance with proper contrast ratios and semantic markup.
-   **Performance:** Optimized loading with efficient use of CSS and components.

## 3. Color Palette and Design Tokens

### 3.1 Primary Color Scheme

| Token       | HEX       | Tailwind Utility | Usage                                        |
| ----------- | --------- | ---------------- | ------------------------------------------ |
| Primary 50  | `#eff6ff` | `bg-blue-50`     | Light backgrounds, subtle highlights       |
| Primary 500 | `#3b82f6` | `bg-blue-500`    | Primary buttons, links, accents            |
| Primary 600 | `#2563eb` | `bg-blue-600`    | Darker accents, hover states               |
| Primary 700 | `#1d4ed8` | `bg-blue-700`    | Text on light backgrounds                  |

*(...and the rest of the primary color scale)*

### 3.2 Neutral Color Scheme

| Token       | HEX       | Tailwind Utility   | Usage                                        |
| ----------- | --------- | ------------------ | ------------------------------------------ |
| Neutral 50  | `#fafafa` | `bg-neutral-50`    | Page backgrounds, light sections           |
| Neutral 200 | `#e5e5e5` | `bg-neutral-200`   | Borders, dividers                          |
| Neutral 300 | `#d4d4d4` | `bg-neutral-300`   | Input borders                              |
| Neutral 600 | `#525252` | `bg-neutral-600`   | Body text                                  |
| Neutral 900 | `#171717` | `bg-neutral-900`   | Primary titles, hero backgrounds           |

*(...and the rest of the neutral color scale)*

### 3.3 Semantic Colors

| Token   | HEX       | Tailwind Utility   | Usage                                        |
| ------- | --------- | ------------------ | ------------------------------------------ |
| Success | `#10b981` | `bg-emerald-500`   | Success states, confirmations              |
| Warning | `#f59e0b` | `bg-amber-500`     | Warnings, attention states                 |
| Error   | `#ef4444` | `bg-red-500`       | Errors, destructive actions                |
| Info    | `#3b82f6` | `bg-blue-500`      | Information, neutral states                |

## 4. Typography

### 4.1 Font Family

-   **Primary Font**: Inter (Google Fonts)
-   **Fallback**: `"Helvetica Neue", Arial, sans-serif`

### 4.2 Typographic Scale

| Element       | Size           | Weight           | Line Height    | Usage                |
| -------------- | ---------------- | -------------- | ------------------ | ------------------ |
| Display Large  | `text-5xl` (48px) | `font-bold`    | `leading-tight`    | Hero titles         |
| Heading 1      | `text-3xl` (30px) | `font-semibold` | `leading-tight`    | Page titles         |
| Body Regular   | `text-base` (16px) | `font-normal`   | `leading-relaxed`  | Body text           |
| Caption        | `text-xs` (12px) | `font-medium`   | `leading-normal`   | Labels, metadata    |

*(...and the rest of the typographic scale)*

## 5. Layout and Spacing

### 5.1 Container System

-   **Max Width**: `max-w-7xl` (1280px) for main content.
-   **Padding**: `px-6` (24px) on mobile, `lg:px-8` (32px) on desktop.

### 5.2 Spacing Scale

-   **Base Unit**: 4px (default in Tailwind).
-   **Common Spacing**: `space-y-4`, `p-6`, `gap-8`, etc.

## 6. Core Components

### 6.1 Primary Button

```html
<button pButton type="button" class="!bg-primary-500 !border-primary-500 !text-white px-6 py-3 rounded-lg font-semibold hover:!bg-primary-600 transition-colors">
  Primary Action
</button>
```

### 6.2 Card Component

```html
<div class="rounded-2xl border border-neutral-200 bg-white p-6 shadow-sm">
  <!-- Card Content -->
</div>
```

*(...and other base components)*

## 7. Implementation

### 7.1 Tailwind Configuration

```javascript
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
```

### 7.2 Integration with PrimeNG Theme

```scss
// styles.scss
.p-button:not(.p-button-outlined):not(.p-button-text) {
  @apply bg-primary-500 hover:bg-primary-600 text-white;
}

.p-inputtext {
  @apply border-neutral-300 focus:ring-primary-500 focus:border-primary-500;
}