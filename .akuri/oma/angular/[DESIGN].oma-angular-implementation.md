---
trigger: design
description: Diseño conceptual de la implementación OMA en Angular, definiendo cómo se materializan los seis pilares en arquitectura frontend.
status: active
use_case: DESIGN
---

# [DESIGN] OMA Angular Implementation

## 1. Entorno de Ejecución
### 1.1 Infraestructura
- **Framework:** Angular 14+ con TypeScript
- **Arquitectura:** Component-based con módulos lazy-loaded
- **State Management:** Servicios custom + RxJS (NgRx opcional)
- **Routing:** Feature modules con lazy loading

### 1.2 Tecnologías
- **Lenguaje:** TypeScript con decoradores
- **Reactividad:** RxJS (Observables, Subjects, Operators)
- **UI:** Angular Material + CDK
- **Forms:** Reactive Forms con validación
- **HTTP:** HttpClient con interceptors

## 2. Explicación de la Solución
Implementaremos OMA en Angular aprovechando su arquitectura basada en componentes y módulos. Cada feature será un módulo lazy-loaded con servicios dedicados, comunicándose a través de Subjects RxJS y localStorage para persistencia.

## 3. Resolución de Problemas

### 3.1 Desacoplamiento
**Problema:** Componentes acoplados dificultan mantenimiento.
**Solución:** Servicios singleton por feature + interfaces claras.

### 3.2 Comunicación entre Features
**Problema:** Cómo features se comunican sin acoplamiento directo.
**Solución:** Event bus con RxJS Subjects + localStorage.

### 3.3 Estado por Feature
**Problema:** Estado disperso en componentes.
**Solución:** Servicios de estado centralizados con BehaviorSubjects.

## 4. Arquitectura de Alto Nivel

```
AppModule (Root)
├── CoreModule (Features Globales)
│   ├── AuthModule
│   ├── ConfigModule
│   └── SharedModule
├── Feature Modules (Lazy-loaded)
│   ├── PropertyModule
│   ├── UserModule
│   └── PaymentModule
└── AppRoutingModule
    └── Feature Routes (Lazy)
```

## 5. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```typescript
// ✅ CORRECTO
// Archivo: property.create.component.ts
@Component({...})
export class PropertyCreateComponent {
  // Propiedades en camelCase
  public propertyForm: FormGroup;
  private readonly MAX_PRICE = 10000000;

  // Métodos en camelCase
  public onSubmit(): void {
    // Implementation
  }
}

// Archivo: property.create.component.html
<!-- Template correspondiente -->

// Archivo: property.create.component.scss
/* Styles correspondientes */
```

### Pilar 2: Desacoplamiento/Modularidad
```typescript
// property.module.ts
@NgModule({
  declarations: [PropertyListComponent, PropertyCreateComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    PropertyRoutingModule, // Rutas específicas del feature
  ],
  providers: [
    PropertyService, // Servicio del feature
    PropertyStateService, // Estado del feature
  ],
})
export class PropertyModule { }

// property-routing.module.ts
const routes: Routes = [
  {
    path: '',
    component: PropertyListComponent,
  },
  {
    path: 'create',
    component: PropertyCreateComponent,
  },
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

// Uso en servicios
@Injectable({
  providedIn: 'root'
})
export class PropertyService {
  constructor(private eventBus: EventBusService, private http: HttpClient) {}

  create(property: PropertyCreate): Observable<Property> {
    return this.http.post<Property>('/api/properties', property).pipe(
      tap(createdProperty => {
        // Emitir evento para otros features
        this.eventBus.emit('property-created', createdProperty);

        // Persistir en localStorage si necesario
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

  get currentUser(): Observable<User | null> {
    return this.currentUser$.asObservable();
  }

  login(credentials: LoginCredentials): Observable<User> {
    return this.http.post<User>('/api/auth/login', credentials).pipe(
      tap(user => this.currentUser$.next(user))
    );
  }

  logout(): void {
    this.currentUser$.next(null);
    localStorage.removeItem('auth-token');
  }
}

// app.component.ts - Inicialización global
export class AppComponent implements OnInit {
  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    // Inicializar estado global
    const token = localStorage.getItem('auth-token');
    if (token) {
      // Validar token y restaurar sesión
    }
  }
}
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
    this.eventBus.emit('property-filters-changed', this._state.filters);
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

## 6. Integración con Routing
```typescript
// app-routing.module.ts
const routes: Routes = [
  {
    path: 'auth',
    loadChildren: () => import('./modules/auth/auth.module').then(m => m.AuthModule)
  },
  {
    path: 'properties',
    loadChildren: () => import('./modules/property/property.module').then(m => m.PropertyModule),
    canActivate: [AuthGuard]
  },
  {
    path: '',
    redirectTo: '/properties',
    pathMatch: 'full'
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
    canDeactivate: [PropertyGuard] // Previene navegación con cambios sin guardar
  },
  {
    path: ':id',
    component: PropertyDetailComponent,
    resolve: { property: PropertyResolver }
  }
];
```

## 7. Estrategia de Forms
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
          this.propertyState.updateDraft(value);
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

## 8. Garantías de Criterios de Aceptación
- **Nombres estandarizados:** Patrón consistente en archivos y clases
- **Lazy loading:** Features cargados bajo demanda
- **Reutilización de estado:** Servicios singleton por feature
- **Comunicación desacoplada:** Event bus con RxJS
- **Ciclo de vida:** Inicialización/finalización automática
- **Performance:** OnPush change detection y unsubscriptions

## 9. Consideraciones de Seguridad
- Guards para protección de rutas
- Interceptors para JWT automático
- Sanitización de datos en templates
- Validación robusta en forms

## 10. Alternativas Consideradas
- **Monolito:** Dificulta mantenimiento → Rechazado
- **Micro-frontends:** Complejidad innecesaria → Opcional
- **Redux:** Overkill para features simples → Usar servicios custom

## 11. Riesgos y Mitigaciones
- **Memory leaks:** Unsubscriptions automáticas → Mitigación: takeUntil pattern
- **Estado inconsistente:** Mutaciones controladas → Mitigación: Métodos dedicados
- **Navegación compleja:** Guards y resolvers → Mitigación: CanDeactivate/CanActivate