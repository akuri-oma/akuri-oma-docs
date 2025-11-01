---
trigger: pattern
description: Patron fonctionnel pour le fichier d'entrée à un feature en Angular, gérant initialisation et nettoyage.
---

# PATTERN : Feature Entry (Angular)

## Description
Patron pour le fichier d'entrée à un feature en Angular (normalement `[feature].entry.ts`). Agit comme point de contrôle pour initialiser services/états à l'entrée du feature et nettoyer processus/variables à la sortie. Philosophie : "Entrée contrôlée" – assure que le feature soit self-contained, évitant leaks de mémoire ou processus orphelins.

## Philosophie
Le feature doit être modulaire et autonome. OnInit initialise dépendances critiques (états, souscriptions, configs), tandis que OnDestroy remet tout à zéro pour éviter impacts sur autres features. Promouvant propreté et performance.

## Quand Utiliser
- Pour tout feature en Angular akuri-oma.
- Quand le feature requiert état global ou initialisations spécifiques.

## Exigences Additionnelles
- Injecter services d'état (ex., FeatureStateService).
- Configurer guards/resolvers si applicable.
- Utiliser standalone components pour modularité.

## Information à Compléter
- Nom du feature (ex., 'auth', 'product').
- Services à injecter (ex., AuthStateService).
- Logique dans ngOnInit (initialisations : charger données, s'abonner à événements).
- Logique dans ngOnDestroy (nettoyages : unsubscribe, reset états, fermer connexions).

## Snippet de Code Base
```typescript
import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';

import { TranslocoModule } from '@jsverse/transloco';
import { jwtDecode } from 'jwt-decode';
import { FeatureStateService } from './services/state/feature.state.service';
import { FeatureIdo } from '@core/orchest/models/ido/feature.ido';
import { OrchestStateService } from '@core/orchest';

@Component({
  selector: '[feature]-entry',
  standalone: true,
  imports: [RouterOutlet, TranslocoModule],
  template: ` <router-outlet /> `,
  styles: ``,
})
export class FeatureEntry implements OnInit, OnDestroy {
  _orchest = inject(OrchestStateService);
  _featureState = inject(FeatureStateService);
  _router = inject(Router);

  constructor() { }

  ngOnInit(): void {
    // Initialiser : charger données, s'abonner à événements, configurer état
    // Exemple : this._featureState.loadInitialData();
  }

  ngOnDestroy(): void {
    // Nettoyer : remettre états à zéro, unsubscribe, fermer processus
    // Exemple : this._featureState.reset();
  }
}
```

## Paramètres
- `[feature]` : Remplacer avec nom du feature (ex., 'auth').
- Services : Adapter aux dépendances réelles.

## Exemple d'Usage
Pour feature 'product' : Renommer à `product.entry.ts`, injecter ProductStateService, et compléter ngOnInit/ngOnDestroy avec logique spécifique.

## Caveats
- Maintenir ngOnInit/ngOnDestroy obligatoires.
- Éviter logique lourde dans constructor ; utiliser ngOnInit.
- Pour features sans état, simplifier à seulement router-outlet.