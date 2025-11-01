---
trigger: pattern
description: Patrón funcional para el archivo de rutas de un feature en Angular, manejando navegación y configuración.
---

# PATTERN: Feature Routes (Angular)

## Descripción
Patrón para el archivo de rutas de un feature en Angular (`[feature].routes.ts`). Define la navegación interna del feature, con lazy loading, guards, providers y rutas anidadas bajo un entry component. Filosofía: "Navegación estructurada" – centraliza configuración para modularidad, evitando rutas globales y permitiendo aislamiento del feature.

## Filosofía
Las rutas deben ser self-contained dentro del feature, con el entry como raíz para inicializaciones. Usa lazy loading para performance, guards para seguridad, y providers para dependencias locales (ej., traducciones). Promueve separación de concerns y escalabilidad.

## Cuándo Usar
- Para features con múltiples páginas/componentes.
- Cuando se requiere navegación interna con guards o providers específicos.

## Requisitos Adicionales
- Importar entry component, páginas y guards.
- Configurar providers (ej., TranslocoScope para i18n).
- Usar rutas anidadas bajo el entry para encapsulación.

## Información a Completar
- Nombre del feature (ej., 'auth', 'product').
- Lista de rutas: paths, components, guards, params.
- Providers: Scopes para traducciones, loaders para idiomas.
- Guards: Autenticación, roles, etc.
- Páginas: Imports de componentes page.

## Snippet de Código Base
```typescript
import { Routes } from '@angular/router';
import { provideTranslocoScope } from '@jsverse/transloco';
import { FeatureEntry } from './[feature].entry';

// Importar páginas (completar con reales)
import { FeaturePage1 } from './presentation/pages/[feature].page1/[feature].page1';
import { FeaturePage2 } from './presentation/pages/[feature].page2/[feature].page2';
// Importar guards
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
      // Agregar otros providers si aplica
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
        // canActivate: [FeatureGuard], // Agregar si aplica
      },
      {
        path: 'page2/:id', // Parámetros si aplica
        component: FeaturePage2,
      },
      // Agregar más rutas
    ],
  },
];
```

## Parámetros
- `[feature]`: Reemplazar con nombre del feature.
- Rutas: Personalizar paths, components, guards basados en páginas reales.

## Ejemplo de Uso
Para feature 'product': Renombrar a `product.routes.ts`, importar ProductEntry y páginas como ProductListPage, agregar guards si necesario.

## Caveats
- Mantener entry como raíz para encapsulación.
- Usar lazy loading en rutas padre si el feature es grande.
- Evitar rutas globales; todo bajo el feature.
- Para features simples, simplificar a rutas directas sin children.