---
trigger: pattern
description: Patron fonctionnel pour le service d'état d'un feature en Angular, gérant variables partagées.
---

# PATTERN : Feature State (Angular)

## Description
Patron pour le service d'état d'un feature en Angular (`[feature].state.ts`). Gère variables de contrôle d'état partagées (ex., listes, profils) comme singleton, permettant séparation de logique métier de composants. Philosophie : "État transversal" – assure réactivité et consistance, avec signals/BehaviorSubject pour updates, et persistance optionnelle.

## Philosophie
L'état doit être centralisé et réactif, évitant duplication. Signals pour données simples, BehaviorSubject pour complexes. Persistance (sessionStorage) pour résilience. Promouvant modularité : actions remplissent état, components le consomment sans logique.

## Quand Utiliser
- Pour features avec données partagées (listes, profils, sessions).
- Quand réactivité transversale sans coupler logique à UI est requise.

## Exigences Additionnelles
- Utiliser signals pour données réactives simples.
- BehaviorSubject pour états complexes.
- Injecter dans actions/components, pas directement dans UI.
- Persistance optionnelle avec SessionStorage/LocalStorage.

## Information à Compléter
- Nom du feature (ex., 'auth', 'product').
- Propriétés d'état : Signaux/subjects (ex., userList = signal<any[]>([])).
- Types : Importer modèles (ex., AuthProfileResponse).
- Persistance : Prefix et storage si applicable.

## Snippet de Code Base (Modèle Officiel avec RxJS)
```typescript
import { Injectable, signal, effect } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

import { FeatureResponse } from '../../models/entities/feature.response.model';
import { SessionStorage } from '@core/orchest/';

class FeatureState {
  // Signaux pour données réactives simples
  itemList = signal<any[]>([]);
  profileSync = signal<any>(null);

  // Subjects pour états complexes
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

  // Méthodes pour mettre à jour état
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

## Variante Moderne avec Signals Exclusifs (En Tests)
Pour une approche plus moderne utilisant seulement signals (sans RxJS), voici un exemple générique basé sur NgRx-style mais simplifié :

```typescript
import { FeatureEntity } from './models/entity/feature.entity';
// ... autres imports

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
// ... plus d'actions

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
        // ... plus de cases
        default:
            return state;
    }
}

// Effects (placeholder - would use NgRx createEffect in full implementation)
export const featureEffects = [
    // Effects would be defined here for async operations
];
```

**Note :** Le modèle officiel est RxJS pour stabilité ; signals exclusif est en tests pour futur.

## Paramètres
- `[feature]` : Remplacer avec nom (ex., 'auth').
- Propriétés : Adapter aux données réelles (ex., userList pour auth).

## Exemple d'Usage
Pour feature 'product' : Renommer à `product.state.ts`, définir signals comme `productList = signal<Product[]>([])`, et utiliser dans actions pour remplir depuis API, consommé dans components pour tableaux.

## Caveats
- Éviter logique métier ici ; seulement état.
- Utiliser signals pour Angular moderne, BehaviorSubject pour legacy.
- Persistance seulement pour données non sensibles.
- Reset dans ngOnDestroy de l'entry pour nettoyage.