---
trigger: plan
description: Documento PLAN para la traducción sistemática de la documentación Akuri del español al inglés.
---

# PLAN: Traducción Sistemática de Documentación Akuri al Inglés

## 1. Estructura Arquitectónica

### Jerarquía de Directorios
Mantener jerarquía exacta de directorios:
- `akuri-docs/`
- `akuri-guidelines/`
- `akuri-manifest/`
- `akuri-patterns/`
- `akuri-prompts/`
- `akuri-history/`

### Replicación de Subcarpetas
Replicar estructura de subcarpetas:
- `1_platform/`, `2_project/`, `3_technology/`, `4_security/`
- `samples/`
- `angular/`, `nestjs/`, `flutter/`

## 2. Plan Funcional por Categorías

### 2.1 Documentos Core (4 archivos)
- `akuri.init.md`
- `platform.manifest.md`
- `akuri.architecture-philosophy.overview.md`
- `akuri.workflow.overview.md`

### 2.2 Guidelines de Plataforma (5 archivos)
- `akuri.01-global-rules.md`
- `akuri.02-platform-terminal.md`
- `akuri.03-platform-requirements.md`
- `akuri.04-glossary.md`
- `akuri.05-project-structure.md`

### 2.3 Guidelines de Proyecto (4 archivos)
- `akuri.progressive-scaffolding-workflow.guideline.md`
- `audit-refactor.workflow.md`
- `audit.workflow.md`
- `debug.workflow.md`

### 2.4 Guidelines Técnicos (2 archivos)
- Terminal: 1 archivo en `3_technology/terminal/`
- Security: `akuri.security.overview.guideline.md`

### 2.5 Patterns (7 archivos)
- Angular: 6 patterns en `akuri-patterns/angular/`
  - `PATTERN.action-service.md`
  - `PATTERN.api-crud-service.md`
  - `PATTERN.feature-entry.md`
  - `PATTERN.feature-routes.md`
  - `PATTERN.feature-state.md`
  - `PATTERN.http-service.md`
- NestJS: 1 pattern en `akuri-patterns/nestjs/`
  - `PATTERN.crud-service.md`
- Flutter: 1 pattern (no traducir si no aplica)

### 2.6 Prompts (5 archivos)
- `audit.promt.md`
- `build-complex-feature.prompt.md`
- `handover.prompt.md`
- `refactor.prompt.md`
- `start-task.prompt.md`

### 2.7 Samples (16 archivos)
- DESIGN: 1 archivo
- PLAN: 8 archivos (FUNCTIONAL, STRUCTURE, TESTS, SECURITY variants)
- REQUIREMENT: 1 archivo
- TRACKER: 2 archivos
- HANDOVER: 1 archivo

**Total: 35 archivos .md para traducción**

## 3. Plan de Tests

### Verificación de Estructura de Directorios
- Comparar estructura de directorios ES vs EN
- Validar existencia de todas las subcarpetas
- Confirmar nombres de archivos idénticos

### Validación de Traducciones
- Muestreo del 20% de archivos traducidos
- Revisión de precisión terminológica
- Verificación de consistencia de idioma

### Verificación de Integridad de Archivos
- Validar formato markdown preservado
- Confirmar código técnico intacto
- Revisar enlaces y referencias

### Pruebas de Consistencia Terminológica
- Glosario de términos técnicos Akuri
- Validación de traducciones consistentes
- Revisión de siglas y acrónimos

## 4. Plan de Seguridad

### Backup de Archivos Originales
- Crear backup completo de `akuiri-test-drive-ES/.akuri/`
- Almacenar en ubicación segura antes de traducción

### Control de Versiones
- Usar Git para tracking de cambios
- Commits separados por categorías de archivos
- Branches para versiones de traducción

### Validación de No Modificación
- Scripts de verificación para detectar cambios no autorizados
- Comparación hash de archivos técnicos
- Auditoría de integridad de código

## 5. Flujo de Ejecución

1. **Fase de Preparación**
   - Backup de archivos originales
   - Configuración de repositorio Git
   - Creación de estructura de directorios EN

2. **Fase de Traducción por Categorías**
   - Core → Guidelines → Patterns → Prompts → Samples

3. **Fase de Validación**
   - Tests de estructura
   - Validación de traducciones
   - Pruebas de consistencia

4. **Fase de Finalización**
   - Verificación final
   - Documentación de cambios
   - Aprobación del deliverable

---

**Nota:** Este PLAN es inmutable una vez aprobado. Cualquier cambio requiere nueva aprobación.