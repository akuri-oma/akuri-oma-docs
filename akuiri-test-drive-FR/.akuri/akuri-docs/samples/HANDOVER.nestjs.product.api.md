---
trigger: sample
description: Exemple de HANDOVER pour API de produits en NestJS, livrant des contrats complets au frontend.
---

# HANDOVER : API de Gestion de Produits (NestJS)

## Information Générale
- **Fonctionnalité** : Gestion de Produits
- **Description** : API pour opérations CRUD sur produits (créer, lister, mettre à jour, supprimer). Gère l'inventaire avec validations de stock et prix.
- **Aspects Critiques** : Validations strictes (prix >0, stock >=0) ; gestion de concurrence dans les updates ; logging des changements pour audit.
- **Critères d'Acceptation Implicites** : Endpoints répondent en <500ms ; validations préviennent les données invalides ; erreurs claires pour debugging.
- **Type** : Livraison Technique Backend → Frontend
- **Backend** : NestJS (akuri-oma)
- **Frontend Destinataire** : Angular
- **Base URL** : `http://localhost:3000/api/products`
- **Authentification** : Bearer Token (JWT) dans header `Authorization`

## DTOs et Responses

### DTOs de Request
- **CreateProductDto** :
  ```typescript
  {
    name: string; // Required, min 3 chars
    price: number; // Required, >0
    stock: number; // Optional, >=0
  }
  ```
- **UpdateProductDto** (Partial de CreateProductDto).

### Responses
- **ProductResponse** :
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
- **PaginatedResponse** (pour listes) :
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
- **Description** : Liste produits avec pagination.
- **Méthode** : GET
- **Query Params** :
  - `page` (number, optionnel) : Page (default 1).
  - `limit` (number, optionnel) : Items par page (default 10).
- **Response (200)** :
  ```json
  {
    "data": [
      {
        "id": 1,
        "name": "Produit A",
        "price": 100.0,
        "stock": 50
      }
    ],
    "total": 1,
    "page": 1,
    "limit": 10
  }
  ```
- **Erreurs** :
  - 401 : Unauthorized (token invalide).
  - 500 : Internal Server Error.

### 2. POST /api/products
- **Description** : Crée un produit.
- **Méthode** : POST
- **Request Body** :
  ```json
  {
    "name": "Produit B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Response (201)** :
  ```json
  {
    "id": 2,
    "name": "Produit B",
    "price": 200.0,
    "stock": 30
  }
  ```
- **Erreurs** :
  - 400 : Bad Request (validations échouent, ex. prix négatif).
  - 401 : Unauthorized.

### 3. PUT /api/products/:id
- **Description** : Met à jour produit par ID.
- **Méthode** : PUT
- **Path Params** : `id` (number).
- **Request Body** : Similaire à POST, champs optionnels.
- **Response (200)** : Objet mis à jour.
- **Erreurs** : 404 (non trouvé), 400 (validations).

### 4. DELETE /api/products/:id
- **Description** : Supprime produit par ID.
- **Méthode** : DELETE
- **Path Params** : `id` (number).
- **Response (204)** : No content.
- **Erreurs** : 404, 401.

## Notes Additionnelles
- **Swagger** : Documentation complète dans `http://localhost:3000/explorer`.
- **Rate Limiting** : 100 requests/min par IP.
- **Versioning** : API v1, futur v2 dans `/api/v2/products`.
- **Contact** : Pour questions, consulter l'équipe backend.

---

**Date de Livraison** : 2025-10-30  
**État** : Prêt pour intégration frontend.