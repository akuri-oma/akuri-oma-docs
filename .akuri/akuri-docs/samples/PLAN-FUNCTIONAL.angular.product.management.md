---
trigger: sample
description: Ejemplo de PLAN-FUNCTIONAL para gestión de productos en Angular (lógica), detallando contenido de archivos lógicos.
---

# PLAN-FUNCTIONAL: Gestión de Productos (Angular - Lógica)

## 1. Información General
- **Funcionalidad**: Product Management (Lógica)
- **Tipo**: Plan Funcional (Contenido de Archivos Lógicos)
- **Tecnología**: Angular (akuri-oma)
- **Documentos Base**:
  - [`PLAN-STRUCTURE.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-STRUCTURE.angular.product.management.md)

## 2. Objetivo
Detallar el contenido exacto de archivos lógicos (models, services), incluyendo tecnologías, imports, módulos externos, métodos/objetos/funciones, y convenciones. Permite reconstrucción precisa.

## 2.1 Prerrequisitos para Frontend
1. Leer HANDOVER del backend si existe; si no, consultar documentación Swagger o solicitar al usuario que genere HANDOVER.
2. Crear modelos sincronizados con el backend (basados en HANDOVER).

## 3. Detalles por Archivo

### 3.1 product.entity.ts
- **Tecnologías**: TypeScript interfaces.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Interfaz: ProductEntity { id: number; name: string; price: number; }.
  - Convenciones: PascalCase para interfaz, camelCase para propiedades.

### 3.2 create-product.dto.ts
- **Tecnologías**: TypeScript classes.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Clase: CreateProductDto { name: string; price: number; }.
  - Convenciones: PascalCase para clase.

### 3.3 product.response.ts
- **Tecnologías**: TypeScript interfaces.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Interfaz: ProductResponse { id: number; name: string; }.
  - Convenciones: PascalCase para interfaz.

### 3.4 product.api.service.ts
- **Tecnologías**: HttpClient de Angular.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: environment.ts (para API URL).
- **Métodos/Objetos/Funciones**:
  - Métodos: getProducts(): Observable<ProductResponse[]>, createProduct(dto: CreateProductDto): Observable<ProductResponse>.
  - Inyección: constructor(private http: HttpClient).
  - Convenciones: camelCase para métodos.

### 3.5 product.logic.service.ts
- **Tecnologías**: RxJS.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Métodos: validateProduct(dto): boolean, normalizePrice(price): number.
  - Convenciones: camelCase para métodos.

### 3.6 product.state.service.ts
- **Tecnologías**: Signals/RxJS de Angular.
- **Módulos Externos**: Ninguno.
- **Archivos Especiales**: Ninguno.
- **Métodos/Objetos/Funciones**:
  - Signals: products$ = signal<ProductEntity[]>([]).
  - Métodos: setProducts(products), getProducts().
  - Convenciones: camelCase para métodos.

## 4. Tecnologías Específicas
- **RxJS**: Para observables (instalar si no está).
- **HttpClient**: Para APIs (parte de Angular).

## 5. Criterios de Aceptación
- Archivos contienen exactamente los elementos listados.
- Compilación sin errores.
- Convenciones de nombres respetadas.

---

**Estado**: Aprobado para BUILD (lógica).