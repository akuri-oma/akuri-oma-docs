---
trigger: plan
description: PLAN para resolver traducciones faltantes en documentación Akuri EN.
---

# PLAN: Resolver Traducciones Faltantes

## Información General
- **Funcionalidad**: Traducciones Faltantes
- **Tipo**: PLAN de Resolución
- **Alcance**: 4 archivos faltantes en `akuiri-test-drive-EN/.akuri`
- **Documentos Base**: `AUDIT.translations.report.md`

## Lista de Faltantes
Basado en AUDIT:
1. `akuri-docs/samples/REQUIREMENT.translation.akuri.documentation.md` - Sample de REQUIREMENT para traducción.
2. `akuri-guidelines/2_project/debug.workflow.md` - Guideline de debug workflow.
3. `akuri-patterns/flutter/PATTERN.state-management.md` - Patrón de state management para Flutter.
4. `akuri-prompts/audit-backend.md` - Prompt para auditoría de backend.

## Plan de Resolución

### Estructural
- Crear archivos faltantes en rutas exactas de ES.
- Mantener formato Markdown y estructura.

### Funcional
- Traducir contenido narrativo al inglés.
- Preservar código técnico intacto.
- Asegurar consistencia terminológica (usar glosario).

### Tests
- Validar traducción con muestreo.
- Verificar formato Markdown.

### Security
- No aplicar; traducciones no modifican seguridad.

## Iteraciones
1. Traducir `REQUIREMENT.translation...` (sample, bajo prioridad).
2. Traducir `debug.workflow.md` (guideline esencial).
3. Traducir `PATTERN.state-management.md` (patrón útil).
4. Traducir `audit-backend.md` (prompt específico).

## Riesgos
- Inconsistencia terminológica; mitigar con glosario.
- Tiempo; estimado 2-4 horas.

## Criterios de Finalización
- Todos los 4 archivos traducidos y presentes.
- Aprobación de calidad.

¿Apruebas este PLAN? Si sí, procedo a BUILD (traducciones).