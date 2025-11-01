---
trigger: model_decision
description: Standards for the use of icons in Angular Akuri projects. Defines supported icon sets (Heroicons, PrimeNG), loading strategy, naming conventions, sizes, colors, and best practices.
status: active
linked_files: [`angular-app.look-and-feel.design.md`]
use_case: BUILD, REFACTOR, AUDIT
---

# Iconography Guide (`angular-app.iconography.design.md`)

## 1. Introduction and Purpose

This document establishes the guidelines for the use of icons in Angular projects, ensuring consistency, performance, and maintainability, based on lessons learned from build failures related to icons.

## 2. Icon System Architecture

### Supported Icon Sets

The project uses multiple icon sources through the Iconify framework.

#### Primary Icon Sets

-   **Heroicons:** Primary set for UI elements.
    -   `heroicons-outline-*`
    -   `heroicons-solid-*`
-   **PrimeNG Icons:** Integrated with PrimeNG components.
    -   `pi pi-*`

### Icon Loading Strategy

-   **Tree-shaking:** Only used icons are included in the bundle.
-   **Lazy loading:** Icons are loaded on demand.

## 3. Implementation Guidelines

### 3.1 Naming Convention

```typescript
// ✅ Correct Usage
class="icon-[heroicons-solid--document-minus]"
class="icon-[heroicons-outline--user]"
class="pi pi-user" // PrimeNG Icons
```

### 3.2 Size Standards

YOU must use Tailwind size classes to control icon size.

```html
<!-- Standard Sizes -->
<i class="icon-[heroicons-solid--user] text-sm"></i>    <!-- 14px -->
<i class="icon-[heroicons-solid--user] text-base"></i>  <!-- 16px -->
<i class="icon-[heroicons-solid--user] text-xl"></i>    <!-- 20px -->
```

### 3.3 Color Guidelines

YOU must use the semantic and neutral colors defined in `angular-app.look-and-feel.design.md`.

```html
<!-- Semantic Colors -->
<i class="icon-[heroicons-solid--check-circle] text-emerald-500"></i>  <!-- Success -->
<i class="icon-[heroicons-solid--x-circle] text-red-500"></i>          <!-- Error -->

<!-- Neutral Colors -->
<i class="icon-[heroicons-solid--user] text-neutral-600"></i>  <!-- Default -->
```

## 4. Common Icon Mappings

### CRUD Operations
| Action          | Heroicons Icon          | PrimeNG Alternative |
|-----------------|-------------------------|---------------------|
| Create          | `heroicons-solid--plus` | `pi pi-plus`        |
| Read/View       | `heroicons-solid--eye`  | `pi pi-eye`         |
| Update/Edit     | `heroicons-solid--pencil` | `pi pi-pencil`     |
| Delete          | `heroicons-solid--trash` | `pi pi-trash`      |

### States
| State           | Heroicons Icon                  | Color            |
|-----------------|---------------------------------|------------------|
| Success         | `heroicons-solid--check-circle` | `text-emerald-500` |
| Warning         | `heroicons-solid--exclamation-triangle` | `text-amber-500` |
| Error           | `heroicons-solid--x-circle`     | `text-red-500`   |
| Information     | `heroicons-solid--information-circle` | `text-blue-500` |

## 5. Best Practices (Do's and Don'ts)

### ✅ Do's
-   Use Heroicons as the primary icon set.
-   Prefer outline icons for UI elements and solid icons for actions.
-   Use semantic colors for state icons.
-   Include tooltips (`pTooltip`) for icon-only buttons.

### ❌ Don'ts
-   Do not use other icon sets (e.g., MDI) without clear justification.
-   Do not mix icon sets within the same component.
-   Do not rely solely on color to convey meaning (accessibility).