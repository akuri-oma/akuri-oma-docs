---
trigger: sample
description: Ejemplo de PLAN-FUNCTIONAL para gestión de productos en NestJS, detallando contenido de cada archivo.
---

# PLAN-FUNCTIONAL: Gestión de Productos (NestJS)

## 1. Información General
- **Funcionalidad**: Product Management
- **Tipo**: Plan Funcional (Contenido de Archivos)
- **Tecnología**: NestJS (akuri-oma)
- **Documentos Base**:
  - [`PLAN-STRUCTURE.nestjs.product-management.md`](nest-backend/src/modules/product/akuri-specs/PLAN-STRUCTURE.nestjs.product-management.md)

## 2. Objetivo
Detallar el contenido exacto de cada archivo definido en PLAN-STRUCTURE, incluyendo tecnologías, imports, módulos externos, métodos/objetos/funciones, y convenciones de nombres. Permite reconstrucción precisa.

## 3. Detalles por Archivo

### 3.1 product.entity.ts
- **Tecnologías**: TypeORM (importar @Entity, @Column, @PrimaryGeneratedColumn).
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Propiedades: id (number), name (string), description (string), price (number), stock (number).
  - Convenciones: PascalCase para clase, camelCase para propiedades.

### 3.2 create-product.dto.ts
- **Tecnologías**: class-validator (@IsString, @IsNumber), class-transformer.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Propiedades: name (@IsString), price (@IsNumber), description (@IsString optional).
  - Convenciones: PascalCase para clase, camelCase para propiedades.

### 3.3 update-product.dto.ts
- **Tecnologías**: class-validator, Partial (de TypeScript).
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Extiende create-product.dto con Partial.
  - Propiedades: mismas que create, opcionales.
  - Convenciones: PascalCase para clase.

### 3.4 product.response.ts
- **Tecnologías**: TypeScript interfaces.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Interfaz: ProductResponse { id: number; name: string; price: number; }.
  - Convenciones: PascalCase para interfaz.

### 3.5 product.module.ts
- **Tecnologías**: @Module de NestJS.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - @Module({ controllers: [ProductController], providers: [ProductService], imports: [TypeOrmModule.forFeature([ProductEntity])] }).
  - Convenciones: PascalCase para módulo.

### 3.6 product.controller.ts
- **Tecnologías**: @Controller, @Get/@Post/@Put/@Delete de NestJS.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Métodos: getProducts(), createProduct(dto), updateProduct(id, dto), deleteProduct(id).
  - Convenciones: camelCase para métodos.

### 3.7 product.service.ts
- **Tecnologías**: @Injectable de NestJS, Repository de TypeORM.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Métodos: findAll(), create(dto), update(id, dto), delete(id).
  - Inyección: constructor(private repo: Repository<ProductEntity>).
  - Convenciones: camelCase para métodos.

## 4. Tecnologías Específicas
- **TypeORM**: Para entidades y repositorios (instalar si no está en plataforma).
- **class-validator/class-transformer**: Para DTOs (instalar si no está).

## 5. Criterios de Aceptación
- Archivos contienen exactamente los elementos listados.
- Compilación sin errores.
- Convenciones de nombres respetadas.

---

**Estado**: Aprobado para BUILD.