---
trigger: plan
description: Plan técnico detallado para implementar OMA en Angular, definiendo estructura de archivos, patrones y convenciones específicas.
status: active
use_case: PLAN
---

# [PLAN] OMA Angular Implementation

## 1. Estructura de Archivos por Feature

### 1.1 Estructura Base por Feature
```
src/app/features/[feature]/
├── [feature].module.ts                    # Módulo del feature
├── [feature]-routing.module.ts           # Rutas del feature
├── services/
│   ├── [feature].service.ts               # Servicio API
│   ├── [feature].state.service.ts         # Estado centralizado
│   └── [feature].*.service.ts             # Servicios específicos
├── components/
│   ├── [feature].*.component.ts           # Componentes principales
│   ├── [feature].*.component.html
│   ├── [feature].*.component.scss
│   └── [feature].*.component.spec.ts
├── models/
│   ├── [feature].model.ts                 # Interfaces principales
│   └── [feature].*.model.ts               # Modelos específicos
├── guards/
│   └── [feature].*.guard.ts               # Guards del feature
├── interceptors/
│   └── [feature].*.interceptor.ts         # Interceptors específicos
└── pages/
    ├── [feature].*.page.ts               # Páginas principales
    ├── [feature].*.page.html
    ├── [feature].*.page.scss
    └── [feature].*.page.spec.ts
```

### 1.2 Estructura para Features Globales
```
src/app/core/
├── auth/
│   ├── auth.service.ts                    # Servicio global
│   ├── auth.guard.ts                     # Guard global
│   └── jwt.interceptor.ts                # Interceptor global
├── config/
│   └── app.config.ts                     # Configuración global
├── shared/
│   ├── components/                       # Componentes compartidos
│   ├── services/                         # Servicios compartidos
│   └── models/                           # Modelos globales
└── event-bus/
    └── event-bus.service.ts              # Bus de datos global
```

## 2. Patrones de Nomenclatura

### 2.1 Archivos
**Patrón:** `[feature].[description].[type].[extension]`

**Ejemplos:**
- `property.create.component.ts`
- `property.list.page.ts`
- `property.api.service.ts`
- `user.auth.guard.ts`

### 2.2 Clases y Componentes
**Regla:** Nombre de clase = nombre de archivo sin extensión, en PascalCase

**Ejemplos:**
```typescript
// Archivo: property.create.component.ts
@Component({...})
export class PropertyCreateComponent { }

// Archivo: user.auth.service.ts
@Injectable({...})
export class UserAuthService { }
```

### 2.3 Selectors de Componentes
**Patrón:** `app-[feature]-[description]-[type]`

**Ejemplos:**
- `app-property-create-form`
- `app-user-login-card`
- `app-product-list-table`

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```typescript
// ✅ CORRECTO
// Archivo: property.create.component.ts
@Component({
  selector: 'app-property-create',
  templateUrl: './property.create.component.html',
  styleUrls: ['./property.create.component.scss']
})
export class PropertyCreateComponent implements OnInit, OnDestroy {
  // Propiedades en camelCase
  public propertyForm: FormGroup;
  private readonly maxPrice = 10000000;

  // Métodos en camelCase
  public onSubmit(): void {
    // Implementation
  }

  ngOnInit(): void {
    this.initForm();
  }

  ngOnDestroy(): void {
    // Cleanup
  }
}

// ❌ INCORRECTO
// Archivo: PropertyCreateComponent.ts
@Component({...})
export class propertyCreateComponent { // Nombres inconsistentes
  public Name: string; // PascalCase incorrecto
  public validate_price(): boolean { } // Snake case
}
```

### Pilar 2: Desacoplamiento/Modularidad
```typescript
// property.module.ts
@NgModule({
  declarations: [
    PropertyListComponent,
    PropertyCreateComponent,
    PropertyDetailComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    PropertyRoutingModule,
    // Solo imports necesarios
  ],
  providers: [
    PropertyService,
    PropertyStateService,
    // Servicios específicos del feature
  ],
  exports: [
    // Exports mínimos - generalmente ninguno para features
  ]
})
export class PropertyModule { }

// property-routing.module.ts
const routes: Routes = [
  {
    path: '',
    component: PropertyListComponent,
    resolve: { properties: PropertyResolver }
  },
  {
    path: 'create',
    component: PropertyCreateComponent,
    canDeactivate: [PropertyGuard]
  },
  {
    path: ':id',
    component: PropertyDetailComponent,
    resolve: { property: PropertyResolver }
  }
];
```

### Pilar 3: Bus de Datos/Orquestación
```typescript
// event-bus.service.ts (Global)
@Injectable({
  providedIn: 'root'
})
export class EventBusService {
  private subjects = new Map<string, Subject<any>>();

  emit(event: string, data: any): void {
    if (!this.subjects.has(event)) {
      this.subjects.set(event, new Subject());
    }
    this.subjects.get(event)!.next(data);
  }

  on(event: string): Observable<any> {
    if (!this.subjects.has(event)) {
      this.subjects.set(event, new Subject());
    }
    return this.subjects.get(event)!.asObservable();
  }
}

// DTOs de eventos
export class PropertyCreatedEvent {
  constructor(
    public property: Property,
    public timestamp: Date = new Date()
  ) {}
}

export class PropertyUpdatedEvent {
  constructor(
    public property: Property,
    public changes: string[],
    public timestamp: Date = new Date()
  ) {}
}

// Uso en servicios
@Injectable()
export class PropertyService {
  constructor(
    private http: HttpClient,
    private eventBus: EventBusService
  ) {}

  create(propertyData: CreatePropertyDto): Observable<Property> {
    return this.http.post<Property>('/api/properties', propertyData).pipe(
      tap(createdProperty => {
        // Emitir evento para otros features
        this.eventBus.emit('property-created', new PropertyCreatedEvent(createdProperty));

        // Persistir en localStorage
        localStorage.setItem('last-created-property', JSON.stringify(createdProperty));
      })
    );
  }
}
```

### Pilar 4: Features Globales
```typescript
// auth.service.ts (Global)
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUser$ = new BehaviorSubject<User | null>(null);
  public readonly currentUser$ = this.currentUser$.asObservable();

  constructor(private http: HttpClient) {
    // Inicialización global
    this.loadPersistedSession();
  }

  private async loadPersistedSession(): Promise<void> {
    const token = localStorage.getItem('auth-token');
    if (token) {
      try {
        const user = await this.validateToken(token);
        this.currentUser$.next(user);
      } catch (e) {
        localStorage.removeItem('auth-token');
      }
    }
  }

  login(credentials: LoginCredentials): Observable<User> {
    return this.http.post<User>('/api/auth/login', credentials).pipe(
      tap(user => {
        localStorage.setItem('auth-token', user.token);
        this.currentUser$.next(user);
      })
    );
  }

  logout(): void {
    localStorage.removeItem('auth-token');
    this.currentUser$.next(null);
  }
}

// jwt.interceptor.ts (Global)
@Injectable()
export class JwtInterceptor implements HttpInterceptor {
  constructor(private authService: AuthService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = localStorage.getItem('auth-token');
    if (token) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
    }
    return next.handle(request);
  }
}

// app.module.ts
@NgModule({
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: JwtInterceptor,
      multi: true
    }
  ]
})
export class AppModule { }
```

### Pilar 5: Protocolo de Inicialización/Finalización
```typescript
@Injectable()
export class PropertyStateService {
  private state = {
    selectedProperty: null as Property | null,
    filters: {
      priceRange: [0, 1000000],
      location: '',
      type: 'all'
    },
    isLoading: false,
  };

  private subscriptions = new Subscription();

  // Método público para inicialización
  initialize(): void {
    this.resetState();
    this.loadPersistedFilters();
    this.setupSubscriptions();
  }

  // Método público para finalización
  destroy(): void {
    this.subscriptions.unsubscribe();
    this.persistFilters();
    this.resetState();
  }

  private resetState(): void {
    this.state = {
      selectedProperty: null,
      filters: {
        priceRange: [0, 1000000],
        location: '',
        type: 'all'
      },
      isLoading: false,
    };
  }

  private loadPersistedFilters(): void {
    const saved = localStorage.getItem('property-filters');
    if (saved) {
      this.state.filters = { ...this.state.filters, ...JSON.parse(saved) };
    }
  }

  private persistFilters(): void {
    localStorage.setItem('property-filters', JSON.stringify(this.state.filters));
  }

  private setupSubscriptions(): void {
    // Suscripciones que se limpian al salir del feature
    const sub = this.eventBus.on('global-filters-reset').subscribe(() => {
      this.resetFilters();
    });
    this.subscriptions.add(sub);
  }
}

// property-list.component.ts
export class PropertyListComponent implements OnInit, OnDestroy {
  constructor(private propertyState: PropertyStateService) {}

  ngOnInit(): void {
    // Inicializar estado del feature
    this.propertyState.initialize();
  }

  ngOnDestroy(): void {
    // Limpiar estado del feature
    this.propertyState.destroy();
  }
}
```

### Pilar 6: Manejo Centralizado de Estado
```typescript
@Injectable({
  providedIn: 'root'
})
export class PropertyStateService {
  // Estado privado
  private _state = {
    selectedProperty: null as Property | null,
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
    isLoading: false,
  };

  // Subjects para reactividad
  private selectedProperty$ = new BehaviorSubject<Property | null>(null);
  private filters$ = new BehaviorSubject<PropertyFilters>(this._state.filters);
  private loading$ = new BehaviorSubject<boolean>(false);

  // Getters públicos que retornan observables
  get selectedProperty(): Observable<Property | null> {
    return this.selectedProperty$.asObservable();
  }

  get filters(): Observable<PropertyFilters> {
    return this.filters$.asObservable();
  }

  get isLoading(): Observable<boolean> {
    return this.loading$.asObservable();
  }

  // Métodos controlados para mutar estado
  setSelectedProperty(property: Property | null): void {
    this._state.selectedProperty = property;
    this.selectedProperty$.next(property);

    // Persistir selección
    if (property) {
      localStorage.setItem('selected-property', JSON.stringify(property));
    } else {
      localStorage.removeItem('selected-property');
    }
  }

  updateFilters(newFilters: Partial<PropertyFilters>): void {
    this._state.filters = { ...this._state.filters, ...newFilters };
    this.filters$.next(this._state.filters);

    // Emitir evento global
    this.eventBus.emit('property-filters-changed', {
      filters: this._state.filters,
      timestamp: new Date(),
    });
  }

  setLoading(loading: boolean): void {
    this._state.isLoading = loading;
    this.loading$.next(loading);
  }

  // Método para reset completo
  resetState(): void {
    this._state = {
      selectedProperty: null,
      filters: {
        priceRange: [0, 1000000],
        location: '',
        type: 'all',
        status: 'active',
      },
      pagination: {
        page: 1,
        limit: 10,
        total: 0,
      },
      isLoading: false,
    };

    // Resetear subjects
    this.selectedProperty$.next(null);
    this.filters$.next(this._state.filters);
    this.loading$.next(false);

    // Limpiar localStorage
    localStorage.removeItem('selected-property');
  }
}
```

## 4. Convenciones de Código

### 4.1 Imports
```typescript
// ✅ Correcto - Imports organizados
import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Observable, Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';

import { PropertyService } from '../services/property.service';
import { PropertyStateService } from '../services/property.state.service';
import { Property, PropertyFilters } from '../models/property.model';

// ❌ Incorrecto - Imports desorganizados
import { takeUntil } from 'rxjs/operators';
import { PropertyService } from '../services/property.service';
import * as rxjs from 'rxjs'; // Import masivo
import { Component } from '@angular/core';
```

### 4.2 Reactive Forms
```typescript
// property-create.component.ts
export class PropertyCreateComponent implements OnInit, OnDestroy {
  propertyForm!: FormGroup;
  private destroy$ = new Subject<void>();

  constructor(
    private fb: FormBuilder,
    private propertyService: PropertyService,
    private propertyState: PropertyStateService
  ) {}

  ngOnInit(): void {
    this.initForm();
    this.setupFormSubscriptions();
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  private initForm(): void {
    this.propertyForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(3)]],
      price: [0, [Validators.required, Validators.min(0)]],
      description: [''],
      location: ['', Validators.required]
    });
  }

  private setupFormSubscriptions(): void {
    // Reactividad automática
    this.propertyForm.valueChanges
      .pipe(takeUntil(this.destroy$))
      .subscribe(value => {
        // Validar y actualizar estado si es necesario
        if (this.propertyForm.valid) {
          // Opcional: actualizar draft en estado
        }
      });
  }

  onSubmit(): void {
    if (this.propertyForm.valid) {
      this.propertyState.setLoading(true);

      this.propertyService.create(this.propertyForm.value)
        .pipe(takeUntil(this.destroy$))
        .subscribe({
          next: (property) => {
            this.propertyState.setSelectedProperty(property);
            // Navegar o mostrar éxito
          },
          error: (error) => {
            // Manejar error
          },
          complete: () => {
            this.propertyState.setLoading(false);
          }
        });
    }
  }
}
```

### 4.3 Guards y Resolvers
```typescript
// property.guard.ts
@Injectable({
  providedIn: 'root'
})
export class PropertyGuard implements CanDeactivate<PropertyCreateComponent> {
  canDeactivate(
    component: PropertyCreateComponent,
    currentRoute: ActivatedRouteSnapshot,
    currentState: RouterStateSnapshot,
    nextState?: RouterStateSnapshot
  ): Observable<boolean> | Promise<boolean> | boolean {
    if (component.propertyForm.dirty) {
      return confirm('¿Desea salir sin guardar los cambios?');
    }
    return true;
  }
}

// property.resolver.ts
@Injectable({
  providedIn: 'root'
})
export class PropertyResolver implements Resolve<Property> {
  constructor(private propertyService: PropertyService) {}

  resolve(route: ActivatedRouteSnapshot): Observable<Property> {
    const id = route.paramMap.get('id')!;
    return this.propertyService.findOne(id);
  }
}
```

## 5. Testing Strategy
```typescript
// property.service.spec.ts
describe('PropertyService', () => {
  let service: PropertyService;
  let httpMock: HttpTestingController;
  let eventBusMock: jasmine.SpyObj<EventBusService>;

  beforeEach(() => {
    const eventBusSpy = jasmine.createSpyObj('EventBusService', ['emit']);

    TestBed.configureTestingModule({
      providers: [
        PropertyService,
        { provide: EventBusService, useValue: eventBusSpy }
      ],
      imports: [HttpClientTestingModule]
    });

    service = TestBed.inject(PropertyService);
    httpMock = TestBed.inject(HttpTestingController);
    eventBusMock = TestBed.inject(EventBusService) as jasmine.SpyObj<EventBusService>;
  });

  afterEach(() => {
    httpMock.verify();
  });

  it('should create property and emit event', () => {
    const mockProperty = { id: '1', name: 'Test Property' };

    service.create({ name: 'Test Property' }).subscribe(property => {
      expect(property).toEqual(mockProperty);
    });

    const req = httpMock.expectOne('/api/properties');
    expect(req.request.method).toBe('POST');
    req.flush(mockProperty);

    expect(eventBusMock.emit).toHaveBeenCalled();
  });
});

// property.component.spec.ts
describe('PropertyCreateComponent', () => {
  let component: PropertyCreateComponent;
  let fixture: ComponentFixture<PropertyCreateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [PropertyCreateComponent],
      providers: [
        FormBuilder,
        // Mocks para servicios
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(PropertyCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create form on init', () => {
    expect(component.propertyForm).toBeDefined();
    expect(component.propertyForm.get('name')).toBeDefined();
  });
});
```

## 6. Documentación API
```typescript
// property.service.ts
@Injectable()
export class PropertyService {
  constructor(private http: HttpClient) {}

  /**
   * Create a new property
   * @param propertyData The property data to create
   * @returns Observable of created property
   */
  create(propertyData: CreatePropertyDto): Observable<Property> {
    return this.http.post<Property>('/api/properties', propertyData);
  }

  /**
   * Get all properties with optional filters
   * @param filters Optional filters to apply
   * @returns Observable of properties array
   */
  findAll(filters?: PropertyFilters): Observable<Property[]> {
    const params = filters ? this.buildQueryParams(filters) : {};
    return this.http.get<Property[]>('/api/properties', { params });
  }

  private buildQueryParams(filters: PropertyFilters): HttpParams {
    let params = new HttpParams();
    Object.entries(filters).forEach(([key, value]) => {
      if (value !== null && value !== undefined && value !== '') {
        params = params.set(key, value.toString());
      }
    });
    return params;
  }
}
```

Este plan proporciona una implementación completa y consistente de OMA en Angular, asegurando modularidad, mantenibilidad y escalabilidad siguiendo los principios de la filosofía OMA.