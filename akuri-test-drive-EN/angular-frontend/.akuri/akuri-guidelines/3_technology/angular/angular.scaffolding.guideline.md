---
trigger: model_decision
description: Detailed guide on the creation and configuration of the three fundamental files of an Angular Akuri-OMA functionality (entry, routes, state). Details their purpose for initialization, routing, and modular state management.
status: active
linked_files: [`angular.feature-structure-and-naming.guideline.md`]
use_case: BUILD, DESIGN, PLAN, AUDIT
---

# Angular: Functionality Scaffolding (Entry, Routes, State) (scaffolding.guideline.md)

## 1. Introduction and Purpose

This guideline details the creation of the three fundamental files that form the "scaffolding" of any `standard` or `complex` functionality in Angular Akuri-OMA. The correct creation of these three files is the foundation for a modular and decoupled functionality.

YOU, as an Akuri Agent, must generate these files in the **Phase 3: Architectural Blueprint** and define their skeleton in the **Phase 4**.

## 2. The Entry Component (`[prefix].entry.ts`)

-   **Purpose:** Acts as the entry point and controls the lifecycle of the functionality. Its responsibility is to **initialize and destroy** the functionality's context.
-   **Base Structure:**
    ```typescript
    import { Component, inject, OnDestroy, OnInit } from '@angular/core';
    import { [Prefix]StateService } from './services/state/[prefix].state.service';
    // ...

    @Component({
      selector: '[prefix]-entry',
      standalone: true,
      imports: [ /* RouterOutlet or others */ ],
      template: `<router-outlet />`,
    })
    export class [Prefix]Entry implements OnInit, OnDestroy {
      private stateService = inject([Prefix]StateService);

      ngOnInit(): void {
        // Initialization logic when entering the functionality.
        // this.stateService.storage.restore();
      }

      ngOnDestroy(): void {
        // Cleanup logic when exiting the functionality.
        // this.stateService.storage.exit();
      }
    }
    ```

## 3. The Routes File (`[prefix].routes.ts`)

-   **Purpose:** Defines the internal navigation of the functionality. All routes are **children (`children`)** of the `Entry Component`.
-   **Base Structure for `standard`:**
    ```typescript
    import { Routes } from '@angular/router';
    import { [Prefix]Entry } from './[prefix].entry';

    export const [PREFIX]_ROUTES: Routes = [
      {
        path: '',
        component: [Prefix]Entry,
        children: [
          { path: '', redirectTo: 'home', pathMatch: 'full' },
          // ... Routes to the functionality's pages
        ],
      },
    ];
    ```
-   **Base Structure for `complex`:**
    ```typescript
    import { Routes } from '@angular/router';
    import { [Prefix]Entry } from './[prefix].entry';

    export const [PREFIX]_ROUTES: Routes = [
      {
        path: '',
        component: [Prefix]Entry,
        children: [
          // Use 'loadChildren' to load sub-functionality routes
          { path: 'profile', loadChildren: () => import('./provider-profile/provider-profile.routes').then(m => m.PROVIDER_PROFILE_ROUTES) },
          // ...
        ],
      },
    ];
    ```

## 4. The State Service (`[prefix].state.service.ts`)

-   **Purpose:** It is the **single source of truth** for the functionality's state, using a `BehaviorSubject` to create a reactive state.
-   **Base Structure:**
    ```typescript
    import { Injectable, signal, WritableSignal } from '@angular/core';
    import { BehaviorSubject } from 'rxjs';
    import { SessionStorage } from '@core/orchest/';

    // 1. Define the state shape in an internal class
    class [Prefix]State {
      // State properties with initial values and strong typing
      // isLoading: WritableSignal<boolean> = signal(false);
    }

    // 2. Create the injectable service
    @Injectable({ providedIn: 'root' })
    export class [Prefix]StateService {
      private readonly prefix = '[PREFIX]-';

      private stateSubject$ = new BehaviorSubject<[Prefix]State>(new [Prefix]State());
      public readonly state$ = this.stateSubject$.asObservable();

      public state = new [Prefix]State();
      public storage = new SessionStorage(this.prefix, this.state);

      constructor() {
        this.state$.subscribe((state) => (this.state = state));
      }

      // DO NOT place business logic methods here.
    }