---
trigger: pattern
description: Patron fonctionnel pour le fichier de routes d'un feature en Angular, gérant navigation et configuration.
---

# PATTERN : Feature Routes (Angular)

## Description
Patron pour le fichier de routes d'un feature en Angular (`[feature].routes.ts`). Définit navigation interne du feature, avec lazy loading, guards, providers et routes imbriquées sous un entry component. Philosophie : "Navigation structurée" – centralise configuration pour modularité, évitant routes globales et permettant isolation du feature.

## Philosophie
Les routes doivent être self-contained dans le feature, avec l'entry comme racine pour initialisations. Utilise lazy loading pour performance, guards pour sécurité, et providers pour dépendances locales (ex., traductions). Promouvant séparation des concerns et scalabilité.

## Quand Utiliser
- Pour features avec multiples pages/composants.
- Quand navigation interne avec guards ou providers spécifiques est requise.

## Exigences Additionnelles
- Importer entry component, pages et guards.
- Configurer providers (ex., TranslocoScope pour i18n).
- Utiliser routes imbriquées sous l'entry pour encapsulation.

## Information à Compléter
- Nom du feature (ex., 'auth', 'product').
- Liste de routes : paths, components, guards, params.
- Providers : Scopes pour traductions, loaders pour langues.
- Guards : Authentification, rôles, etc.
- Pages : Imports de composants page.

## Snippet de Code Base
```typescript
import { Routes } from '@angular/router';
import { provideTranslocoScope } from '@jsverse/transloco';
import { FeatureEntry } from './[feature].entry';

// Importer pages (compléter avec réels)
import { FeaturePage1 } from './presentation/pages/[feature].page1/[feature].page1';
import { FeaturePage2 } from './presentation/pages/[feature].page2/[feature].page2';
// Importer guards
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
      // Ajouter autres providers si applicable
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
        // canActivate: [FeatureGuard], // Ajouter si applicable
      },
      {
        path: 'page2/:id', // Paramètres si applicable
        component: FeaturePage2,
      },
      // Ajouter plus de routes
    ],
  },
];
```

## Paramètres
- `[feature]` : Remplacer avec nom du feature.
- Routes : Personnaliser paths, components, guards basés sur pages réelles.

## Exemple d'Usage
Pour feature 'product' : Renommer à `product.routes.ts`, importer ProductEntry et pages comme ProductListPage, ajouter guards si nécessaire.

## Caveats
- Maintenir entry comme racine pour encapsulation.
- Utiliser lazy loading dans routes parent si le feature est grand.
- Éviter routes globales ; tout sous le feature.
- Pour features simples, simplifier à routes directes sans children.