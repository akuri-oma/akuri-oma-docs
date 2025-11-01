---
trigger: pattern
description: Functional pattern for HTTP services in Angular, with error handling.
---

# PATTERN: HTTP Service (Angular)

## Description
Pattern for consuming REST APIs in Angular using HttpClient, with error handling and types.

## When to Use
- For backend calls in logical services.
- When strong typing and observable handling is required.

## Code Snippet
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

  // Add put, delete similar

  private handleError(error: HttpErrorResponse): Observable<never> {
    console.error('HTTP Error:', error);
    return throwError('Something went wrong');
  }
}
```

## Parameters
- `apiUrl`: Configurable base URL.
- Extensible for authentication (add headers).

## Usage Example
In a product service: `this.httpService.get<Product[]>('/products')`.

## Caveats
- Configure HttpClientModule in app.module.
- For global interceptors, use HttpInterceptor.