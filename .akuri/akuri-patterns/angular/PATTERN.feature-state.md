---
trigger: pattern
description: Patrón funcional para el servicio de estado de un feature en Angular, manejando variables compartidas.
---

# PATTERN: Feature State (Angular)

## Descripción
Patrón para el servicio de estado de un feature en Angular (`[feature].state.ts`). Gestiona variables de control de estado compartidas (ej., listas, perfiles) como singleton, permitiendo separación de lógica de negocio de componentes. Filosofía: "Estado transversal" – asegura reactividad y consistencia, con signals/BehaviorSubject para updates, y persistencia opcional.

## Filosofía
El estado debe ser centralizado y reactivo, evitando duplicación. Signals para datos simples, BehaviorSubject para complejos. Persistencia (sessionStorage) para resiliencia. Promueve modularidad: actions llenan estado, components lo consumen sin lógica.

## Cuándo Usar
- Para features con datos compartidos (listas, perfiles, sesiones).
- Cuando se requiere reactividad transversal sin acoplar lógica a UI.

## Requisitos Adicionales
- Usar signals para datos reactivos simples.
- BehaviorSubject para estados complejos.
- Inyectar en actions/components, no directamente en UI.
- Persistencia opcional con SessionStorage/LocalStorage.

## Información a Completar
- Nombre del feature (ej., 'auth', 'product').
- Propiedades de estado: Señales/subjects (ej., userList = signal<any[]>([])).
- Tipos: Importar modelos (ej., AuthProfileResponse).
- Persistencia: Prefix y storage si aplica.

## Snippet de Código Base (Modelo Oficial con RxJS)
```typescript
import { Injectable, signal, effect } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

import { FeatureResponse } from '../../models/entities/feature.response.model';
import { SessionStorage } from '@core/orchest/';

class FeatureState {
  // Señales para datos reactivos simples
  itemList = signal<any[]>([]);
  profileSync = signal<any>(null);

  // Subjects para estados complejos
  complexState = new BehaviorSubject<any>(null);
}

@Injectable({
  providedIn: 'root',
})
export class FeatureStateService {
  private stateSubject$ = new BehaviorSubject<FeatureState>(new FeatureState());
  public observableState$ = this.stateSubject$.asObservable();

  state = new FeatureState();
  prefix = 'FEATURE-';
  storage = new SessionStorage(this.prefix, this.state);

  constructor() {
    this.observableState$.subscribe((state) => (this.state = state));
  }

  // Métodos para actualizar estado
  updateItemList(items: any[]) {
    this.state.itemList.set(items);
    this.stateSubject$.next(this.state);
  }

  reset() {
    this.state = new FeatureState();
    this.stateSubject$.next(this.state);
  }
}
```

## Variante Moderna con Signals Exclusivos (En Pruebas)
Para un enfoque más moderno usando solo signals (sin RxJS), aquí un ejemplo genérico basado en NgRx-style pero simplificado:

```typescript
import { FeatureEntity } from './models/entity/feature.entity';
// ... otros imports

export interface FeatureState {
    items: FeatureEntity[];
    currentItem: FeatureEntity | null;
    relatedData: any[];
    loading: boolean;
    error: string | null;
}

export const featureInitialState: FeatureState = {
    items: [],
    currentItem: null,
    relatedData: [],
    loading: false,
    error: null
};

// Actions (simplified - would use NgRx in full implementation)
export const loadItems = '[Feature] Load Items';
export const loadItemsSuccess = '[Feature] Load Success';
export const loadItemsFailure = '[Feature] Load Failure';
export const createItem = '[Feature] Create Item';
export const createItemSuccess = '[Feature] Create Success';
export const createItemFailure = '[Feature] Create Failure';
// ... más actions

// Reducer (simplified - would use NgRx createReducer in full implementation)
export function featureReducer(
    state: FeatureState = featureInitialState,
    action: any
): FeatureState {
    switch (action.type) {
        case loadItems:
            return { ...state, loading: true, error: null };
        case loadItemsSuccess:
            return { ...state, items: action.payload, loading: false };
        case loadItemsFailure:
            return { ...state, loading: false, error: action.payload };
        case createItem:
            return { ...state, loading: true, error: null };
        case createItemSuccess:
            return {
                ...state,
                items: [...state.items, action.payload],
                loading: false
            };
        case createItemFailure:
            return { ...state, loading: false, error: action.payload };
        // ... más cases
        default:
            return state;
    }
}

// Effects (placeholder - would use NgRx createEffect in full implementation)
export const featureEffects = [
    // Effects would be defined here for async operations
];
```

**Nota:** El modelo oficial es RxJS por estabilidad; signals exclusivo está en pruebas para futuro.

## Parámetros
- `[feature]`: Reemplazar con nombre (ej., 'auth').
- Propiedades: Adaptar a datos reales (ej., userList para auth).

## Ejemplo de Uso
Para feature 'product': Renombrar a `product.state.ts`, definir signals como `productList = signal<Product[]>([])`, y usar en actions para llenar desde API, consumido en components para tablas.

## Caveats
- Evitar lógica de negocio aquí; solo estado.
- Usar signals para Angular moderno, BehaviorSubject para legacy.
- Persistencia solo para datos no sensibles.
- Reset en ngOnDestroy del entry para limpieza.