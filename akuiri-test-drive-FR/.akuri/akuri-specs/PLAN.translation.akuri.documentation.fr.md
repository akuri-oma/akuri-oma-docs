---
trigger: translation
description: Documento PLAN para el blueprint técnico de la traducción de la documentación Akuri al francés.
---

# PLAN: Blueprint Técnico para Traducción de Documentación Akuri al Francés

## 1. Arquitectura General
El proyecto sigue una estructura de traducción monolítica con fases secuenciales. La arquitectura se basa en replicar exactamente la estructura de akuiri-test-drive-EN/.akuri/ pero con contenido traducido al francés.

## 2. Estructura de Archivos y Directorios

### 2.1 Estructura Base a Crear
```
akuiri-test-drive-FR/.akuri/
├── akuri-docs/
├── akuri-guidelines/
├── akuri-history/
├── akuri-manifest/
├── akuri-patterns/
├── akuri-prompts/
├── akuri-specs/
└── akuri.init.md
```

### 2.2 Archivos a Traducir (37 archivos aproximados)
- akuri.init.md (documento raíz)
- 5 archivos en akuri-guidelines/1_platform/
- 1 archivo en akuri-manifest/
- 2 archivos en akuri-docs/ (akuri.architecture-philosophy.overview.md, akuri.workflow.overview.md)
- 15 archivos en akuri-docs/samples/ (documentos de ejemplo de product management)
- Documentos adicionales en otras carpetas según inventario completado

## 3. Plan de Construcción Funcional

### Fase 1: Preparación de Infraestructura
- Crear estructura de directorios idéntica a akuiri-test-drive-EN/.akuri/
- Verificar existencia de todos los directorios requeridos
- Crear glosario de términos técnicos español-francés

### Fase 2: Traducción por Secciones
- **Sección 1:** akuri.init.md (documento raíz)
- **Sección 2:** akuri-guidelines/1_platform/ (5 archivos)
- **Sección 3:** akuri-manifest/ (1 archivo)
- **Sección 4:** akuri-docs/ (2 archivos principales + 15 archivos en samples/)
- **Sección 5:** akuri-guidelines/2_project/ y 4_security/
- **Sección 6:** akuri-patterns/ y akuri-prompts/
- **Sección 7:** akuri-history/ (registros históricos)

### Fase 3: Validación y Control de Calidad
- Revisión gramatical por hablante nativo
- Verificación contra rúbrica de excelencia
- Comparación estructural con versión en inglés
- Validación de enlaces y referencias cruzadas

## 4. Tecnologías y Herramientas
- **Herramientas de Traducción:** Procesamiento manual con asistencia de herramientas de traducción
- **Control de Versiones:** Git para seguimiento de cambios
- **Validación:** Scripts de comparación de estructura
- **Formato:** Markdown puro, sin modificaciones técnicas

## 5. Convenciones de Nomenclatura
- Archivos: Mismos nombres que versión en inglés
- Directorios: Estructura idéntica
- Contenido: Solo texto narrativo traducido, código y términos técnicos en inglés

## 6. Requisitos de Seguridad
- No se manejan datos sensibles
- Validación de integridad de archivos traducidos
- Backup automático antes de modificaciones

## 7. Pruebas y Validación
- **Pruebas Estructurales:** Verificación de directorios y archivos
- **Pruebas de Contenido:** Validación contra rúbrica de excelencia
- **Pruebas de Integridad:** Comparación con versión original española

## 8. Criterios de Éxito
- Todos los 35+ archivos traducidos
- Estructura idéntica replicada
- Rúbrica de excelencia cumplida al 100%
- Aprobación final del usuario

Este PLAN proporciona el blueprint completo para ejecutar la traducción de manera sistemática y controlada.