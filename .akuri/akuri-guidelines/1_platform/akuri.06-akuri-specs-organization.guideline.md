---
trigger: always_on
description: Guideline estandarizado para la organización de especificaciones por funcionalidad en subcarpetas dedicadas dentro de akuri-specs.
status: active
use_case: [PLAN, BUILD, DESIGN, INVENTORY]
---

# Guideline: Organización Estandarizada de akuri-specs

## 1. Propósito
Este guideline establece las reglas estandarizadas para organizar especificaciones por funcionalidad en subcarpetas dedicadas dentro de `.akuri/akuri-specs/`, permitiendo múltiples tareas independientes y mejor trazabilidad.

## 2. Estructura General

### 2.1 Jerarquía de akuri-specs
```
.akuri/akuri-specs/
├── [funcionalidad-kebab-case]/
│   ├── [REQUIREMENT].funcionalidad.md
│   ├── [DESIGN].funcionalidad.md
│   ├── [PLAN].funcionalidad.md
│   ├── [TRACKER].funcionalidad.md
│   └── [otros documentos específicos]
├── [otra-funcionalidad]/
│   └── ...
```

### 2.2 Beneficios de la Estructura
- **Aislamiento:** Cada funcionalidad tiene sus documentos separados
- **Escalabilidad:** Múltiples tareas pueden ejecutarse en paralelo
- **Trazabilidad:** Fácil encontrar todos los documentos relacionados
- **Mantenibilidad:** Archivado o movimiento de subcarpetas completas

## 3. Convención de Nomenclatura

### 3.1 Reglas para Nombres de Subcarpetas
- **Formato:** `[funcionalidad-en-kebab-case]`
- **Características:**
  - Minúsculas únicamente
  - Palabras separadas por guiones (-)
  - Nombre descriptivo de la funcionalidad principal
  - Sin prefijos ni sufijos genéricos

### 3.2 Ejemplos Válidos
- `product-management` (gestión de productos)
- `user-authentication` (autenticación de usuarios)
- `payment-processing` (procesamiento de pagos)
- `workflow-enforcement` (aplicación de workflows)
- `inventory-tracking` (seguimiento de inventario)

### 3.3 Ejemplos Inválidos
- ❌ `ProductManagement` (usa camelCase)
- ❌ `user_auth` (usa underscores)
- ❌ `feature-001` (genérico, no descriptivo)
- ❌ `new-functionality` (demasiado genérico)

## 4. Contenido Estándar por Subcarpeta

### 4.1 Documentos Obligatorios
Cada subcarpeta DEBE contener al menos:
- `[REQUIREMENT].funcionalidad.md`: Definición de requisitos
- `[DESIGN].funcionalidad.md`: Solución conceptual
- `[PLAN].funcionalidad.md`: Blueprint técnico
- `[TRACKER].funcionalidad.md`: Seguimiento de progreso

### 4.2 Documentos Opcionales
Según la complejidad de la funcionalidad:
- `[INVENTORY].funcionalidad.md`: Lista de características
- `[PATTERN].funcionalidad.md`: Patrones reutilizables
- `[HANDOVER].funcionalidad.md`: Contrato backend-frontend
- Documentos específicos del dominio

## 5. Workflow de Inicialización

### 5.1 Verificación de Existencia
Al iniciar trabajo en una funcionalidad:
1. **Buscar subcarpeta existente:**
   ```bash
   ls .akuri/akuri-specs/ | grep [funcionalidad-kebab-case]
   ```
2. **Si existe:** Usar documentos existentes y continuar workflow
3. **Si no existe:** Proceder a creación

### 5.2 Creación de Nueva Subcarpeta
```bash
# 1. Crear subcarpeta
mkdir -p .akuri/akuri-specs/[funcionalidad-kebab-case]

# 2. Inicializar documentos base
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[REQUIREMENT].[funcionalidad].md
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[DESIGN].[funcionalidad].md
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[PLAN].[funcionalidad].md
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[TRACKER].[funcionalidad].md
```

### 5.3 Inicialización con Templates
Usar templates de `.akuri/akuri-workflow/templates/` para inicializar documentos:
```bash
# Copiar template de REQUIREMENT
cp .akuri/akuri-workflow/templates/requirement.template.md \
   .akuri/akuri-specs/[funcionalidad-kebab-case]/[REQUIREMENT].[funcionalidad].md
```

## 6. Gestión del Ciclo de Vida

### 6.1 Durante Desarrollo
- Mantener todos los documentos activos en la subcarpeta
- TRACKER local permite seguimiento independiente
- No interferir con otras funcionalidades

### 6.2 Al Finalizar
- **Archivado opcional:** Mover subcarpeta completa a `.akuri/akuri-history/`
- **Decisión por desarrollador:** Basada en importancia histórica
- **Limpieza:** Eliminar solo si no tiene valor de referencia

## 7. Casos Especiales

### 7.1 Funcionalidades Relacionadas
Para funcionalidades relacionadas pero independientes:
```
.akuri/akuri-specs/
├── user-management/
├── user-authentication/
└── user-profiles/
```

### 7.2 Funcionalidades Grandes
Para funcionalidades muy complejas, considerar subdivisión:
```
.akuri/akuri-specs/
└── e-commerce-platform/
    ├── product-catalog/
    ├── shopping-cart/
    ├── payment-gateway/
    └── order-management/
```

### 7.3 Migración de Documentos Existentes
Documentos existentes fuera de subcarpetas:
1. Crear subcarpeta apropiada
2. Mover documentos existentes
3. Actualizar referencias

## 8. Referencias
- Ver `akuri.05-project-structure.md` para estructura general
- Ver `akuri.01-global-rules.md` para reglas operativas
- Ver `akuri-workflow/templates/` para plantillas disponibles