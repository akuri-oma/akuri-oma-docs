---
trigger: always_on
description: Guide générale de cybersécurité dans la Méthodologie Akuri-OMA, applicable à toutes les phases et technologies.
status: active
use_case: [REQUIREMENT, DESIGN, PLAN, BUILD, TESTS, AUDIT]
---

# Guide Général de Cybersécurité dans Akuri-OMA

## 1. Principes Fondamentaux
La cybersécurité est un pilier obligatoire dans Akuri-OMA. Toutes les fonctionnalités doivent incorporer des mesures de sécurité dès le départ, suivant OWASP Top 10 et meilleures pratiques. Les défaillances de sécurité bloquent BUILD jusqu'à correction.

## 2. Intégration dans les Phases
- **REQUIREMENT** : Inclure "Exigences de Sécurité" (risques, mesures de base).
- **DESIGN** : Décrire les mesures narrativement.
- **PLAN-SECURITY** : Détailler l'implémentation technique.
- **BUILD** : Implémenter (ex., encriptación, guards).
- **TESTS-SECURITY** : Vérifier avec tests spécifiques.
- **AUDIT** : Checklist post-développement.

## 3. Mesures Communes
- **Authentification** : JWT avec expiration, refresh tokens.
- **Autorisation** : Guards/roles.
- **Validation** : Sanitisation des inputs, prévention XSS/SQLi.
- **Encriptación** : Données sensibles (passwords avec bcrypt).
- **Gestion d'Erreurs** : Messages génériques, pas de stack traces.
- **Configuration** : Secrets dans .env, HTTPS obligatoire.

## 4. Technologies par Plateforme
- **NestJS** : @nestjs/jwt, @nestjs/throttler, class-validator.
- **Angular** : Guards, HttpInterceptors pour tokens.

La sécurité est "par défaut" ; elle n'est pas optionnelle.