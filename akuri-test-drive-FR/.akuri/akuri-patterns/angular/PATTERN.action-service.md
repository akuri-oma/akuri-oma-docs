---
trigger: pattern
description: Patron fonctionnel pour services Action en Angular, orchestrant appels API, état et navigation.
---

# PATTERN : Action Service (Angular)

## Description
Patron pour services Action en Angular (`[feature].action.service.ts`). Ils orchestrent flux complexes : appellent APIs, mettent à jour état, gèrent navigation, affichent messages. Philosophie : "Orchestration centralisée" – sépare logique métier/UI, centralise side-effects, assure consistance transversale.

## Philosophie
Les Actions gèrent "quoi faire" (appels, updates, navigation), pas "comment afficher". Ils utilisent injection pour APIs/état, gèrent erreurs avec toasts, nettoient données pour storage. Promouvant réutilisabilité et testing.

## Quand Utiliser
- Pour features avec logique complexe (CRUD + navigation, uploads).
- Quand orchestration entre API, état et UI est requise.

## Exigences Additionnelles
- Injecter API, State, Router, MessageService.
- Méthodes "on[Action]" pour clarté (ex., onCreate).
- Nettoyer données non sérialisables pour sessionStorage.
- Gérer loading/errors avec state signals.

## Information à Compléter
- Nom du feature (ex., 'property-listing').
- APIs à injecter (ex., ApiService, ConfigApiService).
- États à mettre à jour (ex., selected, list).
- Navigation : Paths avec layout prefix.
- Messages : Success/error avec MessageService.

## Snippet de Code Base
```typescript
import { inject, Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { MessageService } from 'primeng/api';

@Injectable({
  providedIn: 'root',
})
export class FeatureActionService {
  private readonly _api = inject(FeatureApiService);
  private readonly _state = inject(FeatureStateService);
  private readonly _messageService = inject(MessageService);
  private readonly _router = inject(Router);

  // Initialisation
  onInit(): void {
    this.loadData();
  }

  // Charger données
  loadData(): void {
    this._state.state.loading.set(true);
    this._api.findAll().subscribe({
      next: (data) => {
        this._state.state.dataList.set(data);
        this._state.state.loading.set(false);
      },
      error: (error) => {
        this._state.state.loading.set(false);
        this._messageService.add({ severity: 'error', summary: 'Error', detail: 'Failed to load data' });
      }
    });
  }

  // Créer
  onCreate(dto: any): void {
    this._state.state.loading.set(true);
    this._api.create(dto).subscribe({
      next: (item) => {
        this._state.state.selected.set(this.cleanData(item));
        this._state.state.loading.set(false);
        this._messageService.add({ severity: 'success', summary: 'Success', detail: 'Item created' });
        this.loadData(); // Refresh
      },
      error: (error) => {
        this._state.state.loading.set(false);
        this._messageService.add({ severity: 'error', summary: 'Error', detail: 'Failed to create' });
      }
    });
  }

  // Navigation
  onNavigateToList(): void {
    // Implémenter navigation avec layout prefix
  }

  // Nettoyer données non sérialisables
  private cleanData(data: any): any {
    // Implémenter nettoyage de File/Blob
    return data;
  }
}
```

## Paramètres
- `[feature]` : Remplacer avec nom.
- Méthodes : Adapter aux actions réelles (create, update, delete, navigate).

## Exemple d'Usage
Pour 'property-listing' : Renommer, injecter PropertyListingApiService/State, implémenter onCreate avec nettoyage de données, navigation avec layout prefix.

## Caveats
- Maintenir méthodes "on[Action]" pour clarté.
- Toujours mettre à jour état et storage.
- Utiliser MessageService pour feedback.
- Éviter logique UI ; seulement orchestration.