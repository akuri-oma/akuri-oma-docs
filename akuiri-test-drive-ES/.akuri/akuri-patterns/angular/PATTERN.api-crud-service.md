---
trigger: pattern
description: Patrón funcional para servicios API CRUD en Angular, separando operaciones CRUD de otras APIs.
---

# PATTERN: API CRUD Service (Angular)

## Descripción
Patrón para servicios API dedicados a operaciones CRUD en Angular (`[feature].api.service.ts`). Separa CRUD puro de otras APIs no relacionadas, permitiendo archivos especializados. Filosofía: "Separación de responsabilidades API" – CRUD en un servicio, otras operaciones en servicios separados para modularidad y mantenibilidad.

## Filosofía
Las APIs deben estar separadas por propósito: CRUD en un servicio, otras (ej., uploads, búsquedas complejas) en servicios dedicados. Evita archivos monolíticos, facilita testing y reutilización.

## Cuándo Usar
- Para features con operaciones CRUD estándar.
- Cuando hay APIs adicionales no CRUD que requieren separación.

## Requisitos Adicionales
- Usar HttpClient con inyección.
- Tipar requests/responses con DTOs/entities.
- Manejar errores y observables.
- Separar archivos: CRUD en uno, otros en servicios específicos.

## Información a Completar
- Nombre del feature (ej., 'property-listing').
- DTOs: Create, Update, etc.
- Endpoints: Base URL, paths específicos.
- Métodos CRUD: create, findAll, findOne, update, remove.
- Métodos adicionales: Si son CRUD-related (ej., findByStatus), incluir; sino, mover a otro servicio.

## Snippet de Código Base
```typescript
import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FeatureApiService {
  private readonly _http = inject(HttpClient);
  private readonly apiUrl = '/api/[feature]'; // Reemplazar con real

  // CRUD Básico
  create(createDto: any): Observable<any> {
    return this._http.post(`${this.apiUrl}`, createDto);
  }

  findAll(): Observable<any[]> {
    return this._http.get<any[]>(this.apiUrl);
  }

  findOne(id: string): Observable<any> {
    return this._http.get(`${this.apiUrl}/${id}`);
  }

  update(id: string, updateDto: any): Observable<any> {
    return this._http.patch(`${this.apiUrl}/${id}`, updateDto);
  }

  remove(id: string): Observable<void> {
    return this._http.delete<void>(`${this.apiUrl}/${id}`);
  }

  // Métodos CRUD-related (opcionales)
  findByStatus(status: string): Observable<any[]> {
    const params = new HttpParams().set('status', status);
    return this._http.get<any[]>(this.apiUrl, { params });
  }

  // Nota: Métodos no CRUD (ej., uploads) van en FeatureUploadApiService separado
}
```

## Parámetros
- `[feature]`: Reemplazar con nombre (ej., 'property-listing').
- DTOs: Importar reales (CreateDto, UpdateDto).
- apiUrl: Configurar con environment.

## Ejemplo de Uso
Para 'property-listing': Renombrar a `property-listing.api.service.ts`, importar DTOs reales, agregar métodos como findByStatus si son CRUD-related.

## Caveats
- Mantener solo CRUD y relacionados; mover otros a servicios separados.
- Usar HttpParams para queries.
- Tipar todo para type safety.
- Evitar lógica de negocio; solo llamadas HTTP.