---
trigger: design
description: Diseño conceptual de la implementación OMA en NestJS, definiendo cómo se materializan los seis pilares en la arquitectura backend.
status: active
use_case: DESIGN
---

# [DESIGN] OMA NestJS Implementation

## 1. Entorno de Ejecución
### 1.1 Infraestructura
- **Framework:** NestJS con TypeScript
- **Arquitectura:** Modular con inyección de dependencias
- **Persistencia:** TypeORM (opcional, configurable por proyecto)
- **Comunicación:** REST APIs con DTOs estandarizados

### 1.2 Tecnologías
- **Lenguaje:** TypeScript con decoradores
- **Validación:** class-validator + class-transformer
- **Documentación:** Swagger/OpenAPI
- **Testing:** Jest con supertest

## 2. Explicación de la Solución
Implementaremos OMA en NestJS aprovechando su arquitectura modular nativa. Cada feature será un módulo autocontenido con servicios, controladores y entidades propias, comunicándose a través de un bus de eventos centralizado.

## 3. Resolución de Problemas

### 3.1 Desacoplamiento
**Problema:** Features acoplados dificultan mantenimiento.
**Solución:** Módulos independientes con interfaces claras via DTOs y eventos.

### 3.2 Comunicación entre Features
**Problema:** Cómo features se comunican sin acoplamiento.
**Solución:** Bus de eventos global + servicios de orquestación.

### 3.3 Estado por Feature
**Problema:** Estado disperso y difícil de gestionar.
**Solución:** Servicios singleton por feature con estado centralizado.

## 4. Arquitectura de Alto Nivel

```
AppModule (Global)
├── CoreModule (Features Globales)
│   ├── AuthModule
│   ├── ConfigModule
│   └── EventBusModule
├── Feature Modules (Features Normales)
│   ├── PropertyModule
│   ├── UserModule
│   └── PaymentModule
└── SharedModule (Utilidades)
```

## 5. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```typescript
// Archivo: property.create.dto.ts
export class PropertyCreateDto {
  // Implementación
}

// Archivo: property.api.service.ts
@Injectable()
export class PropertyApiService {
  // Implementación
}
```

### Pilar 2: Desacoplamiento/Modularidad
```typescript
// property.module.ts
@Module({
  imports: [TypeOrmModule.forFeature([PropertyEntity])],
  controllers: [PropertyController],
  providers: [PropertyService, PropertyApiService],
  exports: [PropertyService] // Solo exporta lo necesario
})
export class PropertyModule {}
```

### Pilar 3: Bus de Datos/Orquestación
```typescript
// event-bus.service.ts (Global)
@Injectable()
export class EventBusService {
  private eventEmitter = new EventEmitter();

  emit(event: string, data: any) {
    this.eventEmitter.emit(event, data);
  }

  on(event: string, handler: Function) {
    this.eventEmitter.on(event, handler);
  }
}
```

### Pilar 4: Features Globales
```typescript
// app.module.ts
@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }), // Global
    AuthModule, // Global
    PropertyModule, // Feature normal
  ],
})
export class AppModule {}
```

### Pilar 5: Protocolo de Inicialización/Finalización
```typescript
@Injectable()
export class PropertyService implements OnModuleInit, OnModuleDestroy {
  private state = {
    activeFilters: {},
    cache: new Map()
  };

  onModuleInit() {
    // Inicializar estado
    this.resetState();
  }

  onModuleDestroy() {
    // Limpiar recursos
    this.state.cache.clear();
  }

  private resetState() {
    this.state = {
      activeFilters: {},
      cache: new Map()
    };
  }
}
```

### Pilar 6: Manejo Centralizado de Estado
```typescript
@Injectable()
export class PropertyStateService {
  private state = {
    selectedProperty: null,
    isLoading: false,
    filters: {
      priceRange: [0, 1000000],
      location: '',
      type: 'all'
    }
  };

  getState() {
    return { ...this.state }; // Retornar copia
  }

  updateFilters(newFilters: any) {
    this.state.filters = { ...this.state.filters, ...newFilters };
    // Emitir evento de cambio
    this.eventBus.emit('property-filters-changed', this.state.filters);
  }
}
```

## 6. Garantías de Criterios de Aceptación
- **Nombres estandarizados:** Patrón `[feature].[description].[type].ts` aplicado
- **Modularidad:** Imports limitados, exports controlados
- **Comunicación:** EventBus centralizado con DTOs
- **Estado:** Servicios singleton con estado observable
- **Ciclo de vida:** Lifecycle hooks implementados

## 7. Consideraciones de Seguridad
- Validación de entrada con class-validator
- Autenticación JWT en features globales
- Autorización basada en roles
- Sanitización de datos

## 8. Alternativas Consideradas
- **Sin módulos:** Monolito difícil de mantener → Rechazado
- **Microservicios:** Complejidad innecesaria → Rechazado
- **EventSourcing:** Overkill para la mayoría de casos → Opcional

## 9. Riesgos y Mitigaciones
- **Riesgo:** Acoplamiento accidental → **Mitigación:** Code reviews con checklist OMA
- **Riesgo:** Estado inconsistente → **Mitigación:** Mutaciones controladas via métodos
- **Riesgo:** Memory leaks → **Mitigación:** Lifecycle hooks obligatorios