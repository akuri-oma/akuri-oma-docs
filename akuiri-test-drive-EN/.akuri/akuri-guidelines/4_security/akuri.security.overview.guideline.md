---
trigger: always_on
description: General cybersecurity guide in the Akuri-OMA Methodology, applicable to all phases and technologies.
status: active
use_case: [REQUIREMENT, DESIGN, PLAN, BUILD, TESTS, AUDIT]
---

# General Cybersecurity Guide in Akuri-OMA

## 1. Fundamental Principles
Cybersecurity is a mandatory pillar in Akuri-OMA. All functionalities must incorporate security measures from the start, following OWASP Top 10 and best practices. Security failures block BUILD until correction.

## 2. Integration into Phases
- **REQUIREMENT**: Include "Security Requirements" (risks, basic measures).
- **DESIGN**: Describe measures narratively.
- **PLAN-SECURITY**: Detail technical implementation.
- **BUILD**: Implement (e.g., encryption, guards).
- **TESTS-SECURITY**: Verify with specific tests.
- **AUDIT**: Post-development checklist.

## 3. Common Measures
- **Authentication**: JWT with expiration, refresh tokens.
- **Authorization**: Guards/roles.
- **Validation**: Input sanitization, preventing XSS/SQLi.
- **Encryption**: Sensitive data (passwords with bcrypt).
- **Error Handling**: Generic messages, no stack traces.
- **Configuration**: Secrets in .env, HTTPS mandatory.

## 4. Technologies by Platform
- **NestJS**: @nestjs/jwt, @nestjs/throttler, class-validator.
- **Angular**: Guards, HttpInterceptors for tokens.

Security is "by default"; it is not optional.