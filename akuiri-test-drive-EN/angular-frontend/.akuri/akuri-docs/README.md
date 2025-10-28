---
trigger: always_on
description: Additional documentation for the webpage-angular project, including architecture indexes, development, integrations, deployment, and project conventions.
---

# Additional Documentation - webpage-angular

## Index

### Architecture and Design
- [OMA v6 Implementation Guide](./oma-v6-guide.md) - Complete implementation guide for OMA v6
- [Component Architecture](./component-architecture.md) - Component architecture
- [State Management](./state-management.md) - State management in the application

### Development
- [Development Workflow](./development-workflow.md) - Development workflow
- [Testing Strategy](./testing-strategy.md) - Testing strategy
- [Performance Guidelines](./performance-guidelines.md) - Performance guidelines

### Integrations
- [Backend Integration](./backend-integration.md) - Integration with backend-nest
- [Firebase Integration](./firebase-integration.md) - Integration with Firebase
- [Third-party Services](./third-party-services.md) - Third-party services

### Deployment and Operations
- [Deployment Guide](./deployment-guide.md) - Deployment guide
- [CI/CD Pipeline](./ci-cd-pipeline.md) - CI/CD pipeline
- [Monitoring and Logging](./monitoring-logging.md) - Monitoring and logging

## Project Conventions

### Naming
- **Components**: PascalCase (PropertyCardComponent)
- **Services**: camelCase + Service (propertyService)
- **Models**: PascalCase + Model (PropertyModel)
- **Interfaces**: PascalCase + Interface (PropertyInterface)

### File Structure
```
feature/
├── models/
│   ├── property.model.ts
│   └── index.ts
├── services/
│   ├── property.service.ts
│   └── index.ts
├── presentation/
│   ├── components/
│   ├── pages/
│   └── index.ts
└── state/
    ├── property.state.ts
    └── index.ts
```

### Commits
- Use conventional commits
- Format: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore

## Useful Resources
- [Angular Documentation](https://angular.io/docs)
- [PrimeNG Documentation](https://primeng.org/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Firebase Documentation](https://firebase.google.com/docs)

## Contacts
- **Technical Lead**: [Name]
- **DevOps**: [Name]
- **QA**: [Name]

---
*This documentation is maintained up to date with AKURI_TEST standards and the Akuri Methodology.*