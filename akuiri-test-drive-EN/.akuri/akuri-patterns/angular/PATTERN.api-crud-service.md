---
trigger: pattern
description: Functional pattern for API CRUD services in Angular, separating CRUD operations from other APIs.
---

# PATTERN: API CRUD Service (Angular)

## Description
Pattern for dedicated API services for CRUD operations in Angular (`[feature].api.service.ts`). Separates pure CRUD from other unrelated APIs, allowing specialized files. Philosophy: "API Responsibility Separation" – CRUD in one service, other operations in separate services for modularity and maintainability.

## Philosophy
APIs should be separated by purpose: CRUD in one service, others (e.g., uploads, complex searches) in dedicated services. Avoids monolithic files, facilitates testing and reuse.

## When to Use
- For features with standard CRUD operations.
- When there are additional non-CRUD APIs that require separation.

## Additional Requirements
- Use HttpClient with injection.
- Type requests/responses with DTOs/entities.
- Handle errors and observables.
- Separate files: CRUD in one, others in specific services.

## Information to Complete
- Feature name (e.g., 'property-listing').
- DTOs: Create, Update, etc.
- Endpoints: Base URL, specific paths.
- CRUD methods: create, findAll, findOne, update, remove.
- Additional methods: If CRUD-related (e.g., findByStatus), include; otherwise, move to another service.

## Base Code Snippet
```typescript
import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FeatureApiService {
  private readonly _http = inject(HttpClient);
  private readonly apiUrl = '/api/[feature]'; // Replace with real

  // Basic CRUD
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

  // CRUD-related methods (optional)
  findByStatus(status: string): Observable<any[]> {
    const params = new HttpParams().set('status', status);
    return this._http.get<any[]>(this.apiUrl, { params });
  }

  // Note: Non-CRUD methods (e.g., uploads) go in separate FeatureUploadApiService
}
```

## Parameters
- `[feature]`: Replace with name (e.g., 'property-listing').
- DTOs: Import real ones (CreateDto, UpdateDto).
- apiUrl: Configure with environment.

## Usage Example
For 'property-listing': Rename to `property-listing.api.service.ts`, import real DTOs, add methods like findByStatus if CRUD-related.

## Caveats
- Keep only CRUD and related; move others to separate services.
- Use HttpParams for queries.
- Type everything for type safety.
- Avoid business logic; only HTTP calls.