---
trigger: pattern
description: Patron fonctionnel pour services API CRUD en Angular, séparant opérations CRUD d'autres APIs.
---

# PATTERN : API CRUD Service (Angular)

## Description
Patron pour services API dédiés à opérations CRUD en Angular (`[feature].api.service.ts`). Sépare CRUD pur d'autres APIs non liées, permettant fichiers spécialisés. Philosophie : "Séparation des responsabilités API" – CRUD dans un service, autres opérations dans services séparés pour modularité et maintenabilité.

## Philosophie
Les APIs doivent être séparées par objectif : CRUD dans un service, autres (ex., uploads, recherches complexes) dans services dédiés. Évite fichiers monolithiques, facilite testing et réutilisation.

## Quand Utiliser
- Pour features avec opérations CRUD standard.
- Quand il y a APIs additionnelles non CRUD qui requièrent séparation.

## Exigences Additionnelles
- Utiliser HttpClient avec injection.
- Typer requests/responses avec DTOs/entities.
- Gérer erreurs et observables.
- Séparer fichiers : CRUD dans un, autres dans services spécifiques.

## Information à Compléter
- Nom du feature (ex., 'property-listing').
- DTOs : Create, Update, etc.
- Endpoints : Base URL, paths spécifiques.
- Méthodes CRUD : create, findAll, findOne, update, remove.
- Méthodes additionnelles : Si elles sont CRUD-related (ex., findByStatus), inclure ; sinon, déplacer vers autre service.

## Snippet de Code Base
```typescript
import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FeatureApiService {
  private readonly _http = inject(HttpClient);
  private readonly apiUrl = '/api/[feature]'; // Remplacer avec réel

  // CRUD Basique
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

  // Méthodes CRUD-related (optionnelles)
  findByStatus(status: string): Observable<any[]> {
    const params = new HttpParams().set('status', status);
    return this._http.get<any[]>(this.apiUrl, { params });
  }

  // Note : Méthodes non CRUD (ex., uploads) vont dans FeatureUploadApiService séparé
}
```

## Paramètres
- `[feature]` : Remplacer avec nom (ex., 'property-listing').
- DTOs : Importer réels (CreateDto, UpdateDto).
- apiUrl : Configurer avec environment.

## Exemple d'Usage
Pour 'property-listing' : Renommer à `property-listing.api.service.ts`, importer DTOs réels, ajouter méthodes comme findByStatus si elles sont CRUD-related.

## Caveats
- Maintenir seulement CRUD et liés ; déplacer autres vers services séparés.
- Utiliser HttpParams pour queries.
- Typer tout pour type safety.
- Éviter logique métier ; seulement appels HTTP.