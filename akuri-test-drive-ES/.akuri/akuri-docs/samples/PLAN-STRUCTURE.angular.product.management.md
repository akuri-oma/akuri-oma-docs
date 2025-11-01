---
trigger: sample
description: Ejemplo de PLAN-STRUCTURE para gestión de productos en Angular, definiendo arquitectura de archivos y capas lógicas + UI.
---

# PLAN-STRUCTURE: Gestión de Productos (Angular)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan Estructural (Arquitectura de Archivos/Capas Lógicas + UI)
- **Tecnología**: Angular (akuri-oma)
- **Ubicación**: `angular-frontend/src/app/modules/product/`
- **Documentos Base**:
  - [`REQUIREMENT.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](angular-frontend/src/app/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objetivo
Definir la estructura de archivos y capas para la funcionalidad, incluyendo lógica (igual al backend) y UI (páginas/componentes). Crea carpetas y archivos base sin contenido funcional detallado. Establece el esqueleto para PLAN-FUNCTIONAL-LOGIC y PLAN-DETAIL-UI/UX posteriores.

## 3. Alcance
### Incluye
- Carpeta raíz: `product/`
- Subcarpetas: `models/`, `services/`, `presentation/` (con `components/` comunes/shared y `pages/`)
- Archivos base: Módulo, servicios, modelos, componentes básicos, rutas.

### Excluye
- Contenido funcional (lógica de métodos, estilos, interacciones) – cubierto en planes funcionales.
- Tests, configuración avanzada.
- UI detallada: Abordada en documento separado (ej., `[PLAN-STRUCTURE-UI]...md`) después de lógica probada.

## 4. Estructura Detallada

### 4.1 Carpeta Raíz
- `product/`: Carpeta principal de la funcionalidad.

### 4.2 Subcarpetas de Primer Nivel
- `models/`: Para DTOs, entidades y respuestas.
- `services/`: Para API, action, logic y state services.
- `presentation/`: Carpeta para capa visual (separada de lógica).
  - `components/`: Componentes comunes/shared reutilizables.
  - `pages/`: Páginas principales (list, create, detail).

### 4.3 Archivos por Capa

#### Models
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.entity.ts` | Entidad UI | Interfaz con campos básicos (id, name, price) |
| `create-product.dto.ts` | DTO para creación | Clase con validaciones (@IsString) |
| `product.response.ts` | Modelo de respuesta | Interfaz para payloads del backend |
| `product.enum.ts` | Enum relacionado | Ej., status, category (opcional si aplica) |

#### Services
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.api.service.ts` | Llamados HTTP | Clase con HttpClient, métodos placeholders |
| `product.logic.service.ts` | Validaciones | Clase con funciones puras |
| `product.state.service.ts` | Estado local | Servicio con Signals/RxJS para cache |

#### Presentation/Components (Comunes/Shared)
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product-list.component.ts` | Lista de productos (común) | Componente shared con selector, reutilizable |

#### Presentation/Pages
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product-list.page.ts` | Página de lista | Componente page con routing, carpeta `product-list-page/` con archivos separados (ts, html, css/scss), subcarpeta `ui/` para componentes específicos |
| `product-detail.page.ts` | Página de detalle | Similar, carpeta `product-detail-page/`, incluye parámetro :id |

**Reglas de Nomenclatura (akuri-oma):**
- Archivos: `[feature].[description].[type].ts/html/css/scss/svg` (ej., `product.list.page.ts`).
- Carpetas de página: `[description]-[type]` (ej., `list-page`).
- UI abordada en documento separado (ej., `[PLAN-STRUCTURE-UI]...md`) después de lógica probada.

#### Configuración
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.routes.ts` | Rutas | Array de Routes con lazy loading |
| `product.module.ts` | Módulo | NgModule con declarations, imports |

## 5. Iteraciones
1. Crear carpetas y archivos base para lógica.
2. Agregar componentes/pages básicos.
3. Validar compilación sin errores.

## 6. Criterios de Aceptación
- Estructura creada y compilable.
- Archivos con esqueletos básicos (imports, decoradores).
- Rutas configuradas sin placeholders.

---

**Estado**: Aprobado para PLAN-FUNCTIONAL-LOGIC y PLAN-DETAIL-UI/UX.