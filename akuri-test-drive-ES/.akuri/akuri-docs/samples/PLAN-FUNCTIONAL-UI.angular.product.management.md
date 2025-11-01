---
trigger: sample
description: Ejemplo de PLAN-FUNCTIONAL-UI para gestión de productos en Angular, detallando contenido de archivos UI.
---

# PLAN-FUNCTIONAL-UI: Gestión de Productos (Angular - UI)

## 1. Información General
- **Funcionalidad**: Product Management (UI)
- **Tipo**: Plan Funcional UI (Contenido de Archivos Visuales)
- **Tecnología**: Angular (akuri-oma)
- **Documentos Base**:
  - [`PLAN-STRUCTURE-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE-UI.angular.product.management.md)

## 2. Objetivo
Detallar el contenido exacto de archivos UI (componentes, páginas), incluyendo tecnologías, imports, estilos, interacciones, y convenciones. Permite reconstrucción precisa de la capa visual.

## 3. Detalles por Archivo

### 3.1 product.card.component.ts
- **Tecnologías**: @Component de Angular.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: product.card.component.html, product.card.component.css.
- **Métodos/Objetos/Funciones**:
  - Propiedades: @Input() product: ProductEntity.
  - Métodos: onSelect().
  - Convenciones: camelCase para métodos.

### 3.2 product.card.component.html
- **Tecnologías**: HTML con Angular directives.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Template: <div>{{ product.name }}</div> con *ngIf.
  - Convenciones: camelCase para bindings.

### 3.3 product.card.component.css
- **Tecnologías**: CSS.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Estilos: .card { border: 1px solid #ccc; }.
  - Convenciones: camelCase para clases.

### 3.4 product.list.page.ts
- **Tecnologías**: @Component de Angular.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: product.list.page.html, product.list.page.css.
- **Métodos/Objetos/Funciones**:
  - Propiedades: products: ProductEntity[].
  - Métodos: ngOnInit(), loadProducts().
  - Inyección: constructor(private service: ProductStateService).
  - Convenciones: camelCase para métodos.

### 3.5 product.list.page.html
- **Tecnologías**: HTML con Angular directives.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Template: <product-card *ngFor="let p of products" [product]="p"></product-card>.
  - Convenciones: camelCase para bindings.

### 3.6 product.list.page.css
- **Tecnologías**: CSS/SCSS.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Estilos: .list { display: grid; }.
  - Convenciones: camelCase para clases.

## 4. Tecnologías Específicas
- **PrimeNG**: Para componentes UI (botones, tablas; instalar si no está en manifiesto).
- **Tailwind CSS**: Para estilos utilitarios (instalar si no está).
- **Iconify**: Para iconos (instalar si no está).
- **Angular Directives**: Para bindings (*ngFor, [property]).
- **CSS/SCSS**: Para estilos personalizados.

## 5. Criterios de Aceptación
- Archivos contienen exactamente los elementos listados.
- Compilación sin errores.
- Interacciones funcionales (ej., onSelect dispara evento).
- Convenciones de nombres respetadas.

---

**Estado**: Aprobado para BUILD (UI).