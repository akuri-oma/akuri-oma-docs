---
trigger: pattern
description: Patron fonctionnel pour services HTTP en Angular, avec gestion d'erreurs.
---

# PATTERN : HTTP Service (Angular)

## Description
Patron pour consommer APIs REST en Angular utilisant HttpClient, avec gestion d'erreurs et types.

## Quand Utiliser
- Pour appels à backend dans services logiques.
- Quand typage fort et gestion d'observables est requis.

## Snippet de Code
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

  // Ajouter put, delete similaires

  private handleError(error: HttpErrorResponse): Observable<never> {
    console.error('HTTP Error:', error);
    return throwError('Something went wrong');
  }
}
```

## Paramètres
- `apiUrl` : Base URL configurable.
- Extensible pour authentification (ajouter headers).

## Exemple d'Usage
Dans un service de produits : `this.httpService.get<Product[]>('/products')`.

## Caveats
- Configurer HttpClientModule dans app.module.
- Pour intercepteurs globaux, utiliser HttpInterceptor.