---
trigger: pattern
description: Functional pattern for Action services in Angular, orchestrating API calls, state, and navigation.
---

# PATTERN: Action Service (Angular)

## Description
Pattern for Action services in Angular (`[feature].action.service.ts`). They orchestrate complex flows: call APIs, update state, handle navigation, display messages. Philosophy: "Centralized Orchestration" – separates business logic/UI, centralizes side-effects, ensures transversal consistency.

## Philosophy
Actions handle "what to do" (calls, updates, navigation), not "how to display". They use injection for APIs/state, handle errors with toasts, clean data for storage. Promotes reusability and testing.

## When to Use
- For features with complex logic (CRUD + navigation, uploads).
- When orchestration between API, state, and UI is required.

## Additional Requirements
- Inject API, State, Router, MessageService.
- "on[Action]" methods for clarity (e.g., onCreate).
- Clean non-serializable data for sessionStorage.
- Handle loading/errors with state signals.

## Information to Complete
- Feature name (e.g., 'property-listing').
- APIs to inject (e.g., ApiService, ConfigApiService).
- States to update (e.g., selected, list).
- Navigation: Paths with layout prefix.
- Messages: Success/error with MessageService.

## Base Code Snippet
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

  // Initialization
  onInit(): void {
    this.loadData();
  }

  // Load data
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

  // Create
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
    // Implement navigation with layout prefix
  }

  // Clean non-serializable data
  private cleanData(data: any): any {
    // Implement cleaning of File/Blob
    return data;
  }
}
```

## Parameters
- `[feature]`: Replace with name.
- Methods: Adapt to real actions (create, update, delete, navigate).

## Usage Example
For 'property-listing': Rename, inject PropertyListingApiService/State, implement onCreate with data cleaning, navigation with layout prefix.

## Caveats
- Keep "on[Action]" methods for clarity.
- Always update state and storage.
- Use MessageService for feedback.
- Avoid UI logic; only orchestration.