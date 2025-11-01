---
trigger: always_on
description: Guideline completo para implementar la filosofía OMA en Angular, con reglas, patrones y ejemplos para desarrollo consistente.
status: active
use_case: [BUILD, AUDIT, REFACTOR]
---

# [GUIDELINE] OMA Angular Standards

## 1. Propósito
Este guideline establece las reglas y patrones específicos para implementar la filosofía OMA en proyectos Angular, asegurando consistencia, modularidad y mantenibilidad siguiendo los seis pilares fundamentales.

## 2. Reglas Generales

### 2.1 Arquitectura Modular
- **Cada feature** debe ser un módulo independiente con lazy loading
- **Imports mínimos:** Solo importar lo estrictamente necesario
- **Providers específicos:** Servicios scoped al feature cuando sea posible
- **Rutas protegidas:** Guards y resolvers para navegación segura

### 2.2 Nomenclatura Estandarizada
**Patrón de archivos:** `[feature].[description].[type].[extension]`

**Ejemplos válidos:**
- `property.create.component.ts`
- `property.list.page.ts`
- `property.api.service.ts`
- `user.auth.guard.ts`

**Ejemplos inválidos:**
- `PropertyCreateComponent.ts` ❌ (PascalCase en archivo)
- `property.component.ts` ❌ (Falta descripción específica)
- `createPropertyDTO.ts` ❌ (camelCase + abreviaturas)

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado

#### Reglas de Nomenclatura
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

// Archivo: property.create.component.html
<!-- Template correspondiente -->
<form [formGroup]="propertyForm" (ngSubmit)="onSubmit()">
  <!-- Form fields -->
</form>

// Archivo: property.create.component.scss
/* Styles correspondientes */
.property-form {
  // Styles
}

// ❌ INCORRECTO
// Archivo: PropertyCreateComponent.ts
@Component({...})
export class propertyCreateComponent { // Nombres inconsistentes
  public Name: string; // PascalCase incorrecto
  public validate_price(): boolean { } // Snake case en método
}
```

#### Convenciones por Tipo
- **Components:** `[feature].[description].component.ts` → `PropertyCreateComponent`
- **Services:** `[feature].[scope].service.ts` → `PropertyApiService`
- **Guards:** `[feature].[purpose].guard.ts` → `AuthJwtGuard`
- **Interceptors:** `[feature].[purpose].interceptor.ts` → `AuthJwtInterceptor`
- **Models:** `[feature].[purpose].model.ts` → `PropertyCreateModel`
- **Pages:** `[feature].[description].page.ts` → `PropertyListPage`

#### Selectors de Componentes
```typescript
// ✅ Correcto - Selector consistente
@Component({
  selector: 'app-property-create-form',
  // ...
})
export class PropertyCreateComponent { }

// ✅ Correcto - Prefijo app- + patrón OMA
@Component({
  selector: 'app-user-login-card',
  // ...
})
export class UserLoginComponent { }

// ❌ Incorrecto - Selector genérico
@Component({
  selector: 'login-form', // Sin prefijo ni patrón
  // ...
})
```

### Pilar 2: Desacoplamiento/Modularidad

#### Estructura de Módulos
```typescript
// ✅ CORRECTO - Módulo desacoplado
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
    // Solo imports necesarios para el feature
  ],
  providers: [
    PropertyService,
    PropertyStateService,
    // Servicios específicos del feature
  ],
  exports: [
    // Generalmente no exportar para mantener encapsulación
  ]
})
export class PropertyModule { }

// ❌ INCORRECTO - Acoplamiento alto
@NgModule({
  declarations: [/* todos los componentes */],
  imports: [
    UserModule, PaymentModule, EmailModule, // Dependencias innecesarias
    TypeOrmModule.forFeature([/* todas las entidades */]), // Import masivo
  ],
  exports: [
    PropertyService, PropertyComponent, // Exportar demasiado
  ]
})
export class PropertyModule { }
```

#### Providers y Dependency Injection
```typescript
// ✅ Correcto - Servicios scoped al feature
@NgModule({
  providers: [
    PropertyService,           // Servicio del feature
    PropertyStateService,      // Estado del feature
    {
      provide: PROPERTY_CONFIG,
      useValue: { maxPrice: 10000000 }
    }
  ]
})
export class PropertyModule { }

// ✅ Correcto - Servicios globales cuando necesario
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  // Servicio global justificado
}

// ❌ Incorrecto - Todo en root
@Injectable({
  providedIn: 'root'
})
export class PropertyService {
  // Servicio específico en root sin justificación
}
```

#### Routing y Lazy Loading
```typescript
// ✅ Correcto - Lazy loading por feature
const routes: Routes = [
  {
    path: 'properties',
    loadChildren: () => import('./features/property/property.module')
      .then(m => m.PropertyModule),
    canActivate: [AuthGuard]
  }
];

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
  }
];
```

### Pilar 3: Bus de Datos/Orquestación

#### Implementación del Event Bus
```typescript
// event-bus.service.ts (Servicio global)
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

  once(event: string): Observable<any> {
    return this.on(event).pipe(take(1));
  }
}
```

#### DTOs de Eventos Estructurados
```typescript
// property.events.ts
export abstract class PropertyEvent {
  constructor(public readonly timestamp: Date = new Date()) {}
}

export class PropertyCreatedEvent extends PropertyEvent {
  constructor(public readonly property: Property) {
    super();
  }
}

export class PropertyUpdatedEvent extends PropertyEvent {
  constructor(
    public readonly property: Property,
    public readonly changes: string[]
  ) {
    super();
  }
}

export class PropertyFiltersChangedEvent extends PropertyEvent {
  constructor(public readonly filters: PropertyFilters) {
    super();
  }
}
```

#### Uso en Servicios
```typescript
@Injectable()
export class PropertyService {
  constructor(
    private http: HttpClient,
    private eventBus: EventBusService
  ) {}

  create(propertyData: CreatePropertyDto): Observable<Property> {
    return this.http.post<Property>('/api/properties', propertyData).pipe(
      tap(createdProperty => {
        // Emitir evento tipado
        this.eventBus.emit('property-created', new PropertyCreatedEvent(createdProperty));

        // Persistir en localStorage
        localStorage.setItem('last-created-property', JSON.stringify(createdProperty));
      })
    );
  }

  update(id: string, updates: UpdatePropertyDto): Observable<Property> {
    return this.http.put<Property>(`/api/properties/${id}`, updates).pipe(
      tap(updatedProperty => {
        this.eventBus.emit('property-updated', new PropertyUpdatedEvent(
          updatedProperty,
          Object.keys(updates)
        ));
      })
    );
  }
}
```

#### Suscripción en Componentes
```typescript
export class PropertyListComponent implements OnInit, OnDestroy {
  private subscriptions = new Subscription();

  constructor(
    private propertyService: PropertyService,
    private eventBus: EventBusService
  ) {}

  ngOnInit(): void {
    this.setupEventListeners();
    this.loadProperties();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  private setupEventListeners(): void {
    // Escuchar creación de propiedades
    const sub1 = this.eventBus.on('property-created')
      .subscribe((event: PropertyCreatedEvent) => {
        this.onPropertyCreated(event.property);
      });

    // Escuchar cambios globales
    const sub2 = this.eventBus.on('global-filters-reset')
      .subscribe(() => {
        this.resetFilters();
      });

    this.subscriptions.add(sub1);
    this.subscriptions.add(sub2);
  }

  private onPropertyCreated(property: Property): void {
    // Actualizar lista local
    this.properties.unshift(property);
    // Mostrar notificación
    // ...
  }
}
```

### Pilar 4: Features Globales

#### Servicios Globales Justificados
```typescript
// auth.service.ts (Global - Justificado)
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUser$ = new BehaviorSubject<User | null>(null);

  get currentUser(): Observable<User | null> {
    return this.currentUser$.asObservable();
  }

  constructor() {
    this.initializeAuth();
  }

  private async initializeAuth(): Promise<void> {
    const token = localStorage.getItem('auth-token');
    if (token) {
      try {
        const user = await this.validateToken(token);
        this.currentUser$.next(user);
      } catch {
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

// config.service.ts (Global - Justificado)
@Injectable({
  providedIn: 'root'
})
export class ConfigService {
  private config = {
    apiUrl: environment.apiUrl,
    maxFileSize: 10 * 1024 * 1024, // 10MB
    supportedCurrencies: ['USD', 'EUR', 'GBP'],
    defaultPageSize: 10
  };

  get<T>(key: string): T {
    return this.config[key as keyof typeof this.config] as T;
  }

  getAll(): typeof this.config {
    return { ...this.config };
  }
}
```

#### Guards Globales
```typescript
// auth.guard.ts (Global)
@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  canActivate(route: ActivatedRouteSnapshot): Observable<boolean> {
    return this.authService.currentUser.pipe(
      take(1),
      map(user => {
        if (user) {
          return true;
        } else {
          this.router.navigate(['/login']);
          return false;
        }
      })
    );
  }
}
```

#### Interceptors Globales
```typescript
// jwt.interceptor.ts (Global)
@Injectable()
export class JwtInterceptor implements HttpInterceptor {
  constructor(private authService: AuthService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return this.authService.currentUser.pipe(
      take(1),
      switchMap(user => {
        if (user?.token) {
          request = request.clone({
            setHeaders: {
              Authorization: `Bearer ${user.token}`
            }
          });
        }
        return next.handle(request);
      })
    );
  }
}

// error.interceptor.ts (Global)
@Injectable()
export class ErrorInterceptor implements HttpInterceptor {
  constructor(
    private eventBus: EventBusService,
    private router: Router
  ) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        if (error.status === 401) {
          this.eventBus.emit('auth-error', error);
          this.router.navigate(['/login']);
        } else if (error.status >= 500) {
          this.eventBus.emit('server-error', error);
        }
        return throwError(error);
      })
    );
  }
}
```

### Pilar 5: Protocolo de Inicialización/Finalización

#### Lifecycle en Componentes
```typescript
export class PropertyCreateComponent implements OnInit, OnDestroy, CanDeactivate<PropertyCreateComponent> {
  private subscriptions = new Subscription();
  private destroy$ = new Subject<void>();

  constructor(
    private propertyState: PropertyStateService,
    private eventBus: EventBusService
  ) {}

  ngOnInit(): void {
    // 1. Inicializar estado del componente
    this.initializeComponent();

    // 2. Configurar subscriptions
    this.setupSubscriptions();

    // 3. Cargar datos iniciales
    this.loadInitialData();
  }

  ngOnDestroy(): void {
    // 1. Cancelar subscriptions
    this.subscriptions.unsubscribe();
    this.destroy$.next();
    this.destroy$.complete();

    // 2. Limpiar estado local
    this.clearLocalState();

    // 3. Notificar salida del componente
    this.eventBus.emit('property-create-component-destroyed', {
      timestamp: new Date()
    });
  }

  canDeactivate(): Observable<boolean> | Promise<boolean> | boolean {
    if (this.hasUnsavedChanges()) {
      return confirm('¿Desea salir sin guardar los cambios?');
    }
    return true;
  }

  private initializeComponent(): void {
    // Reset de estado específico del componente
    this.propertyState.resetDraft();
  }

  private setupSubscriptions(): void {
    // Subscriptions que se limpian automáticamente
    const sub1 = this.propertyState.isLoading
      .pipe(takeUntil(this.destroy$))
      .subscribe(loading => {
        // Manejar loading state
      });

    const sub2 = this.eventBus.on('global-reset')
      .pipe(takeUntil(this.destroy$))
      .subscribe(() => {
        this.resetComponent();
      });

    this.subscriptions.add(sub1);
    this.subscriptions.add(sub2);
  }

  private loadInitialData(): void {
    // Cargar datos necesarios para el componente
  }

  private clearLocalState(): void {
    // Limpiar variables locales, timers, etc.
  }

  private resetComponent(): void {
    // Reset completo del componente
    this.initializeComponent();
  }

  private hasUnsavedChanges(): boolean {
    // Lógica para detectar cambios sin guardar
    return this.propertyForm?.dirty ?? false;
  }
}
```

#### Servicios con Lifecycle
```typescript
@Injectable()
export class PropertyStateService {
  private subscriptions = new Subscription();
  private initialized = false;

  // Método público para inicialización controlada
  initialize(): void {
    if (this.initialized) return;

    this.resetState();
    this.loadPersistedState();
    this.setupGlobalSubscriptions();
    this.initialized = true;

    this.eventBus.emit('property-state-initialized', {
      timestamp: new Date()
    });
  }

  // Método público para destrucción controlada
  destroy(): void {
    if (!this.initialized) return;

    this.subscriptions.unsubscribe();
    this.persistState();
    this.resetState();
    this.initialized = false;

    this.eventBus.emit('property-state-destroyed', {
      timestamp: new Date()
    });
  }

  private resetState(): void {
    // Reset completo del estado
  }

  private loadPersistedState(): void {
    // Cargar estado desde localStorage
  }

  private persistState(): void {
    // Persistir estado actual
  }

  private setupGlobalSubscriptions(): void {
    // Subscriptions que viven mientras el servicio está activo
    const sub = this.eventBus.on('global-state-reset')
      .subscribe(() => {
        this.resetState();
      });

    this.subscriptions.add(sub);
  }
}
```

### Pilar 6: Manejo Centralizado de Estado

#### Patrón de Estado Centralizado
```typescript
@Injectable({
  providedIn: 'root'
})
export class PropertyStateService {
  // Estado privado inmutable
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
    draft: null as Partial<Property> | null,
    isLoading: false,
    error: null as string | null,
  };

  // Subjects para reactividad
  private selectedProperty$ = new BehaviorSubject<Property | null>(null);
  private filters$ = new BehaviorSubject<PropertyFilters>(this._state.filters);
  private loading$ = new BehaviorSubject<boolean>(false);
  private error$ = new BehaviorSubject<string | null>(null);

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

  get error(): Observable<string | null> {
    return this.error$.asObservable();
  }

  // Getters para valores actuales (snapshots)
  get currentFilters(): PropertyFilters {
    return { ...this._state.filters };
  }

  get currentSelectedProperty(): Property | null {
    return this._state.selectedProperty;
  }

  // Métodos controlados para mutar estado
  setSelectedProperty(property: Property | null): void {
    this._state.selectedProperty = property;
    this.selectedProperty$.next(property);

    // Persistir selección
    this.persistSelectedProperty(property);
  }

  updateFilters(newFilters: Partial<PropertyFilters>): void {
    this._state.filters = { ...this._state.filters, ...newFilters };
    this.filters$.next(this._state.filters);

    // Persistir filtros
    this.persistFilters(this._state.filters);

    // Emitir evento
    this.eventBus.emit('property-filters-changed', {
      filters: this._state.filters,
      timestamp: new Date(),
    });
  }

  setLoading(loading: boolean): void {
    this._state.isLoading = loading;
    this.loading$.next(loading);
  }

  setError(error: string | null): void {
    this._state.error = error;
    this.error$.next(error);
  }

  updateDraft(draft: Partial<Property>): void {
    this._state.draft = { ...this._state.draft, ...draft };
  }

  saveDraft(): Property | null {
    if (this._state.draft) {
      const property = { ...this._state.draft } as Property;
      this._state.draft = null;
      return property;
    }
    return null;
  }

  clearDraft(): void {
    this._state.draft = null;
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
      draft: null,
      isLoading: false,
      error: null,
    };

    // Resetear subjects
    this.selectedProperty$.next(null);
    this.filters$.next(this._state.filters);
    this.loading$.next(false);
    this.error$.next(null);

    // Limpiar persistencia
    this.clearPersistedState();
  }

  // Métodos privados de persistencia
  private persistSelectedProperty(property: Property | null): void {
    const key = 'selected-property';
    if (property) {
      localStorage.setItem(key, JSON.stringify(property));
    } else {
      localStorage.removeItem(key);
    }
  }

  private persistFilters(filters: PropertyFilters): void {
    localStorage.setItem('property-filters', JSON.stringify(filters));
  }

  private clearPersistedState(): void {
    localStorage.removeItem('selected-property');
    localStorage.removeItem('property-filters');
  }
}
```

#### Integración con Componentes
```typescript
export class PropertyListComponent implements OnInit, OnDestroy {
  // Estado reactivo
  filters$ = this.propertyState.filters;
  isLoading$ = this.propertyState.isLoading;
  error$ = this.propertyState.error;

  // Valores actuales para templates
  currentFilters = this.propertyState.currentFilters;

  private subscriptions = new Subscription();

  constructor(
    private propertyService: PropertyService,
    private propertyState: PropertyStateService,
    private eventBus: EventBusService
  ) {}

  ngOnInit(): void {
    this.setupSubscriptions();
    this.loadProperties();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  private setupSubscriptions(): void {
    // Reactividad automática a cambios de filtros
    const sub1 = this.filters$.subscribe(filters => {
      this.currentFilters = filters;
      this.loadProperties(); // Recargar con nuevos filtros
    });

    // Manejo de errores
    const sub2 = this.error$.subscribe(error => {
      if (error) {
        // Mostrar error al usuario
        console.error('Property error:', error);
      }
    });

    this.subscriptions.add(sub1);
    this.subscriptions.add(sub2);
  }

  onFilterChange(newFilters: Partial<PropertyFilters>): void {
    this.propertyState.updateFilters(newFilters);
    // La recarga automática se hace via subscription
  }

  onPropertySelect(property: Property): void {
    this.propertyState.setSelectedProperty(property);
    // Navegar o mostrar detalles
  }

  refresh(): void {
    this.loadProperties();
  }

  private async loadProperties(): void {
    this.propertyState.setLoading(true);
    this.propertyState.setError(null);

    try {
      const properties = await this.propertyService
        .findAll(this.currentFilters)
        .toPromise();

      // Actualizar estado con resultados
      this.propertyState.setProperties(properties);
    } catch (error) {
      this.propertyState.setError(error.message);
    } finally {
      this.propertyState.setLoading(false);
    }
  }
}
```

## 4. Patrones de Testing OMA

### Testing de Servicios
```typescript
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
    const createDto = { name: 'Test Property' };

    service.create(createDto).subscribe(property => {
      expect(property).toEqual(mockProperty);
    });

    const req = httpMock.expectOne('/api/properties');
    expect(req.request.method).toBe('POST');
    req.flush(mockProperty);

    expect(eventBusMock.emit).toHaveBeenCalledWith(
      'property-created',
      jasmine.any(PropertyCreatedEvent)
    );
  });

  it('should handle errors gracefully', () => {
    const createDto = { name: 'Test Property' };

    service.create(createDto).subscribe(
      () => fail('Should have failed'),
      error => expect(error).toBeDefined()
    );

    const req = httpMock.expectOne('/api/properties');
    req.error(new ErrorEvent('network error'));
  });
});
```

### Testing de Estado
```typescript
describe('PropertyStateService', () => {
  let service: PropertyStateService;
  let eventBusMock: jasmine.SpyObj<EventBusService>;

  beforeEach(() => {
    const eventBusSpy = jasmine.createSpyObj('EventBusService', ['emit']);

    TestBed.configureTestingModule({
      providers: [
        PropertyStateService,
        { provide: EventBusService, useValue: eventBusSpy }
      ]
    });

    service = TestBed.inject(PropertyStateService);
    eventBusMock = TestBed.inject(EventBusService) as jasmine.SpyObj<EventBusService>;
  });

  it('should update filters and emit event', () => {
    const newFilters = { location: 'Madrid', type: 'apartment' };

    service.updateFilters(newFilters);

    expect(service.currentFilters.location).toBe('Madrid');
    expect(service.currentFilters.type).toBe('apartment');
    expect(eventBusMock.emit).toHaveBeenCalled();
  });

  it('should return observable for filters', (done) => {
    const newFilters = { location: 'Barcelona' };

    service.filters.subscribe(filters => {
      expect(filters.location).toBe('Barcelona');
      done();
    });

    service.updateFilters(newFilters);
  });

  it('should reset state completely', () => {
    // Setup state
    service.setSelectedProperty({ id: '1', name: 'Test' } as Property);
    service.updateFilters({ location: 'Madrid' });

    // Reset
    service.resetState();

    // Verify
    expect(service.currentSelectedProperty).toBeNull();
    expect(service.currentFilters.location).toBe('');
  });
});
```

### Testing de Componentes
```typescript
describe('PropertyCreateComponent', () => {
  let component: PropertyCreateComponent;
  let fixture: ComponentFixture<PropertyCreateComponent>;
  let propertyStateMock: jasmine.SpyObj<PropertyStateService>;
  let propertyServiceMock: jasmine.SpyObj<PropertyService>;

  beforeEach(async () => {
    const stateSpy = jasmine.createSpyObj('PropertyStateService',
      ['setLoading', 'setError', 'updateDraft', 'resetDraft']);
    const serviceSpy = jasmine.createSpyObj('PropertyService', ['create']);

    await TestBed.configureTestingModule({
      declarations: [PropertyCreateComponent],
      providers: [
        FormBuilder,
        { provide: PropertyStateService, useValue: stateSpy },
        { provide: PropertyService, useValue: serviceSpy }
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(PropertyCreateComponent);
    component = fixture.componentInstance;
    propertyStateMock = TestBed.inject(PropertyStateService) as jasmine.SpyObj<PropertyStateService>;
    propertyServiceMock = TestBed.inject(PropertyService) as jasmine.SpyObj<PropertyService>;
  });

  it('should create form on init', () => {
    fixture.detectChanges();
    expect(component.propertyForm).toBeDefined();
    expect(component.propertyForm.get('name')).toBeDefined();
  });

  it('should call service on submit', () => {
    const mockProperty = { id: '1', name: 'Test Property' };
    propertyServiceMock.create.and.returnValue(of(mockProperty));

    fixture.detectChanges();
    component.propertyForm.patchValue({ name: 'Test Property' });
    component.onSubmit();

    expect(propertyServiceMock.create).toHaveBeenCalled();
    expect(propertyStateMock.setLoading).toHaveBeenCalledWith(true);
  });

  it('should handle submit errors', () => {
    propertyServiceMock.create.and.returnValue(throwError('Error'));

    fixture.detectChanges();
    component.propertyForm.patchValue({ name: 'Test Property' });
    component.onSubmit();

    expect(propertyStateMock.setError).toHaveBeenCalled();
  });
});
```

## 5. Checklist de Auditoría OMA

### Checklist por Pilar
- **Pilar 1:** ¿Todos los archivos siguen patrón `[feature].[description].[type].ts`?
- **Pilar 2:** ¿Los módulos tienen imports mínimos y providers específicos?
- **Pilar 3:** ¿Se usa EventBus con DTOs tipados para comunicación?
- **Pilar 4:** ¿Los servicios globales están justificados y marcados correctamente?
- **Pilar 5:** ¿Se implementan ngOnInit/ngOnDestroy con limpieza adecuada?
- **Pilar 6:** ¿El estado está centralizado con mutaciones controladas?

### Checklist de Code Review
- [ ] Nombres de archivos consistentes con patrón OMA
- [ ] Imports organizados y sin masivos
- [ ] Servicios con scope apropiado (feature vs global)
- [ ] EventBus usado para comunicación entre features
- [ ] Lifecycle hooks implementados correctamente
- [ ] Estado mutado solo a través de métodos del servicio
- [ ] Subscriptions limpiadas en ngOnDestroy
- [ ] Guards y resolvers implementados donde necesario
- [ ] Tests cubren servicios, estado y componentes
- [ ] Documentación de métodos complejos

## 6. Scripts de Validación

### Validador de Nombres
```bash
#!/bin/bash
# validate-oma-angular.sh

echo "🔍 Validando nomenclatura OMA para Angular..."

find src -name "*.ts" -o -name "*.html" -o -name "*.scss" | while read file; do
  filename=$(basename "$file")
  name_without_ext="${filename%.*}"

  if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
    echo "✅ $file"
  else
    echo "❌ $file (patrón incorrecto)"
  fi
done
```

### Verificador de Providers
```bash
#!/bin/bash
# check-angular-providers.sh

echo "🔍 Verificando providers en Angular..."

# Buscar servicios globales injustificados
grep -r "providedIn: 'root'" src/ | grep -v "auth\|config\|logger\|event-bus" | while read line; do
  echo "⚠️  Servicio global potencialmente injustificado: $line"
done
```

## 7. Referencias
- Ver `oma-philosophy.md` para fundamentos
- Ver `akuri.01-global-rules.md` para reglas generales
- Ver `akuri-workflow.master.md` para integración con workflows