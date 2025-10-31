---
trigger: sample
description: Ejemplo de PLAN-STRUCTURE para gestión de productos en NestJS, definiendo arquitectura de archivos y capas.
---

# PLAN-STRUCTURE: Gestión de Productos (NestJS)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan Estructural (Arquitectura de Archivos/Capas)
- **Tecnología**: NestJS (akuri-oma)
- **Ubicación**: `nest-backend/src/modules/product/`
- **Documentos Base**:
  - [`REQUIREMENT.product-management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product-management.md)
  - [`DESIGN.product-management.md`](nest-backend/src/modules/product/akuri-specs/DESIGN.product-management.md)

## 2. Objetivo
Definir la estructura de archivos y capas para la funcionalidad, creando carpetas y archivos base sin contenido funcional detallado. Esto establece el esqueleto para el PLAN-FUNCTIONAL posterior.

## 3. Alcance
### Incluye
- Carpeta raíz: `product/`
- Subcarpetas: `controllers/`, `services/`, `models/`
- Archivos base: Módulo, controlador, servicio, DTOs básicos, entidad.

### Excluye
- Contenido funcional (lógica de métodos, validaciones detalladas) – cubierto en PLAN-FUNCTIONAL.
- Tests, configuración avanzada.

## 4. Estructura Detallada

### 4.1 Carpeta Raíz
- `product/`: Carpeta principal de la funcionalidad.

### 4.2 Subcarpetas de Primer Nivel
- `controllers/`: Para controladores REST.
- `services/`: Para servicios de lógica de negocio.
- `models/`: Para DTOs, entidades y respuestas.

### 4.3 Archivos por Capa

#### Controllers
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.controller.ts` | Exposición de endpoints REST | Decoradores @Controller, métodos básicos (GET, POST, etc.) |

#### Services
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.service.ts` | Lógica de negocio | Clase con inyección de dependencias, métodos placeholders |

#### Models
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.entity.ts` | Entidad de base de datos | Decoradores TypeORM (@Entity, @Column) |
| `create-product.dto.ts` | DTO para creación | Clase con validaciones básicas (@IsString, etc.) |
| `update-product.dto.ts` | DTO para actualización | Similar, con campos opcionales |
| `product.response.ts` | Modelo de respuesta | Interfaz para payloads de salida |
| `product.enum.ts` | Enum relacionado | Ej., status, category (opcional si aplica) |

#### Configuración
| Archivo | Propósito | Detalles Técnicos |
| --- | --- | --- |
| `product.module.ts` | Módulo NestJS | @Module con imports, controllers, providers |

## 5. Iteraciones
1. Crear carpetas y archivos base.
2. Validar compilación sin errores.

## 6. Criterios de Aceptación
- Estructura creada y compilable.
- Archivos con esqueletos básicos (imports, decoradores).

---

**Estado**: Aprobado para PLAN-FUNCTIONAL.