---
trigger: pattern
description: Patron fonctionnel pour services CRUD en NestJS, avec TypeORM.
---

# PATTERN : CRUD Service (NestJS)

## Description
Patron pour implémenter services CRUD (Create, Read, Update, Delete) en NestJS utilisant TypeORM. Fournit une structure réutilisable pour entités avec opérations de base.

## Quand Utiliser
- Pour modules qui requièrent opérations standard de base de données.
- Quand l'entité a champs basiques (id, timestamps).

## Snippet de Code
```typescript
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Entity } from './entity';

@Injectable()
export class CrudService {
  constructor(
    @InjectRepository(Entity)
    private repo: Repository<Entity>,
  ) {}

  async create(data: Partial<Entity>): Promise<Entity> {
    const entity = this.repo.create(data);
    return this.repo.save(entity);
  }

  async findAll(): Promise<Entity[]> {
    return this.repo.find();
  }

  async findOne(id: number): Promise<Entity> {
    return this.repo.findOneBy({ id });
  }

  async update(id: number, data: Partial<Entity>): Promise<Entity> {
    await this.repo.update(id, data);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.repo.delete(id);
  }
}
```

## Paramètres
- `Entity` : La classe d'entité TypeORM.
- Méthodes personnalisables selon besoins (ex., ajouter filtres).

## Exemple d'Usage
Dans un module de produits : `ProductService extends CrudService<Product>`.

## Caveats
- N'inclut pas validations avancées ; ajouter dans DTOs.
- Pour relations complexes, étendre le patron.