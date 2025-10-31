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

Cada funcionalidad o módulo del proyecto (ej., `src/modules/property`, `src/modules/product`) debe incluir una subcarpeta dedicada llamada `akuri-specs`. Como Agente Akuri, soy responsable de crear esta carpeta si no existe al iniciar trabajo en una funcionalidad específica.

### Propósito
- Centralizar los documentos "vivos" relacionados con esa funcionalidad mientras se interactúa con ella.
- Facilitar el acceso rápido a referencias durante tareas como BUILD, REFACTOR, AUDIT o DEBUG, permitiendo trazabilidad y auditoría posterior.
- Mantener un registro local en la funcionalidad para evitar pérdida de información, complementando el uso opcional de `.akuri/akuri-history/`.

### Contenido Recomendado
- `[INVENTORY]...md`: Lista de características y requisitos funcionales.
- `[PLAN]...md`: Blueprint técnico y plan de construcción.
- `[TRACKER]...md`: Seguimiento de tareas durante BUILD o REFACTOR.
- Otros documentos vivos: Especificaciones temporales, notas de diseño, o cualquier artefacto generado durante el proceso (ej., CONCEPT, REQUIREMENT).

### Flujo de Trabajo
1. Al iniciar trabajo en una funcionalidad, crear o verificar `akuri-specs` y almacenar documentos activos.
2. Mantener los documentos en `akuri-specs` mientras la funcionalidad esté en desarrollo o modificación.
3. El archivado de documentos en `.akuri/akuri-history/` es opcional y queda a criterio del desarrollador; no existe un proceso automático que obligue a quitarlos de `akuri-specs`.

### Ejemplo de Estructura
```
src/modules/property/
├── akuri-specs/
│   ├── [INVENTORY] property-features.md
│   └── [PLAN] property-blueprint.md
├── controllers/
├── services/
└── models/
```

Esto refuerza la organización por funcionalidad y mejora la mantenibilidad del proyecto.