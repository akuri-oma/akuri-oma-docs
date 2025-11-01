---
trigger: sample
description: Ejemplo de HANDOVER para API de productos en NestJS, entregando contratos completos al frontend.
---

# HANDOVER: API de Gestión de Productos (NestJS)

## Información General
- **Funcionalidad**: Gestión de Productos
- **Descripción**: API para operaciones CRUD sobre productos (crear, listar, actualizar, eliminar). Gestiona inventario con validaciones de stock y precio.
- **Aspectos Críticos**: Validaciones estrictas (precio >0, stock >=0); manejo de concurrencia en updates; logging de cambios para auditoría.
- **Criterios de Aceptación Implícitos**: Endpoints responden en <500ms; validaciones previenen datos inválidos; errores claros para debugging.
- **Tipo**: Entrega Técnica Backend → Frontend
- **Backend**: NestJS (akuri-oma)
- **Frontend Destino**: Angular
- **Base URL**: `http://localhost:3000/api/products`
- **Autenticación**: Bearer Token (JWT) en header `Authorization`

## DTOs y Responses

### DTOs de Request
- **CreateProductDto**:
  ```typescript
  {
    name: string; // Required, min 3 chars
    price: number; // Required, >0
    stock: number; // Optional, >=0
  }
  ```
- **UpdateProductDto** (Partial de CreateProductDto).

### Responses
- **ProductResponse**:
  ```typescript
  {
    id: number;
    name: string;
    price: number;
    stock: number;
    createdAt: Date;
    updatedAt: Date;
  }
  ```
- **PaginatedResponse** (para listas):
  ```typescript
  {
    data: ProductResponse[];
    total: number;
    page: number;
    limit: number;
  }
  ```

## Endpoints

### 1. GET /api/products
- **Descripción**: Lista productos con paginación.
- **Método**: GET
- **Query Params**:
  - `page` (number, opcional): Página (default 1).
  - `limit` (number, opcional): Items por página (default 10).
- **Response (200)**:
  ```json
  {
    "data": [
      {
        "id": 1,
        "name": "Producto A",
        "price": 100.0,
        "stock": 50
      }
    ],
    "total": 1,
    "page": 1,
    "limit": 10
  }
  ```
- **Errores**:
  - 401: Unauthorized (token inválido).
  - 500: Internal Server Error.

### 2. POST /api/products
- **Descripción**: Crea un producto.
- **Método**: POST
- **Request Body**:
  ```json
  {
    "name": "Producto B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Response (201)**:
  ```json
  {
    "id": 2,
    "name": "Producto B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Errores**:
  - 400: Bad Request (validaciones fallan, ej. price negativo).
  - 401: Unauthorized.

### 3. PUT /api/products/:id
- **Descripción**: Actualiza producto por ID.
- **Método**: PUT
- **Path Params**: `id` (number).
- **Request Body**: Similar a POST, campos opcionales.
- **Response (200)**: Objeto actualizado.
- **Errores**: 404 (no encontrado), 400 (validaciones).

### 4. DELETE /api/products/:id
- **Descripción**: Elimina producto por ID.
- **Método**: DELETE
- **Path Params**: `id` (number).
- **Response (204)**: No content.
- **Errores**: 404, 401.

## Notas Adicionales
- **Swagger**: Documentación completa en `http://localhost:3000/explorer`.
- **Rate Limiting**: 100 requests/min por IP.
- **Versionado**: API v1, futuro v2 en `/api/v2/products`.
- **Contacto**: Para dudas, consultar backend team.

---

**Fecha de Entrega**: 2025-10-30  
**Estado**: Listo para integración frontend.