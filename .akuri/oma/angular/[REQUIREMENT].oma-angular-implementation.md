---
trigger: requirement
description: Definición de requisitos para implementar la filosofía OMA en Angular, especificando cómo se materializan los seis pilares en frontend.
status: active
use_case: REQUIREMENT
---

# [REQUIREMENT] OMA Angular Implementation

## 1. Propósito
Implementar la filosofía OMA en Angular para crear aplicaciones frontend modulares, consistentes y mantenibles que sigan los seis pilares fundamentales.

## 2. Alcance
### 2.1 Incluye
- Implementación completa de los 6 pilares OMA en Angular
- Estructura de carpetas y nomenclatura estandarizada
- Mecanismos de comunicación entre features
- Gestión de estado y ciclo de vida de componentes
- Documentación completa de patrones y mejores prácticas

### 2.2 Excluye
- Implementación en otros frameworks
- Aspectos de backend/servidor
- Infraestructura externa (despliegue, CI/CD)

## 3. Limitaciones
- Angular como framework principal (versión 14+)
- TypeScript como lenguaje
- RxJS para programación reactiva
- Arquitectura basada en módulos

## 4. Criterios de Aceptación
- Documentación completa de implementación OMA en Angular
- Ejemplos concretos de código funcional
- Guidelines claros para desarrollo
- Estrategia de testing integrada
- Scripts de validación funcionales

## 5. Requisitos de Seguridad
- Protección contra XSS con sanitización
- Autenticación y autorización implementadas
- Validación de formularios robusta
- Protección de rutas sensibles

## 6. Requisitos Funcionales por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
- **Archivos:** `[feature].[description].[type].ts` o `[feature].[description].[type].html/scss`
- **Clases/Componentes:** PascalCase igual al nombre del archivo (sin extensión)
- **Métodos y propiedades:** camelCase
- **Constantes:** UPPER_SNAKE_CASE

### Pilar 2: Desacoplamiento/Modularidad
- Features como módulos independientes con lazy loading
- Servicios singleton por feature
- Interfaces claras entre componentes
- Inyección de dependencias controlada

### Pilar 3: Bus de Datos/Orquestación
- RxJS Subjects/BehaviorSubjects para comunicación
- Servicios compartidos para orquestación
- LocalStorage/sessionStorage para persistencia
- Protocolos definidos de comunicación entre features

### Pilar 4: Features Globales
- Servicios registrados en root
- Guards y interceptors globales
- Configuraciones de aplicación
- Servicios de logging y monitoreo

### Pilar 5: Protocolo de Inicialización/Finalización
- Lifecycle hooks de Angular (ngOnInit, ngOnDestroy)
- Reset de estado al cambiar de feature
- Limpieza de subscriptions
- Cancelación de requests HTTP

### Pilar 6: Manejo Centralizado de Estado por Feature
- Servicios de estado por feature
- State management (NgRx, Akita, o servicios custom)
- Variables compartidas accesibles por todos los componentes del feature
- Mutaciones controladas del estado

## 7. Requisitos Técnicos
- Angular CLI para generación de código
- Angular Material o librería de componentes consistente
- Estrategia de testing con Jasmine/Karma
- Linting con ESLint y reglas personalizadas

## 8. Requisitos de Performance
- Lazy loading de features
- OnPush change detection donde aplique
- Unsubscription automática
- Bundle splitting por feature

## 9. Requisitos de Accesibilidad
- Cumplimiento WCAG 2.1 AA
- Navegación por teclado
- Screen readers support
- Contraste de colores adecuado

## 10. Dependencias
- Angular framework (14+)
- RxJS para reactividad
- Angular Material/CDK
- NgRx o Akita (opcional para state management avanzado)