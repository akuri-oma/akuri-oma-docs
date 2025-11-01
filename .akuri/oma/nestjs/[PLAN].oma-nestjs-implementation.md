---
trigger: plan
description: Plan técnico detallado para implementar OMA en NestJS, definiendo estructura de archivos, patrones y convenciones específicas.
status: active
use_case: PLAN
---

# [PLAN] OMA NestJS Implementation

## 1. Estructura de Archivos por Feature

### 1.1 Estructura Base por Feature
```
src/modules/[feature]/
├── [feature].module.ts                    # Módulo principal
├── [feature].controller.ts               # Endpoints REST
├── [feature].service.ts                  # Lógica de negocio
├── [feature].api.service.ts              # Comunicación externa
├── [feature].state.service.ts            # Estado centralizado
├── entities/
│   ├── [feature].entity.ts               # Entidad principal
│   └── [feature].*.entity.ts             # Entidades relacionadas
├── dto/
│   ├── [feature].create.dto.ts           # DTO creación
│   ├── [feature].update.dto.ts           # DTO actualización
│   ├── [feature].response.dto.ts         # DTO respuesta
│   └── [feature].*.dto.ts                # DTOs específicos
├── enums/
│   └── [feature].*.enum.ts               # Enums del feature
├── interfaces/
│   └── [feature].*.interface.ts          # Interfaces TypeScript
└── decorators/
    └── [feature].*.decorator.ts          # Decorators custom
```

### 1.2 Estructura para Features Globales
```
src/modules/core/[feature]/
├── [feature].module.ts                   # @Global() module
├── [feature].service.ts                  # Servicio singleton
├── [feature].guard.ts                    # Guards si aplica
├── [feature].strategy.ts                 # Estrategias auth
└── interfaces/
    └── [feature].*.interface.ts
```

## 2. Patrones de Nomenclatura

### 2.1 Archivos
**Patrón:** `[feature].[description].[type].[extension]`

**Ejemplos:**
- `property.create.dto.ts`
- `property.api.service.ts`
- `property.list.response.dto.ts`
- `user.auth.guard.ts`

### 2.2 Clases y Componentes
**Regla:** Nombre de clase = nombre de archivo sin extensión, en PascalCase

**Ejemplos:**
```typescript
// Archivo: property.create.dto.ts
export class PropertyCreateDto { }

// Archivo: user.auth.service.ts
@Injectable()
export class UserAuthService { }
```

### 2.3 Métodos y Propiedades
- **Métodos:** camelCase
- **Propiedades:** camelCase
- **Constantes:** UPPER_SNAKE_CASE
- **Getters/Setters:** camelCase

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```typescript
// ✅ Correcto
// Archivo: property.create.dto.ts
export class PropertyCreateDto {
  public name: string;
  public price: number;
  private readonly MAX_PRICE = 10000000;

  public validatePrice(): boolean {
    return this.price <= this.MAX_PRICE;
  }
}

// ❌ Incorrecto
// Archivo: PropertyCreateDTO.ts
export class propertyCreateDto { // Nombres inconsistentes
  public Name: string; // PascalCase incorrecto
  public validate_price(): boolean { } // Snake case
}
```

### Pilar 2: Desacoplamiento/Modularidad
```typescript
// property.module.ts
@Module({
  imports: [
    TypeOrmModule.forFeature([PropertyEntity]),
    // ❌ Evitar imports masivos
    // ✅ Imports específicos y justificados
  ],
  controllers: [PropertyController],
  providers: [PropertyService, PropertyApiService],
  exports: [PropertyService], // Solo exportar lo necesario
})
export class PropertyModule { }

// ❌ Incorrecto - Acoplamiento alto
@Module({
  imports: [UserModule, PaymentModule, EmailModule], // Dependencias innecesarias
  exports: [PropertyService, PropertyController], // Exportar demasiado
})
export class PropertyModule { }
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

  on(event: string, handler: (data: any) => void) {
    this.eventEmitter.on(event, handler);
  }
}

// Uso en servicio
@Injectable()
export class PropertyService {
  constructor(private eventBus: EventBusService) {}

  async create(propertyData: PropertyCreateDto) {
    const property = await this.save(propertyData);
    this.eventBus.emit('property-created', property);
    return property;
  }
}
```

### Pilar 4: Features Globales
```typescript
// auth.module.ts
@Global() // Hace el módulo global
@Module({
  providers: [AuthService, JwtService],
  exports: [AuthService, JwtService], // Disponible en toda la app
})
export class AuthModule { }

// app.module.ts
@Module({
  imports: [AuthModule], // Una vez aquí, disponible globalmente
})
export class AppModule { }
```

### Pilar 5: Protocolo de Inicialización/Finalización
```typescript
@Injectable()
export class PropertyService implements OnModuleInit, OnModuleDestroy {
  private state = {
    activeRequests: new Set<string>(),
    cache: new Map<string, any>(),
    filters: {}
  };

  async onModuleInit() {
    // Inicialización
    await this.initializeCache();
    this.resetFilters();
    console.log('PropertyService initialized');
  }

  async onModuleDestroy() {
    // Limpieza
    this.state.activeRequests.clear();
    this.state.cache.clear();
    console.log('PropertyService destroyed');
  }

  private resetFilters() {
    this.state.filters = {
      priceRange: [0, 1000000],
      location: '',
      type: 'all'
    };
  }
}
```

### Pilar 6: Manejo Centralizado de Estado
```typescript
@Injectable()
export class PropertyStateService {
  private _state = {
    selectedProperty: null as Property | null,
    isLoading: false,
    filters: {
      priceRange: [0, 1000000] as [number, number],
      location: '',
      type: 'all' as string
    },
    pagination: {
      page: 1,
      limit: 10,
      total: 0
    }
  };

  // Getter que retorna copia para evitar mutaciones externas
  get state() {
    return {
      ...this._state,
      filters: { ...this._state.filters },
      pagination: { ...this._state.pagination }
    };
  }

  // Métodos controlados para mutar estado
  updateFilters(newFilters: Partial<typeof this._state.filters>) {
    this._state.filters = { ...this._state.filters, ...newFilters };
    this.eventBus.emit('property-filters-changed', this._state.filters);
  }

  setSelectedProperty(property: Property | null) {
    this._state.selectedProperty = property;
    this.eventBus.emit('property-selected', property);
  }

  setLoading(loading: boolean) {
    this._state.isLoading = loading;
  }
}
```

## 4. Convenciones de Código

### 4.1 Imports
```typescript
// ✅ Correcto - Imports organizados y específicos
import { Injectable, Inject } from '@nestjs/common';
import { Repository } from 'typeorm';
import { PropertyEntity } from '../entities/property.entity';
import { PropertyCreateDto } from '../dto/property.create.dto';

// ❌ Incorrecto - Imports desorganizados
import * as typeorm from 'typeorm'; // Import masivo
import { PropertyCreateDto } from '../dto/property.create.dto';
import { Injectable } from '@nestjs/common';
```

### 4.2 DTOs con Validación
```typescript
// property.create.dto.ts
export class PropertyCreateDto {
  @IsNotEmpty()
  @IsString()
  @Length(3, 100)
  name: string;

  @IsNotEmpty()
  @IsNumber()
  @Min(0)
  price: number;

  @IsOptional()
  @IsString()
  description?: string;
}
```

### 4.3 Controladores
```typescript
@Controller('properties')
export class PropertyController {
  constructor(private readonly propertyService: PropertyService) {}

  @Post()
  @UseGuards(JwtAuthGuard)
  async create(@Body() dto: PropertyCreateDto) {
    return this.propertyService.create(dto);
  }

  @Get()
  async findAll(@Query() filters: PropertyFiltersDto) {
    return this.propertyService.findAll(filters);
  }
}
```

## 5. Testing Strategy
```typescript
// property.service.spec.ts
describe('PropertyService', () => {
  let service: PropertyService;
  let mockRepository: MockType<Repository<PropertyEntity>>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PropertyService, mockRepository],
    }).compile();

    service = module.get<PropertyService>(PropertyService);
  });

  it('should create property and emit event', async () => {
    // Test implementation
  });
});
```

## 6. Documentación API
```typescript
// property.controller.ts
@Controller('properties')
@ApiTags('properties')
export class PropertyController {
  @Post()
  @ApiOperation({ summary: 'Create property' })
  @ApiResponse({ status: 201, type: PropertyResponseDto })
  async create(@Body() dto: PropertyCreateDto) {
    return this.propertyService.create(dto);
  }
}
```

## 7. Manejo de Errores
```typescript
@Injectable()
export class PropertyService {
  async create(dto: PropertyCreateDto): Promise<Property> {
    try {
      const property = this.repository.create(dto);
      await this.repository.save(property);
      this.eventBus.emit('property-created', property);
      return property;
    } catch (error) {
      if (error.code === '23505') { // Unique constraint
        throw new ConflictException('Property already exists');
      }
      throw new InternalServerErrorException('Failed to create property');
    }
  }
}
```

## 8. Configuración y Variables de Entorno
```typescript
// config.module.ts (Global)
@Global()
@Module({
  providers: [
    {
      provide: 'PROPERTY_CONFIG',
      useValue: {
        maxPrice: process.env.MAX_PROPERTY_PRICE || 10000000,
        defaultCurrency: process.env.DEFAULT_CURRENCY || 'USD',
      },
    },
  ],
  exports: ['PROPERTY_CONFIG'],
})
export class ConfigModule { }
```

Este plan proporciona una implementación completa y consistente de OMA en NestJS, asegurando modularidad, mantenibilidad y escalabilidad.