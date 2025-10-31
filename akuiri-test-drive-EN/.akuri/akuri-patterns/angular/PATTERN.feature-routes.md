---
trigger: pattern
description: Functional pattern for the routes file of a feature in Angular, handling navigation and configuration.
---

# PATTERN: Feature Routes (Angular)

## Description
Pattern for the routes file of a feature in Angular (`[feature].routes.ts`). Defines the internal navigation of the feature, with lazy loading, guards, providers, and nested routes under an entry component. Philosophy: "Structured Navigation" – centralizes configuration for modularity, avoiding global routes and allowing feature isolation.

## Philosophy
Routes must be self-contained within the feature, with the entry as root for initializations. Uses lazy loading for performance, guards for security, and providers for local dependencies (e.g., translations). Promotes separation of concerns and scalability.

## When to Use
- For features with multiple pages/components.
- When internal navigation with specific guards or providers is required.

## Additional Requirements
- Import entry component, pages, and guards.
- Configure providers (e.g., TranslocoScope for i18n).
- Use nested routes under the entry for encapsulation.

## Information to Complete
- Feature name (e.g., 'auth', 'product').
- List of routes: paths, components, guards, params.
- Providers: Scopes for translations, loaders for languages.
- Guards: Authentication, roles, etc.
- Pages: Imports of page components.

## Base Code Snippet
```typescript
import { Routes } from '@angular/router';
import { provideTranslocoScope } from '@jsverse/transloco';
import { FeatureEntry } from './[feature].entry';

// Import pages (complete with real ones)
import { FeaturePage1 } from './presentation/pages/[feature].page1/[feature].page1';
import { FeaturePage2 } from './presentation/pages/[feature].page2/[feature].page2';
// Import guards
import { FeatureGuard } from '@shared/guards/feature.guard';

export const FEATURE_ROUTES: Routes = [
  {
    path: '',
    component: FeatureEntry,
    providers: [
      provideTranslocoScope({
        scope: 'modules/[feature]',
        loader: {
          en: () => import('src/assets/i18n/modules/[feature]/en.json'),
          es: () => import('src/assets/i18n/modules/[feature]/es.json'),
        },
      }),
      // Add other providers if applicable
    ],
    children: [
      {
        path: '',
        redirectTo: 'default-page',
        pathMatch: 'full',
      },
      {
        path: 'page1',
        component: FeaturePage1,
        // canActivate: [FeatureGuard], // Add if applicable
      },
      {
        path: 'page2/:id', // Parameters if applicable
        component: FeaturePage2,
      },
      // Add more routes
    ],
  },
];
```

## Parameters
- `[feature]`: Replace with feature name.
- Routes: Customize paths, components, guards based on real pages.

## Usage Example
For feature 'product': Rename to `product.routes.ts`, import ProductEntry and pages like ProductListPage, add guards if necessary.

## Caveats
- Keep entry as root for encapsulation.
- Use lazy loading in parent routes if the feature is large.
- Avoid global routes; everything under the feature.
- For simple features, simplify to direct routes without children.