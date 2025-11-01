---
trigger: always_on
description: Blueprint para estandarizar el uso de subcarpetas por funcionalidad en akuri-specs, permitiendo múltiples tareas independientes y mejor organización.
status: active
use_case: [PLAN, BUILD, DESIGN]
---

# [PLAN] Akuri-Specs Organization - Mecanismo Estandarizado

## 1. Propósito
Establecer un mecanismo estandarizado para organizar especificaciones por funcionalidad en subcarpetas dedicadas dentro de `.akuri/akuri-specs/`, permitiendo múltiples tareas independientes sin conflictos y mejor trazabilidad.

## 2. Alcance
- Definir convención de nomenclatura para subcarpetas.
- Establecer estructura estándar dentro de cada subcarpeta.
- Crear workflow para inicializar nuevas funcionalidades.
- Actualizar guidelines existentes.

## 3. Limitaciones
- Solo afecta la organización de documentos en `akuri-specs`.
- No modifica workflows existentes.
- Compatible con estructura actual.

## 4. Criterios de Aceptación
- Convención de nomenclatura definida y documentada.
- Estructura por subcarpeta estandarizada.
- Workflow de inicialización implementado.
- Guidelines actualizados.

## 5. Estructura Estandarizada

### 5.1 Jerarquía de akuri-specs
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

### 5.2 Convención de Nomenclatura
- **Formato:** `[funcionalidad-en-kebab-case]`
- **Reglas:**
  - Usar minúsculas
  - Separar palabras con guiones
  - Nombre descriptivo de la funcionalidad principal
- **Ejemplos:**
  - `product-management`
  - `user-authentication`
  - `workflow-enforcement`
  - `payment-processing`

### 5.3 Contenido Estándar por Subcarpeta
Cada subcarpeta debe contener al menos:
- `[REQUIREMENT].funcionalidad.md`: Definición de qué se necesita
- `[DESIGN].funcionalidad.md`: Solución conceptual
- `[PLAN].funcionalidad.md`: Blueprint técnico
- `[TRACKER].funcionalidad.md`: Seguimiento de progreso

## 6. Workflow de Inicialización

### 6.1 Verificación de Existencia
Al iniciar trabajo en una funcionalidad:
1. Buscar subcarpeta existente: `ls .akuri/akuri-specs/ | grep funcionalidad`
2. Si existe: Usar documentos existentes
3. Si no existe: Crear nueva subcarpeta

### 6.2 Creación de Subcarpeta
```bash
# Crear subcarpeta
mkdir -p .akuri/akuri-specs/[funcionalidad-kebab-case]

# Inicializar documentos base
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[REQUIREMENT].[funcionalidad].md
touch .akuri/akuri-specs/[funcionalidad-kebab-case]/[DESIGN].[funcionalidad].md
# ... etc
```

### 6.3 Workflow por Funcionalidad
- Cada funcionalidad sigue su propio workflow independiente
- TRACKER local permite seguimiento sin interferir con otras tareas
- Archivado opcional al finalizar

## 7. Beneficios
- **Aislamiento:** Funcionalidades independientes
- **Escalabilidad:** Múltiples tareas paralelas
- **Trazabilidad:** Documentos agrupados por funcionalidad
- **Mantenibilidad:** Fácil archivar o mover subcarpetas completas

## 8. Integración con Guidelines
- Actualizar `akuri.05-project-structure.md` con nueva sección sobre `akuri-specs`
- Referencia en `akuri.01-global-rules.md` para organización de especificaciones

## 9. Plan de Construcción
- Crear guideline documentando las reglas
- Actualizar referencias existentes
- Implementar como estándar para futuras funcionalidades