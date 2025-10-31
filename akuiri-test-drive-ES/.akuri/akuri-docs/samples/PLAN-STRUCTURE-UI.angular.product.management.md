---
trigger: sample
description: Ejemplo de PLAN-STRUCTURE-UI para gestión de productos en Angular, definiendo estructura visual de páginas y componentes.
---

# PLAN-STRUCTURE-UI: Gestión de Productos (Angular)

## 1. Información General
- **Funcionalidad**: Product Management UI
- **Tipo**: Plan Estructural de UI (Arquitectura Visual)
- **Tecnología**: Angular (akuri-oma)
- **Ubicación**: `angular-frontend/src/app/modules/product/presentation/`
- **Documentos Base**:
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)
  - [`PLAN-STRUCTURE.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.product-management.md)
  - [`PLAN-FUNCTIONAL-LOGIC.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-LOGIC.product-management.md)

**Nota:** Este plan se crea después de que la lógica esté construida y probada. Aborda páginas por separado con pruebas en vivo antes de pasar a la siguiente.

## 2. Objetivo
Definir la estructura visual de páginas y componentes específicos, siguiendo nomenclatura akuri-oma. Crea carpetas y archivos base para UI sin contenido funcional detallado (estilos, interacciones).

## 3. Alcance
### Incluye
- Páginas: list, create, detail (cada una en carpeta separada con archivos ts, html, css/scss, subcarpeta ui).
- Componentes comunes/shared en `components/`.
- Nomenclatura: Archivos `[feature].[description].[type].ts/html/css/scss`; Carpetas `[description]-[type]`.

### Excluye
- Lógica (ya cubierta en planes anteriores).
- Contenido funcional (estilos detallados, interacciones) – cubierto en PLAN-DETAIL-UI/UX.
- Tests.

## 4. Estructura Detallada

### 4.1 Components (Comunes/Shared)
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.card.component.ts` | Tarjeta de producto | Componente shared |
| `product.card.component.html` | Template | Archivo HTML (sustituible por .svg) |
| `product.card.component.css` | Estilos | Archivo CSS (sustituible por .scss) |

### 4.2 Pages
#### product-list-page/
- Archivos: `product.list.page.ts`, `product.list.page.html`, `product.list.page.css`
- Subcarpeta `ui/`: Componentes específicos (ej., `product.filter.component.ts`, `product.filter.component.html`, `product.filter.component.css`)

#### product-create-page/
- Archivos: `product.create.page.ts`, `product.create.page.html`, `product.create.page.scss`
- Subcarpeta `ui/`: Componentes específicos (ej., `product.form.component.ts`, `product.form.component.html`, `product.form.component.scss`)

#### product-detail-page/
- Archivos: `product.detail.page.ts`, `product.detail.page.html`, `product.detail.page.scss`
- Subcarpeta `ui/`: Componentes específicos (ej., `product.actions.component.ts`, `product.actions.component.html`, `product.actions.component.scss`)

## 5. Iteraciones
1. Crear página list con ui básica, probar en vivo.
2. Crear página create, probar.
3. Crear página detail, probar.

## 6. Criterios de Aceptación
- Estructura creada, archivos compilables.
- Nomenclatura correcta.
- Páginas accesibles vía routing.

---

**Estado**: Aprobado para PLAN-DETAIL-UI/UX.