---
trigger: pattern
description: Patrón funcional para servicios Action en Angular, orquestando llamadas API, estado y navegación.
---

# PATTERN: Action Service (Angular)

## Descripción
Patrón para servicios Action en Angular (`[feature].action.service.ts`). Orquestan flujos complejos: llaman APIs, actualizan estado, manejan navegación, muestran mensajes. Filosofía: "Orquestación centralizada" – separa lógica de negocio/UI, centraliza side-effects, asegura consistencia transversal.

## Filosofía
Actions manejan "qué hacer" (llamadas, updates, navegación), no "cómo mostrar". Usan inyección para APIs/estado, manejan errores con toasts, limpian datos para storage. Promueve reusabilidad y testing.

## Cuándo Usar
- Para features con lógica compleja (CRUD + navegación, uploads).
- Cuando se requiere orquestación entre API, estado y UI.

## Requisitos Adicionales
- Inyectar API, State, Router, MessageService.
- Métodos "on[Action]" para claridad (ej., onCreate).
- Limpiar datos no serializables para sessionStorage.
- Manejar loading/errors con state signals.

## Información a Completar
- Nombre del feature (ej., 'property-listing').
- APIs a inyectar (ej., ApiService, ConfigApiService).
- Estados a actualizar (ej., selected, list).
- Navegación: Paths con layout prefix.
- Mensajes: Success/error con MessageService.

## Snippet de Código Base
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

  // Inicialización
  onInit(): void {
    this.loadData();
  }

  // Cargar datos
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

  // Crear
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

  // Navegación
  onNavigateToList(): void {
    // Implementar navegación con layout prefix
  }

  // Limpiar datos no serializables
  private cleanData(data: any): any {
    // Implementar limpieza de File/Blob
    return data;
  }
}
```

## Parámetros
- `[feature]`: Reemplazar con nombre.
- Métodos: Adaptar a acciones reales (create, update, delete, navigate).

## Ejemplo de Uso
Para 'property-listing': Renombrar, inyectar PropertyListingApiService/State, implementar onCreate con limpieza de datos, navegación con layout prefix.

## Caveats
- Mantener métodos "on[Action]" para claridad.
- Siempre actualizar estado y storage.
- Usar MessageService para feedback.
- Evitar lógica UI; solo orquestación.