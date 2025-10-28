---
trigger: model_decision
description: Guía detallada sobre la creación y configuración de los tres archivos fundamentales de una funcionalidad Angular Akuri-OMA (entry, routes, state). Detalla su propósito para la inicialización, enrutamiento y gestión de estado modular.
status: active
linked_files: [`angular.feature-structure-and-naming.guideline.md`]
use_case: BUILD, DESIGN, PLAN, AUDIT
---

# Angular: Andamiaje de Funcionalidades (Entry, Routes, State) (scaffolding.guideline.md)

## 1. Introducción y Propósito

Este guideline detalla la creación de los tres archivos fundamentales que forman el "andamiaje" de cualquier funcionalidad `standard` o `complex` en Angular Akuri-OMA. La creación correcta de estos tres archivos es la base para una funcionalidad modular y desacoplada.

TÚ, como Agente Akuri, debes generar estos archivos en la **Fase 3: Blueprint Arquitectónico** y definir su esqueleto en la **Fase 4**.

## 2. El Entry Component (`[prefix].entry.ts`)

-   **Propósito:** Actúa como el punto de entrada y controla el ciclo de vida de la funcionalidad. Su responsabilidad es **inicializar y destruir** el contexto de la funcionalidad.
-   **Estructura Base:**
    ```typescript
    import { Component, inject, OnDestroy, OnInit } from '@angular/core';
    import { [Prefix]StateService } from './services/state/[prefix].state.service';
    // ...

    @Component({
      selector: '[prefix]-entry',
      standalone: true,
      imports: [ /* RouterOutlet u otros */ ],
      template: `<router-outlet />`,
    })
    export class [Prefix]Entry implements OnInit, OnDestroy {
      private stateService = inject([Prefix]StateService);

      ngOnInit(): void {
        // Lógica de inicialización al entrar en la funcionalidad.
        // this.stateService.storage.restore();
      }

      ngOnDestroy(): void {
        // Lógica de limpieza al salir de la funcionalidad.
        // this.stateService.storage.exit();
      }
    }
    ```

## 3. El Archivo de Rutas (`[prefix].routes.ts`)

-   **Propósito:** Define la navegación interna de la funcionalidad. Todas las rutas son **hijas (`children`)** del `Entry Component`.
-   **Estructura Base para `standard`:**
    ```typescript
    import { Routes } from '@angular/router';
    import { [Prefix]Entry } from './[prefix].entry';

    export const [PREFIX]_ROUTES: Routes = [
      {
        path: '',
        component: [Prefix]Entry,
        children: [
          { path: '', redirectTo: 'home', pathMatch: 'full' },
          // ... Rutas a las páginas de la funcionalidad
        ],
      },
    ];
    ```
-   **Estructura Base para `complex`:**
    ```typescript
    import { Routes } from '@angular/router';
    import { [Prefix]Entry } from './[prefix].entry';

    export const [PREFIX]_ROUTES: Routes = [
      {
        path: '',
        component: [Prefix]Entry,
        children: [
          // Usa 'loadChildren' para cargar las rutas de las sub-funcionalidades
          { path: 'profile', loadChildren: () => import('./provider-profile/provider-profile.routes').then(m => m.PROVIDER_PROFILE_ROUTES) },
          // ...
        ],
      },
    ];
    ```

## 4. El Servicio de Estado (`[prefix].state.service.ts`)

-   **Propósito:** Es la **fuente única de verdad** para el estado de la funcionalidad, utilizando un `BehaviorSubject` para crear un estado reactivo.
-   **Estructura Base:**
    ```typescript
    import { Injectable, signal, WritableSignal } from '@angular/core';
    import { BehaviorSubject } from 'rxjs';
    import { SessionStorage } from '@core/orchest/';

    // 1. Definir la forma del estado en una clase interna
    class [Prefix]State {
      // Propiedades del estado con valores iniciales y tipado fuerte
      // isLoading: WritableSignal<boolean> = signal(false);
    }

    // 2. Crear el servicio inyectable
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

      // NO se deben colocar métodos de lógica de negocio aquí.
    }
    ```