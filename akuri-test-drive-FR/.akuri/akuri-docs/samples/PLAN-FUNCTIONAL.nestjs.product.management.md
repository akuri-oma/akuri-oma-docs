---
trigger: sample
description: Exemple de PLAN-FUNCTIONAL pour gestion de produits en NestJS, détaillant le contenu de chaque fichier.
---

# PLAN-FUNCTIONAL : Gestion de Produits (NestJS)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan Fonctionnel (Contenu des Fichiers)
- **Technologie** : NestJS (akuri-oma)
- **Documents de Base** :
  - [`PLAN-STRUCTURE.nestjs.product-management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-STRUCTURE.nestjs.product-management.md)

## 2. Objectif
Détailler le contenu exact de chaque fichier défini dans PLAN-STRUCTURE, incluant technologies, imports, modules externes, méthodes/objets/fonctions, et conventions de noms. Permet la reconstruction précise.

## 3. Détails par Fichier

### 3.1 product.entity.ts
- **Technologies** : TypeORM (importer @Entity, @Column, @PrimaryGeneratedColumn).
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Propriétés : id (number), name (string), description (string), price (number), stock (number).
  - Conventions : PascalCase pour classe, camelCase pour propriétés.

### 3.2 create-product.dto.ts
- **Technologies** : class-validator (@IsString, @IsNumber), class-transformer.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Propriétés : name (@IsString), price (@IsNumber), description (@IsString optionnel).
  - Conventions : PascalCase pour classe, camelCase pour propriétés.

### 3.3 update-product.dto.ts
- **Technologies** : class-validator, Partial (de TypeScript).
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Étend create-product.dto avec Partial.
  - Propriétés : mêmes que create, optionnelles.
  - Conventions : PascalCase pour classe.

### 3.4 product.response.ts
- **Technologies** : TypeScript interfaces.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Interface : ProductResponse { id: number; name: string; price: number; }.
  - Conventions : PascalCase pour interface.

### 3.5 product.module.ts
- **Technologies** : @Module de NestJS.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - @Module({ controllers: [ProductController], providers: [ProductService], imports: [TypeOrmModule.forFeature([ProductEntity])] }).
  - Conventions : PascalCase pour module.

### 3.6 product.controller.ts
- **Technologies** : @Controller, @Get/@Post/@Put/@Delete de NestJS.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Méthodes : getProducts(), createProduct(dto), updateProduct(id, dto), deleteProduct(id).
  - Conventions : camelCase pour méthodes.

### 3.7 product.service.ts
- **Technologies** : @Injectable de NestJS, Repository de TypeORM.
- **Modules Externes** : Aucun.
- **Fichiers Spéciaux** : Aucun.
- **Méthodes/Objets/Fonctions** :
  - Méthodes : findAll(), create(dto), update(id, dto), delete(id).
  - Injection : constructor(private repo: Repository<ProductEntity>).
  - Conventions : camelCase pour méthodes.

## 4. Technologies Spécifiques
- **TypeORM** : Pour entités et repositories (installer si pas dans plateforme).
- **class-validator/class-transformer** : Pour DTOs (installer si pas dans manifeste).

## 5. Critères d'Acceptation
- Fichiers contiennent exactement les éléments listés.
- Compilation sans erreurs.
- Conventions de noms respectées.

---

**État** : Approuvé pour BUILD.