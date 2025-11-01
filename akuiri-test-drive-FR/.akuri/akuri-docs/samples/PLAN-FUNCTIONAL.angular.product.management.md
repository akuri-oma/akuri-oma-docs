---
trigger: sample
description: Exemple de PLAN-FUNCTIONAL pour gestion de produits en Angular (logique), détaillant le contenu des fichiers logiques.
---

# PLAN-FUNCTIONAL : Gestion de Produits (Angular - Logique)

## 1. Information Générale
- **Fonctionnalité** : Product Management (Logique)
- **Type** : Plan Fonctionnel (Contenu des Fichiers Logiques)
- **Technologie** : Angular (akuri-oma)
- **Documents de Base** :
  - [`PLAN-STRUCTURE.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.angular.product.management.md)

## 2. Objectif
Détailler le contenu exact des fichiers logiques (models, services), incluant technologies, imports, modules externes, méthodes/objets/fonctions, et conventions. Permet la reconstruction précise.

## 2.1 Prérequis pour Frontend
1. Lire HANDOVER du backend si existe ; si non, consulter documentation Swagger ou demander à l'utilisateur de générer HANDOVER.
2. Créer modèles synchronisés avec le backend (basés sur HANDOVER).

## 3. Détails par Fichier

### 3.1 product.entity.ts
- **Technologies** : TypeScript interfaces.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Interface : ProductEntity { id: number; name: string; price: number; }.
  - Conventions : PascalCase pour interface, camelCase pour propriétés.

### 3.2 create-product.dto.ts
- **Technologies** : TypeScript classes.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Classe : CreateProductDto { name: string; price: number; }.
  - Conventions : PascalCase pour classe.

### 3.3 product.response.ts
- **Technologies** : TypeScript interfaces.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Interface : ProductResponse { id: number; name: string; }.
  - Conventions : PascalCase pour interface.

### 3.4 product.api.service.ts
- **Technologies** : HttpClient d'Angular.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : environment.ts (pour API URL).
- **Méthodes/Objets/Fonctions** :
  - Méthodes : getProducts(): Observable<ProductResponse[]>, createProduct(dto: CreateProductDto): Observable<ProductResponse>.
  - Injection : constructor(private http: HttpClient).
  - Conventions : camelCase pour méthodes.

### 3.5 product.logic.service.ts
- **Technologies** : RxJS.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Méthodes : validateProduct(dto): boolean, normalizePrice(price): number.
  - Conventions : camelCase pour méthodes.

### 3.6 product.state.service.ts
- **Technologies** : Signals/RxJS d'Angular.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Signals : products$ = signal<ProductEntity[]>([]).
  - Méthodes : setProducts(products), getProducts().
  - Conventions : camelCase pour méthodes.

## 4. Technologies Spécifiques
- **RxJS** : Pour observables (installer si pas dans manifeste).
- **HttpClient** : Pour APIs (partie d'Angular).

## 5. Critères d'Acceptation
- Fichiers contiennent exactement les éléments listés.
- Compilation sans erreurs.
- Conventions de noms respectées.

---

**État** : Approuvé pour BUILD (logique).