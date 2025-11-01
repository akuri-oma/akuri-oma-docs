---
trigger: overview
description: Descripción general de la arquitectura OMA y la filosofía Akuri en la Metodología Akuri-OMA.
---

# Arquitectura OMA y Filosofía Akuri

## Introducción
La Metodología Akuri-OMA (Oriented Methodology Architecture) es un framework riguroso para el desarrollo de software, diseñado para garantizar calidad, trazabilidad y seguridad en proyectos tecnológicos. Combina principios de ingeniería civil con mejores prácticas de desarrollo, enfatizando la documentación viva y la validación progresiva. Su nombre refleja la "arquitectura orientada a metodología" (OMA), donde cada fase del proceso está estructurada para minimizar riesgos y maximizar eficiencia.

## Filosofía Akuri
La filosofía Akuri se basa en el "Desarrollo Orientado por Especificaciones", un enfoque disciplinario que prioriza la claridad y la rigidez sobre la improvisación. Sus principios fundamentales son:

- **Especificaciones como Base**: Todo desarrollo comienza con documentos detallados (REQUIREMENT, DESIGN, PLAN), que definen "qué" se necesita antes de "cómo" implementarlo. Esto evita soluciones "bonitas" pero no alineadas con el usuario.
- **Rigidez y Trazabilidad**: Los planes son "rígidos como planos de ingeniería civil"; cambios requieren nuevos documentos. Cada paso se valida con el usuario, asegurando avance progresivo sin retrocesos inesperados.
- **Integración de IA con Límites**: Los agentes IA (como este) operan en modos definidos (CREATIVO para exploración, DICTATORIAL para ejecución), con reglas estrictas para prevenir improvisaciones. La IA es una herramienta, no un reemplazo de la metodología.
- **Calidad y Seguridad por Defecto**: Pruebas y seguridad están integradas en todas las fases, siguiendo estándares como OWASP. No hay "opcionales"; fallos bloquean el progreso.
- **Colaboración y Mejora Continua**: Enfatiza feedback del usuario y documentación viva, permitiendo auditorías y escalabilidad. La metodología evoluciona con lecciones aprendidas.

En esencia, Akuri transforma el desarrollo caótico en un proceso predecible, como construir una casa con planos precisos en lugar de improvisar.

## Arquitectura OMA
La arquitectura OMA organiza el desarrollo en capas y fases interconectadas, formando un "esqueleto" que guía desde la idea hasta el producto final. Está dividida en:

### 1. Capas de Gobernanza
- **Documentos Maestros**: Glosario, guidelines y manifiestos que definen reglas globales y tecnologías restrictivas.
- **Artefactos del Flujo**: REQUIREMENT, DESIGN, PLAN (subtipos: STRUCTURE, FUNCTIONAL, TESTS, SECURITY), TRACKER, HANDOVER.
- **Modos Operativos**: CREATIVO (analítico, preguntas) y DICTATORIAL (ejecutor, precisión).

### 2. Fases del Proceso
1. **Triaje**: Clasificación inicial de la solicitud del usuario.
2. **Especificación**: REQUIREMENT (qué) → DESIGN (solución conceptual).
3. **Planificación**: PLAN (blueprint técnico rígido).
4. **Ejecución**: BUILD con TRACKER (seguimiento progresivo).
5. **Integración**: HANDOVER (contrato backend-frontend).
6. **Validación**: Pruebas, auditorías y cierre.

### 3. Integraciones Clave
- **Tecnologías**: Soporte para stacks como NestJS (backend), Angular (frontend), con patrones funcionales y seguridad integrada.
- **Seguridad**: Pilar obligatorio, con PLAN-SECURITY y pruebas dedicadas.
- **Escalabilidad**: Aplicable a funcionalidades nuevas o modificaciones existentes, con separación frontend/backend.

### 4. Beneficios de la Arquitectura
- **Reducción de Riesgos**: Validación paso a paso previene errores costosos.
- **Eficiencia**: Documentos reutilizables aceleran desarrollo futuro.
- **Calidad Garantizada**: Pruebas y seguridad integradas aseguran productos robustos.
- **Adaptabilidad**: Evoluciona con nuevas tecnologías sin perder rigidez.

Akuri-OMA no es solo una metodología; es una cultura de desarrollo disciplinada, donde la arquitectura OMA proporciona el marco para ejecutar la filosofía Akuri de manera consistente y segura.