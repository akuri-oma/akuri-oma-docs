---
trigger: always_on
description: Guideline completo para implementar la filosofía OMA en NestJS, con reglas, patrones y ejemplos para desarrollo consistente.
status: active
use_case: [BUILD, AUDIT, REFACTOR]
---

# [GUIDELINE] OMA NestJS Standards

## 1. Propósito
Este guideline establece las reglas y patrones específicos para implementar la filosofía OMA en proyectos NestJS, asegurando consistencia, modularidad y mantenibilidad.

## 2. Reglas Generales

### 2.1 Arquitectura Modular
- **Cada feature** debe ser un módulo independiente
- **Imports mínimos:** Solo importar lo estrictamente necesario
- **Exports controlados:** Exportar solo interfaces públicas
- **Dependencias explícitas:** Declarar todas las dependencias

### 2.2 Nomenclatura Estandarizada
**Patrón de archivos:** `[feature].[description].[type].[extension]`

**Ejemplos válidos:**
- `property.create.dto.ts`
- `property.api.service.ts`
- `user.auth.controller.ts`
- `payment.webhook.handler.ts`

**Ejemplos inválidos:**
- `PropertyCreateDto.ts` ❌ (PascalCase en archivo)
- `property.dto.ts` ❌ (Falta descripción específica)
- `createPropertyDTO.ts` ❌ (camelCase + abreviaturas)

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado

#### Reglas de Nomenclatura
```typescript
// ✅ CORRECTO
// Archivo: property.create.dto.ts
export class PropertyCreateDto {
  // Propiedades en camelCase
  public name: string;
  public price: number;
  private readonly MAX_PRICE = 10000000; // Constantes en UPPER_SNAKE_CASE

  // Métodos en camelCase
  public validatePrice(): boolean {
    return this.price <= this.MAX_PRICE;
  }
}

// ❌ INCORRECTO
// Archivo: PropertyCreateDTO.ts
export class propertyCreateDto { // Nombres inconsistentes
  public Name: string; // PascalCase incorrecto
  public validate_price(): boolean { } // Snake case en método
}
```

#### Convenciones por Tipo
- **DTOs:** `[feature].[action].dto.ts` → `PropertyCreateDto`
- **Services:** `[feature].[scope].service.ts` → `PropertyApiService`
- **Controllers:** `[feature].[scope].controller.ts` → `PropertyController`
- **Entities:** `[feature].entity.ts` → `PropertyEntity`
- **Guards:** `[feature].[purpose].guard.ts` → `AuthJwtGuard`

### Pilar 2: Desacoplamiento/Modularidad

#### Estructura de Módulos
```typescript
// ✅ CORRECTO - Módulo desacoplado
@Module({
  imports: [
    TypeOrmModule.forFeature([PropertyEntity]), // Solo entidades necesarias
  ],
  controllers: [PropertyController],
  providers: [PropertyService, PropertyApiService],
  exports: [PropertyService], // Exportar solo lo necesario
})
export class PropertyModule { }

// ❌ INCORRECTO - Acoplamiento alto
@Module({
  imports: [
    UserModule, PaymentModule, EmailModule, // Dependencias innecesarias
    TypeOrmModule.forFeature([/* todas las entidades */]), // Import masivo
  ],
  exports: [PropertyService, PropertyController, PropertyEntity], // Exportar demasiado
})
export class PropertyModule { }
```

#### Reglas de Dependencias
- **Inyección explícita:** Usar `@Inject()` para dependencias no estándar
- **Interfaces:** Definir contratos claros entre módulos
- **Mínima exposición:** No exportar implementaciones internas

### Pilar 3: Bus de Datos/Orquestación

#### Implementación del Bus
```typescript
// event-bus.service.ts (Servicio global)
@Injectable()
export class EventBusService {
  private eventEmitter = new EventEmitter();

  emit(event: string, data: any): void {
    this.eventEmitter.emit(event, data);
  }

  on(event: string, handler: (data: any) => void): void {
    this.eventEmitter.on(event, handler);
  }

  once(event: string, handler: (data: any) => void): void {
    this.eventEmitter.once(event, handler);
  }
}
```

#### Uso en Features
```typescript
@Injectable()
export class PropertyService {
  constructor(private eventBus: EventBusService) {}

  async create(propertyData: CreatePropertyDto): Promise<Property> {
    const property = await this.repository.save(propertyData);

    // Emitir evento para otros features
    this.eventBus.emit('property-created', {
      property,
      timestamp: new Date(),
      source: 'PropertyService'
    });

    return property;
  }
}

// Otro feature escuchando
@Injectable()
export class NotificationService implements OnModuleInit {
  constructor(private eventBus: EventBusService) {}

  onModuleInit() {
    this.eventBus.on('property-created', (data) => {
      this.sendNotification(data.property);
    });
  }
}
```

#### DTOs de Eventos
```typescript
// property.event.dto.ts
export class PropertyCreatedEvent {
  property: Property;
  timestamp: Date;
  source: string;
}

export class PropertyUpdatedEvent {
  property: Property;
  changes: string[];
  timestamp: Date;
}
```

### Pilar 4: Features Globales

#### Características de Features Globales
- Registrados en `AppModule` con `@Global()`
- Disponibles en toda la aplicación
- Persisten durante todo el ciclo de vida
- Inicialización temprana

#### Ejemplos de Features Globales
```typescript
// auth.module.ts
@Global()
@Module({
  providers: [AuthService, JwtService, AuthGuard],
  exports: [AuthService, AuthGuard],
})
export class AuthModule { }

// config.module.ts
@Global()
@Module({
  providers: [
    {
      provide: 'APP_CONFIG',
      useFactory: () => ({
        database: process.env.DATABASE_URL,
        jwtSecret: process.env.JWT_SECRET,
        maxFileSize: parseInt(process.env.MAX_FILE_SIZE || '10485760'),
      }),
    },
  ],
  exports: ['APP_CONFIG'],
})
export class ConfigModule { }

// logger.module.ts
@Global()
@Module({
  providers: [LoggerService],
  exports: [LoggerService],
})
export class LoggerModule implements OnModuleInit {
  constructor(private logger: LoggerService) {}

  onModuleInit() {
    this.logger.log('Application started');
  }
}
```

### Pilar 5: Protocolo de Inicialización/Finalización

#### Lifecycle Hooks
```typescript
@Injectable()
export class PropertyService implements OnModuleInit, OnModuleDestroy {
  private state = {
    activeRequests: new Set<string>(),
    cache: new Map<string, Property>(),
    filters: {} as PropertyFilters,
  };

  async onModuleInit(): Promise<void> {
    // 1. Inicializar estado
    this.resetState();

    // 2. Cargar configuración inicial
    await this.loadInitialConfig();

    // 3. Configurar listeners
    this.setupEventListeners();

    console.log('PropertyService initialized');
  }

  async onModuleDestroy(): Promise<void> {
    // 1. Cancelar requests activos
    for (const requestId of this.state.activeRequests) {
      this.cancelRequest(requestId);
    }

    // 2. Limpiar cache
    this.state.cache.clear();

    // 3. Cerrar conexiones
    await this.closeConnections();

    console.log('PropertyService destroyed');
  }

  private resetState(): void {
    this.state = {
      activeRequests: new Set(),
      cache: new Map(),
      filters: {
        priceRange: [0, 1000000],
        location: '',
        type: 'all',
        status: 'active',
      },
    };
  }
}
```

#### Protocolo de Reset
```typescript
@Injectable()
export class PropertyStateService {
  // Método público para reset desde otros features
  resetFeatureState(): void {
    this.state.selectedProperty = null;
    this.state.isLoading = false;
    this.state.filters = this.getDefaultFilters();
    this.state.pagination = { page: 1, limit: 10, total: 0 };

    // Notificar reset
    this.eventBus.emit('property-state-reset', {
      timestamp: new Date(),
      reason: 'feature-exit'
    });
  }

  private getDefaultFilters(): PropertyFilters {
    return {
      priceRange: [0, 1000000],
      location: '',
      type: 'all',
      status: 'active',
    };
  }
}
```

### Pilar 6: Manejo Centralizado de Estado

#### Patrón de Estado Centralizado
```typescript
@Injectable()
export class PropertyStateService {
  private _state = {
    selectedProperty: null as Property | null,
    isLoading: false,
    filters: {
      priceRange: [0, 1000000] as [number, number],
      location: '',
      type: 'all' as string,
      status: 'active' as string,
    },
    pagination: {
      page: 1,
      limit: 10,
      total: 0,
    },
    cache: new Map<string, Property>(),
  };

  // Getter que retorna copia profunda
  get state() {
    return {
      selectedProperty: this._state.selectedProperty,
      isLoading: this._state.isLoading,
      filters: { ...this._state.filters },
      pagination: { ...this._state.pagination },
      cache: new Map(this._state.cache), // Copia del Map
    };
  }

  // Métodos controlados para mutar estado
  updateFilters(newFilters: Partial<PropertyFilters>): void {
    this._state.filters = { ...this._state.filters, ...newFilters };

    // Emitir evento de cambio
    this.eventBus.emit('property-filters-changed', {
      filters: this._state.filters,
      timestamp: new Date(),
    });
  }

  setSelectedProperty(property: Property | null): void {
    const previous = this._state.selectedProperty;
    this._state.selectedProperty = property;

    // Emitir evento con cambio
    this.eventBus.emit('property-selected', {
      property,
      previous,
      timestamp: new Date(),
    });
  }

  setLoading(loading: boolean): void {
    this._state.isLoading = loading;

    if (loading) {
      this.eventBus.emit('property-loading-started', { timestamp: new Date() });
    } else {
      this.eventBus.emit('property-loading-finished', { timestamp: new Date() });
    }
  }

  // Método para cache inteligente
  getCachedProperty(id: string): Property | undefined {
    return this._state.cache.get(id);
  }

  setCachedProperty(property: Property): void {
    this._state.cache.set(property.id, { ...property });

    // Limitar tamaño del cache
    if (this._state.cache.size > 100) {
      const firstKey = this._state.cache.keys().next().value;
      this._state.cache.delete(firstKey);
    }
  }

  clearCache(): void {
    this._state.cache.clear();
    this.eventBus.emit('property-cache-cleared', { timestamp: new Date() });
  }
}
```

#### Integración con Controladores
```typescript
@Controller('properties')
export class PropertyController {
  constructor(
    private propertyService: PropertyService,
    private propertyState: PropertyStateService,
  ) {}

  @Get()
  async findAll(@Query() query: PropertyQueryDto) {
    this.propertyState.setLoading(true);

    try {
      const result = await this.propertyService.findAll(query);

      // Actualizar estado
      this.propertyState.setPagination(result.pagination);

      return result;
    } finally {
      this.propertyState.setLoading(false);
    }
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    // Verificar cache primero
    let property = this.propertyState.getCachedProperty(id);

    if (!property) {
      property = await this.propertyService.findOne(id);
      this.propertyState.setCachedProperty(property);
    }

    this.propertyState.setSelectedProperty(property);
    return property;
  }
}
```

## 4. Patrones de Testing OMA

### Testing de Servicios
```typescript
describe('PropertyService', () => {
  let service: PropertyService;
  let mockRepository: MockType<Repository<PropertyEntity>>;
  let mockEventBus: MockType<EventBusService>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        PropertyService,
        { provide: getRepositoryToken(PropertyEntity), useFactory: jest.fn(() => mockRepository) },
        { provide: EventBusService, useFactory: jest.fn(() => mockEventBus) },
      ],
    }).compile();

    service = module.get<PropertyService>(PropertyService);
  });

  it('should create property and emit event', async () => {
    const dto = { name: 'Test Property', price: 100000 };
    const expectedProperty = { id: '1', ...dto };

    mockRepository.save.mockResolvedValue(expectedProperty);
    mockEventBus.emit.mockImplementation(() => {});

    const result = await service.create(dto);

    expect(result).toEqual(expectedProperty);
    expect(mockEventBus.emit).toHaveBeenCalledWith('property-created', expectedProperty);
  });
});
```

### Testing de Estado
```typescript
describe('PropertyStateService', () => {
  let service: PropertyStateService;
  let mockEventBus: MockType<EventBusService>;

  beforeEach(() => {
    mockEventBus = { emit: jest.fn() };
    service = new PropertyStateService(mockEventBus as any);
  });

  it('should update filters and emit event', () => {
    const newFilters = { location: 'Madrid', type: 'apartment' };

    service.updateFilters(newFilters);

    expect(service.state.filters.location).toBe('Madrid');
    expect(service.state.filters.type).toBe('apartment');
    expect(mockEventBus.emit).toHaveBeenCalledWith('property-filters-changed', expect.any(Object));
  });

  it('should return copy of state', () => {
    const state1 = service.state;
    const state2 = service.state;

    expect(state1).not.toBe(state2); // Diferentes referencias
    expect(state1.filters).not.toBe(state2.filters); // Filtros copiados
  });
});
```

## 5. Checklist de Auditoría OMA

### Checklist por Pilar
- **Pilar 1:** ¿Todos los archivos siguen patrón `[feature].[description].[type].ts`?
- **Pilar 2:** ¿El módulo importa solo lo necesario y exporta mínimamente?
- **Pilar 3:** ¿Los features se comunican solo via EventBus con DTOs?
- **Pilar 4:** ¿Los features globales están marcados con `@Global()`?
- **Pilar 5:** ¿Se implementan `OnModuleInit` y `OnModuleDestroy`?
- **Pilar 6:** ¿El estado está centralizado y las mutaciones son controladas?

### Checklist de Code Review
- [ ] Nombres de archivos consistentes con patrón OMA
- [ ] Imports organizados y mínimos
- [ ] Estado mutado solo a través de métodos del servicio
- [ ] Eventos emitidos con DTOs estructurados
- [ ] Lifecycle hooks implementados cuando aplican
- [ ] Tests cubren estado y comunicación

## 6. Scripts de Validación

### Validador de Nombres
```bash
#!/bin/bash
# validate-oma-names.sh

find src -name "*.ts" | while read file; do
  filename=$(basename "$file" .ts)

  # Verificar patrón OMA
  if [[ ! $filename =~ ^[a-z]+\.[a-z]+\.[a-z]+\$ ]]; then
    echo "❌ Nombre inválido: $file"
  else
    echo "✅ Nombre válido: $file"
  fi
done
```

### Validador de Dependencias
```bash
#!/bin/bash
# validate-oma-deps.sh

# Verificar imports circulares
npx madge --circular --extensions ts src/
```

## 7. Referencias
- Ver `oma-philosophy.md` para fundamentos
- Ver `akuri.01-global-rules.md` para reglas generales
- Ver `akuri-workflow.master.md` para integración con workflows