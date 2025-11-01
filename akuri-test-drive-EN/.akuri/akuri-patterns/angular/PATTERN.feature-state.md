---
trigger: pattern
description: Functional pattern for the state service of a feature in Angular, handling shared variables.
---

# PATTERN: Feature State (Angular)

## Description
Pattern for the state service of a feature in Angular (`[feature].state.ts`). Manages shared control state variables (e.g., lists, profiles) as singleton, allowing separation of business logic from components. Philosophy: "Transversal State" – ensures reactivity and consistency, with signals/BehaviorSubject for updates, and optional persistence.

## Philosophy
State must be centralized and reactive, avoiding duplication. Signals for simple data, BehaviorSubject for complex. Persistence (sessionStorage) for resilience. Promotes modularity: actions fill state, components consume it without logic.

## When to Use
- For features with shared data (lists, profiles, sessions).
- When transversal reactivity is required without coupling logic to UI.

## Additional Requirements
- Use signals for simple reactive data.
- BehaviorSubject for complex states.
- Inject in actions/components, not directly in UI.
- Optional persistence with SessionStorage/LocalStorage.

## Information to Complete
- Feature name (e.g., 'auth', 'product').
- State properties: Signals/subjects (e.g., userList = signal<any[]>([])).
- Types: Import models (e.g., AuthProfileResponse).
- Persistence: Prefix and storage if applicable.

## Base Code Snippet (Official Model with RxJS)
```typescript
import { Injectable, signal, effect } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

import { FeatureResponse } from '../../models/entities/feature.response.model';
import { SessionStorage } from '@core/orchest/';

class FeatureState {
  // Signals for simple reactive data
  itemList = signal<any[]>([]);
  profileSync = signal<any>(null);

  // Subjects for complex states
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

  // Methods to update state
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

## Modern Variant with Exclusive Signals (In Testing)
For a more modern approach using only signals (without RxJS), here a generic example based on NgRx-style but simplified:

```typescript
import { FeatureEntity } from './models/entity/feature.entity';
// ... other imports

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
// ... more actions

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
        // ... more cases
        default:
            return state;
    }
}

// Effects (placeholder - would use NgRx createEffect in full implementation)
export const featureEffects = [
    // Effects would be defined here for async operations
];
```

**Note:** The official model is RxJS for stability; exclusive signals is in testing for the future.

## Parameters
- `[feature]`: Replace with name (e.g., 'auth').
- Properties: Adapt to real data (e.g., userList for auth).

## Usage Example
For feature 'product': Rename to `product.state.ts`, define signals like `productList = signal<Product[]>([])`, and use in actions to fill from API, consumed in components for tables.

## Caveats
- Avoid business logic here; only state.
- Use signals for modern Angular, BehaviorSubject for legacy.
- Persistence only for non-sensitive data.
- Reset in ngOnDestroy of entry for cleanup.