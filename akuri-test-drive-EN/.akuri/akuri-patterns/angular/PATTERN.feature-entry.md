---
trigger: pattern
description: Functional pattern for the entry file to a feature in Angular, handling initialization and cleanup.
---

# PATTERN: Feature Entry (Angular)

## Description
Pattern for the entry file to a feature in Angular (usually `[feature].entry.ts`). Acts as a control point to initialize services/states when entering the feature and clean up processes/variables when exiting. Philosophy: "Controlled Entry" – ensures the feature is self-contained, avoiding memory leaks or orphaned processes.

## Philosophy
The feature must be modular and autonomous. OnInit initializes critical dependencies (states, subscriptions, configs), while OnDestroy resets everything to avoid impacts on other features. Promotes cleanliness and performance.

## When to Use
- For any feature in Angular akuri-oma.
- When the feature requires global state or specific initializations.

## Additional Requirements
- Inject state services (e.g., FeatureStateService).
- Configure guards/resolvers if applicable.
- Use standalone components for modularity.

## Information to Complete
- Feature name (e.g., 'auth', 'product').
- Services to inject (e.g., AuthStateService).
- Logic in ngOnInit (initializations: load data, subscribe to events).
- Logic in ngOnDestroy (cleanups: unsubscribe, reset states, close connections).

## Base Code Snippet
```typescript
import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';

import { TranslocoModule } from '@jsverse/transloco';
import { jwtDecode } from 'jwt-decode';
import { FeatureStateService } from './services/state/feature.state.service';
import { FeatureIdo } from '@core/orchest/models/ido/feature.ido';
import { OrchestStateService } from '@core/orchest';

@Component({
  selector: '[feature]-entry',
  standalone: true,
  imports: [RouterOutlet, TranslocoModule],
  template: ` <router-outlet /> `,
  styles: ``,
})
export class FeatureEntry implements OnInit, OnDestroy {
  _orchest = inject(OrchestStateService);
  _featureState = inject(FeatureStateService);
  _router = inject(Router);

  constructor() { }

  ngOnInit(): void {
    // Initialize: load data, subscribe to events, configure state
    // Example: this._featureState.loadInitialData();
  }

  ngOnDestroy(): void {
    // Clean up: reset states, unsubscribe, close processes
    // Example: this._featureState.reset();
  }
}
```

## Parameters
- `[feature]`: Replace with feature name (e.g., 'auth').
- Services: Adapt to real dependencies.

## Usage Example
For feature 'product': Rename to `product.entry.ts`, inject ProductStateService, and complete ngOnInit/ngOnDestroy with specific logic.

## Caveats
- Keep ngOnInit/ngOnDestroy mandatory.
- Avoid heavy logic in constructor; use ngOnInit.
- For features without state, simplify to only router-outlet.