---
trigger: pattern
description: Patrón funcional para servicios CRUD en NestJS, con TypeORM.
---

# PATTERN: CRUD Service (NestJS)

## Descripción
Patrón para implementar servicios CRUD (Create, Read, Update, Delete) en NestJS usando TypeORM. Proporciona una estructura reutilizable para entidades con operaciones básicas.

## Cuándo Usar
- Para módulos que requieren operaciones estándar de base de datos.
- Cuando la entidad tiene campos básicos (id, timestamps).

## Snippet de Código
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

## Parámetros
- `Entity`: La clase de entidad TypeORM.
- Métodos personalizables según necesidades (ej., agregar filtros).

## Ejemplo de Uso
En un módulo de productos: `ProductService extends CrudService<Product>`.

## Caveats
- No incluye validaciones avanzadas; agregar en DTOs.
- Para relaciones complejas, extender el patrón.