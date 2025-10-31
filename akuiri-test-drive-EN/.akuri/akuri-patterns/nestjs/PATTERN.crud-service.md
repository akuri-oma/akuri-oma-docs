---
trigger: pattern
description: Functional pattern for CRUD services in NestJS, with TypeORM.
---

# PATTERN: CRUD Service (NestJS)

## Description
Pattern for implementing CRUD services (Create, Read, Update, Delete) in NestJS using TypeORM. Provides a reusable structure for entities with basic operations.

## When to Use
- For modules that require standard database operations.
- When the entity has basic fields (id, timestamps).

## Code Snippet
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

## Parameters
- `Entity`: The TypeORM entity class.
- Methods customizable according to needs (e.g., add filters).

## Usage Example
In a product module: `ProductService extends CrudService<Product>`.

## Caveats
- Does not include advanced validations; add in DTOs.
- For complex relationships, extend the pattern.