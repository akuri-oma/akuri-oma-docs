---
trigger: pattern
description: Patrón funcional para servicios HTTP en Angular, con manejo de errores.
---

# PATTERN: HTTP Service (Angular)

## Descripción
Patrón para consumir APIs REST en Angular usando HttpClient, con manejo de errores y tipos.

## Cuándo Usar
- Para llamadas a backend en servicios lógicos.
- Cuando se requiere tipado fuerte y manejo de observables.

## Snippet de Código
```typescript
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class HttpService {
  private apiUrl = '/api';

  constructor(private http: HttpClient) {}

  get<T>(endpoint: string): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}${endpoint}`).pipe(
      catchError(this.handleError)
    );
  }

  post<T>(endpoint: string, data: any): Observable<T> {
    return this.http.post<T>(`${this.apiUrl}${endpoint}`, data).pipe(
      catchError(this.handleError)
    );
  }

  // Agregar put, delete similares

  private handleError(error: HttpErrorResponse): Observable<never> {
    console.error('HTTP Error:', error);
    return throwError('Something went wrong');
  }
}
```

## Parámetros
- `apiUrl`: Base URL configurable.
- Extensible para autenticación (agregar headers).

## Ejemplo de Uso
En un servicio de productos: `this.httpService.get<Product[]>('/products')`.

## Caveats
- Configurar HttpClientModule en app.module.
- Para interceptores globales, usar HttpInterceptor.