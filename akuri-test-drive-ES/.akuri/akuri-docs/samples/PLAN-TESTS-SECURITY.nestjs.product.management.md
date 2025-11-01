---
trigger: sample
description: Ejemplo de PLAN-TESTS-SECURITY para gestión de productos en NestJS, definiendo pruebas de ciberseguridad.
---

# PLAN-TESTS-SECURITY: Gestión de Productos (NestJS)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan de Pruebas de Seguridad
- **Tecnología**: NestJS (Jest, herramientas de seguridad)
- **Documentos Base**:
  - [`PLAN-SECURITY.nestjs.product.management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-SECURITY.nestjs.product.management.md)

## 2. Objetivo
Definir pruebas que verifiquen cumplimiento de medidas de seguridad, previniendo vulnerabilidades.

## 3. Pruebas por Categoría

### 3.1 Autenticación
- **Pruebas**: Verificar guards bloquean requests sin JWT válido, tokens expirados fallan.
- **Herramientas**: Supertest para simular requests.

### 3.2 Validación
- **Pruebas**: Inputs maliciosos (SQL injection: "'; DROP TABLE;") son rechazados.
- **Criterios**: DTOs lanzan errores de validación.

### 3.3 Manejo de Errores
- **Pruebas**: Endpoints no exponen stack traces, devuelven mensajes genéricos.

## 4. Métricas
- **Cobertura de Seguridad**: 100% en endpoints críticos.
- **OWASP Compliance**: Verificar Top 10 riesgos mitigados.

## 5. Criterios de Aceptación
- Todas las pruebas pasan sin vulnerabilidades conocidas.
- Reporte de seguridad generado.

---

**Estado**: Aprobado para BUILD.