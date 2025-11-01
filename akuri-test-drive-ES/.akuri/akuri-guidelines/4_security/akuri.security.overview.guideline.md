---
trigger: always_on
description: Guía general de ciberseguridad en la Metodología Akuri-OMA, aplicable a todas las fases y tecnologías.
status: active
use_case: [REQUIREMENT, DESIGN, PLAN, BUILD, TESTS, AUDIT]
---

# Guía General de Ciberseguridad en Akuri-OMA

## 1. Principios Fundamentales
La ciberseguridad es un pilar obligatorio en Akuri-OMA. Todas las funcionalidades deben incorporar medidas de seguridad desde el inicio, siguiendo OWASP Top 10 y mejores prácticas. Fallos de seguridad bloquean BUILD hasta corrección.

## 2. Integración en Fases
- **REQUIREMENT**: Incluir "Requisitos de Seguridad" (riesgos, medidas básicas).
- **DESIGN**: Describir medidas narrativamente.
- **PLAN-SECURITY**: Detallar implementación técnica.
- **BUILD**: Implementar (ej., encriptación, guards).
- **TESTS-SECURITY**: Verificar con pruebas específicas.
- **AUDIT**: Checklist post-desarrollo.

## 3. Medidas Comunes
- **Autenticación**: JWT con expiración, refresh tokens.
- **Autorización**: Guards/roles.
- **Validación**: Sanitización de inputs, previniendo XSS/SQLi.
- **Encriptación**: Datos sensibles (passwords con bcrypt).
- **Manejo de Errores**: Mensajes genéricos, no stack traces.
- **Configuración**: Secrets en .env, HTTPS obligatorio.

## 4. Tecnologías por Plataforma
- **NestJS**: @nestjs/jwt, @nestjs/throttler, class-validator.
- **Angular**: Guards, HttpInterceptors para tokens.

Seguridad es "por defecto"; no es opcional.