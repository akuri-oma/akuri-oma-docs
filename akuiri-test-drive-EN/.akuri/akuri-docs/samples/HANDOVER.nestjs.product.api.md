---
trigger: sample
description: Example HANDOVER for product API in NestJS, delivering complete contracts to the frontend.
---

# HANDOVER: Product Management API (NestJS)

## General Information
- **Functionality**: Product Management
- **Description**: API for CRUD operations on products (create, list, update, delete). Manages inventory with stock and price validations.
- **Critical Aspects**: Strict validations (price >0, stock >=0); concurrency handling in updates; logging of changes for auditing.
- **Implicit Acceptance Criteria**: Endpoints respond in <500ms; validations prevent invalid data; clear errors for debugging.
- **Type**: Backend Technical Delivery → Frontend
- **Backend**: NestJS (akuri-oma)
- **Target Frontend**: Angular
- **Base URL**: `http://localhost:3000/api/products`
- **Authentication**: Bearer Token (JWT) in `Authorization` header

## DTOs and Responses

### Request DTOs
- **CreateProductDto**:
  ```typescript
  {
    name: string; // Required, min 3 chars
    price: number; // Required, >0
    stock: number; // Optional, >=0
  }
  ```
- **UpdateProductDto** (Partial of CreateProductDto).

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
- **PaginatedResponse** (for lists):
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
- **Description**: Lists products with pagination.
- **Method**: GET
- **Query Params**:
  - `page` (number, optional): Page (default 1).
  - `limit` (number, optional): Items per page (default 10).
- **Response (200)**:
  ```json
  {
    "data": [
      {
        "id": 1,
        "name": "Product A",
        "price": 100.0,
        "stock": 50
      }
    ],
    "total": 1,
    "page": 1,
    "limit": 10
  }
  ```
- **Errors**:
  - 401: Unauthorized (invalid token).
  - 500: Internal Server Error.

### 2. POST /api/products
- **Description**: Creates a product.
- **Method**: POST
- **Request Body**:
  ```json
  {
    "name": "Product B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Response (201)**:
  ```json
  {
    "id": 2,
    "name": "Product B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Errors**:
  - 400: Bad Request (validations fail, e.g., negative price).
  - 401: Unauthorized.

### 3. PUT /api/products/:id
- **Description**: Updates product by ID.
- **Method**: PUT
- **Path Params**: `id` (number).
- **Request Body**: Similar to POST, optional fields.
- **Response (200)**: Updated object.
- **Errors**: 404 (not found), 400 (validations).

### 4. DELETE /api/products/:id
- **Description**: Deletes product by ID.
- **Method**: DELETE
- **Path Params**: `id` (number).
- **Response (204)**: No content.
- **Errors**: 404, 401.

## Additional Notes
- **Swagger**: Complete documentation at `http://localhost:3000/explorer`.
- **Rate Limiting**: 100 requests/min per IP.
- **Versioning**: API v1, future v2 at `/api/v2/products`.
- **Contact**: For questions, consult backend team.

---

**Delivery Date**: 2025-10-30  
**Status**: Ready for frontend integration.