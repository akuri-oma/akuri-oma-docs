---
trigger: sample
description: Exemple de PLAN-SECURITY pour gestion de produits en NestJS, définissant mesures de cybersécurité.
---

# PLAN-SECURITY : Gestion de Produits (NestJS)

## 1. Information Générale
- **Fonctionnalité** : Product Management
- **Type** : Plan de Sécurité
- **Technologie** : NestJS
- **Risques Identifiés** : Exposition de données sensibles (prix, stock), injection SQL, accès non autorisé.
- **Documents de Base** :
  - [`REQUIREMENT.product.management.md`](nest-backend/src/modules/product/akuri-specs/REQUIREMENT.product.management.md)

## 2. Objectif
Définir et implémenter mesures de cybersécurité pour protéger données et prévenir attaques, alignées avec risques et critères d'acceptation.

## 3. Mesures de Sécurité

### 3.1 Authentification et Autorisation
- **JWT Tokens** : Utiliser @nestjs/jwt pour tokens avec expiration (15 min), refresh tokens sécurisés.
- **Guards** : @UseGuards(JwtAuthGuard) dans contrôleurs pour valider tokens.
- **Rate Limiting** : 100 requests/min par IP utilisant @nestjs/throttler.

### 3.2 Validation et Sanitisation
- **DTOs Sécurisés** : Validations dans CreateProductDto (éviter XSS avec @IsString, SQL injection avec sanitisation).
- **Chiffrement** : Non requis pour produits de base, mais logging sans données sensibles.

### 3.3 Gestion d'Erreurs
- **Erreurs Génériques** : Ne pas exposer détails internes (ex., "Invalid input" au lieu de stack traces).
- **Logging Sécurisé** : Utiliser Winston, sans logger passwords ou données PII.

### 3.4 Configuration
- **Variables d'Environnement** : Utiliser .env pour secrets (JWT_SECRET), non hardcodés.
- **HTTPS** : Obligatoire en production.

## 4. Tests de Sécurité
- **OWASP Top 10** : Tester injection SQL, XSS dans inputs.
- **Authentification** : Vérifier tokens expirés bloquent accès.

## 5. Critères d'Acceptation
- Endpoints nécessitent authentification valide.
- Inputs sanitizés préviennent attaques.
- Pas de données sensibles dans logs.

---

**État** : Approuvé pour BUILD.