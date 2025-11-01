---
trigger: pattern
description: Patrón funcional para el archivo de entrada a un feature en Angular, manejando inicialización y limpieza.
---

# PATTERN: Feature Entry (Angular)

## Descripción
Patrón para el archivo de entrada a un feature en Angular (normalmente `[feature].entry.ts`). Actúa como punto de control para inicializar servicios/estados al ingresar al feature y limpiar procesos/variables al salir. Filosofía: "Entrada controlada" – asegura que el feature sea self-contained, evitando leaks de memoria o procesos huérfanos.

## Filosofía
El feature debe ser modular y autónomo. OnInit inicializa dependencias críticas (estados, suscripciones, configs), mientras OnDestroy resetea todo para evitar impactos en otros features. Promueve limpieza y performance.

## Cuándo Usar
- Para cualquier feature en Angular akuri-oma.
- Cuando el feature requiere estado global o inicializaciones específicas.

## Requisitos Adicionales
- Inyectar servicios de estado (ej., FeatureStateService).
- Configurar guards/resolvers si aplica.
- Usar standalone components para modularidad.

## Información a Completar
- Nombre del feature (ej., 'auth', 'product').
- Servicios a inyectar (ej., AuthStateService).
- Lógica en ngOnInit (inicializaciones: cargar datos, suscribirse a eventos).
- Lógica en ngOnDestroy (limpiezas: unsubscribe, reset estados, cerrar conexiones).

## Snippet de Código Base
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
    // Inicializar: cargar datos, suscribirse a eventos, configurar estado
    // Ejemplo: this._featureState.loadInitialData();
  }

  ngOnDestroy(): void {
    // Limpiar: resetear estados, unsubscribe, cerrar procesos
    // Ejemplo: this._featureState.reset();
  }
}
```

## Parámetros
- `[feature]`: Reemplazar con nombre del feature (ej., 'auth').
- Servicios: Adaptar a dependencias reales.

## Ejemplo de Uso
Para feature 'product': Renombrar a `product.entry.ts`, inyectar ProductStateService, y completar ngOnInit/ngOnDestroy con lógica específica.

## Caveats
- Mantener ngOnInit/ngOnDestroy obligatorios.
- Evitar lógica pesada en constructor; usar ngOnInit.
- Para features sin estado, simplificar a solo router-outlet.