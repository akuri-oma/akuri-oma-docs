---
trigger: always_on
description: Define la estructura estándar de proyectos en la Metodología Akuri-oma, incluyendo la organización de la carpeta .akuri y sus subcarpetas.
status: active
---

# Estructura Estándar de Proyectos Akuri

## 1. Carpeta .akuri

Cada proyecto debe contener una carpeta `.akuri` con la siguiente estructura:

### akuri-docs/
- Documentación específica del proyecto
- Manuales de usuario
- Diagramas de arquitectura

### akuri-guidelines/
- Guías de implementación específicas
- Patrones arquitectónicos
- Convenciones de código

### akuri-history/
- Historial de cambios
- Registros de decisiones técnicas
- Bitácoras de desarrollo

### akuri-manifest/
- Manifiesto del proyecto
- Tecnologías y dependencias
- Restricciones técnicas

### akuri-prompts/
- Prompt iniciales del proyecto
- Requisitos funcionales
- Casos de uso

### akuri-work/
- Trabajo en progreso
- Documentos temporales
- Borradores

### akuri-tasks/
- Listas de tareas
- Seguimiento de issues
- Planificación

## 2. Flujo de Inicialización

1. Crear la estructura base del proyecto
2. Inicializar la carpeta `.akuri` con las subcarpetas estándar
3. Crear los documentos iniciales mínimos:
   - `project.manifest.md`
   - `project.guideline.md`
   - `project.history.md`
4. Integrar el proyecto con el manifiesto de la plataforma

## 3. Plantillas Base

Se proveerán plantillas mínimas para cada tipo de documento en la carpeta `.akuri/templates/`

## 4. Carpeta akuri-specs por Funcionalidad

### 4.1 Ubicación y Propósito
La carpeta `.akuri/akuri-specs/` centraliza especificaciones organizadas por funcionalidad en subcarpetas dedicadas. Cada funcionalidad independiente debe tener su propia subcarpeta siguiendo la convención estandarizada.

**Propósito principal:**
- Centralizar los documentos "vivos" relacionados con cada funcionalidad
- Permitir múltiples tareas independientes sin conflictos
- Facilitar trazabilidad y acceso rápido durante desarrollo
- Mantener aislamiento entre funcionalidades

### 4.2 Estructura Estandarizada
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

### 4.3 Convención de Nomenclatura
- **Formato:** `[funcionalidad-en-kebab-case]` (ej., `product-management`, `user-authentication`)
- **Reglas:** Minúsculas, palabras separadas por guiones, nombre descriptivo
- Ver `akuri.06-akuri-specs-organization.guideline.md` para reglas completas

### 4.4 Contenido por Subcarpeta
**Documentos obligatorios:**
- `[REQUIREMENT].funcionalidad.md`: Definición de requisitos
- `[DESIGN].funcionalidad.md`: Solución conceptual
- `[PLAN].funcionalidad.md`: Blueprint técnico
- `[TRACKER].funcionalidad.md`: Seguimiento de progreso

**Documentos opcionales:**
- `[INVENTORY].funcionalidad.md`: Lista de características
- `[PATTERN].funcionalidad.md`: Patrones reutilizables
- `[HANDOVER].funcionalidad.md`: Contrato backend-frontend

### 4.5 Workflow de Inicialización
Al iniciar trabajo en una funcionalidad:
1. **Verificar existencia:** Buscar subcarpeta en `.akuri/akuri-specs/`
2. **Si existe:** Usar documentos existentes
3. **Si no existe:** Crear subcarpeta y documentos base usando templates

### 4.6 Gestión del Ciclo de Vida
- **Durante desarrollo:** Mantener documentos activos en subcarpeta
- **Al finalizar:** Archivado opcional a `.akuri/akuri-history/` (decisión del desarrollador)
- **Paralelismo:** Múltiples funcionalidades pueden desarrollarse simultáneamente

### 4.7 Ejemplo de Estructura
```
.akuri/akuri-specs/
├── product-management/
│   ├── [REQUIREMENT].product-management.md
│   ├── [DESIGN].product-management.md
│   ├── [PLAN].product-management.md
│   └── [TRACKER].product-management.md
├── user-authentication/
│   ├── [REQUIREMENT].user-authentication.md
│   └── ...
└── payment-processing/
    └── ...
```

### 4.8 Referencias
- Ver `akuri.06-akuri-specs-organization.guideline.md` para reglas detalladas
- Ver `akuri-workflow/templates/` para plantillas disponibles
- Ver `akuri-workflow/examples/` para casos de uso