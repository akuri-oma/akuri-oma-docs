---
trigger: sample
description: Ejemplo de PLAN-SECURITY para gestión de productos en NestJS, definiendo medidas de ciberseguridad.
---

# PLAN-SECURITY: Gestión de Productos (NestJS)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan de Seguridad
- **Tecnología**: NestJS
- **Riesgos Identificados**: Exposición de datos sensibles (precios, stock), inyección SQL, acceso no autorizado.
- **Documentos Base**:
  - [`REQUIREMENT.product.management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product.management.md)

## 2. Objetivo
Definir e implementar medidas de ciberseguridad para proteger datos y prevenir ataques, alineadas con riesgos y criterios de aceptación.

## 3. Medidas de Seguridad

### 3.1 Autenticación y Autorización
- **JWT Tokens**: Usar @nestjs/jwt para tokens con expiración (15 min), refresh tokens seguros.
- **Guards**: @UseGuards(JwtAuthGuard) en controladores para validar tokens.
- **Rate Limiting**: 100 requests/min por IP usando @nestjs/throttler.

### 3.2 Validación y Sanitización
- **DTOs Seguros**: Validaciones en CreateProductDto (evitar XSS con @IsString, SQL injection con sanitización).
- **Encriptación**: No requerida para productos básicos, pero logging sin datos sensibles.

### 3.3 Manejo de Errores
- **Errores Genéricos**: No exponer detalles internos (ej., "Invalid input" en lugar de stack traces).
- **Logging Seguro**: Usar Winston, sin loguear passwords o datos PII.

### 3.4 Configuración
- **Variables de Entorno**: Usar .env para secrets (JWT_SECRET), no hardcodeados.
- **HTTPS**: Obligatorio en producción.

## 4. Pruebas de Seguridad
- **OWASP Top 10**: Probar inyección SQL, XSS en inputs.
- **Autenticación**: Verificar tokens expirados bloquean acceso.

## 5. Criterios de Aceptación
- Endpoints requieren autenticación válida.
- Inputs sanitizados previenen ataques.
- No datos sensibles en logs.

---

**Estado**: Aprobado para BUILD.