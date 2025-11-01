---
trigger: requirement
description: Definición de requisitos para implementar la filosofía OMA en NestJS, especificando cómo se materializan los seis pilares en backend.
status: active
use_case: REQUIREMENT
---

# [REQUIREMENT] OMA NestJS Implementation

## 1. Propósito
Implementar la filosofía OMA en NestJS para crear backends modulares, consistentes y mantenibles que sigan los seis pilares fundamentales.

## 2. Alcance
### 2.1 Incluye
- Implementación completa de los 6 pilares OMA en NestJS
- Estructura de carpetas y nomenclatura estandarizada
- Mecanismos de comunicación entre features
- Gestión de estado y ciclo de vida
- Documentación completa de patrones

### 2.2 Excluye
- Implementación en otros frameworks
- Aspectos de UI/frontend
- Infraestructura externa (bases de datos, etc.)

## 3. Limitaciones
- NestJS como framework principal
- TypeScript como lenguaje
- Arquitectura modular de NestJS

## 4. Criterios de Aceptación
- Documentación completa de implementación OMA en NestJS
- Ejemplos concretos de código
- Guidelines claros para desarrollo
- Scripts de validación funcionales

## 5. Requisitos de Seguridad
- Validación de entrada en todos los endpoints
- Autenticación y autorización implementadas
- Protección contra ataques comunes (OWASP)

## 6. Requisitos Funcionales por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
- **Archivos:** `[feature].[description].[type].ts`
- **Clases:** PascalCase igual al nombre del archivo (sin extensión)
- **Métodos:** camelCase
- **Constantes:** UPPER_SNAKE_CASE

### Pilar 2: Desacoplamiento/Modularidad
- Módulos independientes por feature
- Interfaces claras entre módulos
- Inyección de dependencias controlada
- Imports explícitos y limitados

### Pilar 3: Bus de Datos/Orquestación
- EventEmitter para comunicación interna
- DTOs estandarizados para intercambio
- Servicios de orquestación centralizados
- Protocolos definidos de comunicación

### Pilar 4: Features Globales
- Módulos registrados globalmente en AppModule
- Servicios singleton persistentes
- Configuraciones globales
- Logging y monitoreo centralizados

### Pilar 5: Protocolo de Inicialización/Finalización
- Lifecycle hooks de módulos (@OnModuleInit, @OnModuleDestroy)
- Estado local por módulo
- Limpieza automática de recursos
- Reset de estado al finalizar

### Pilar 6: Manejo Centralizado de Estado
- Servicios singleton por feature
- Estado compartido accesible por todos los componentes del feature
- Mutaciones controladas del estado
- Observabilidad del estado

## 7. Dependencias
- NestJS framework
- TypeScript
- TypeORM (opcional para persistencia)
- Documentación existente de filosofía OMA