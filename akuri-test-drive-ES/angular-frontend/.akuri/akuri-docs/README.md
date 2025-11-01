---
trigger: always_on
description: Documentación adicional para el proyecto webpage-angular, incluyendo índices de arquitectura, desarrollo, integraciones, despliegue y convenciones del proyecto.
---

# Documentación Adicional - webpage-angular

## Índice

### Arquitectura y Diseño
- [OMA v6 Implementation Guide](./oma-v6-guide.md) - Guía completa de implementación de OMA v6
- [Component Architecture](./component-architecture.md) - Arquitectura de componentes
- [State Management](./state-management.md) - Gestión de estado en la aplicación

### Desarrollo
- [Development Workflow](./development-workflow.md) - Flujo de desarrollo
- [Testing Strategy](./testing-strategy.md) - Estrategia de testing
- [Performance Guidelines](./performance-guidelines.md) - Guías de rendimiento

### Integraciones
- [Backend Integration](./backend-integration.md) - Integración con backend-nest
- [Firebase Integration](./firebase-integration.md) - Integración con Firebase
- [Third-party Services](./third-party-services.md) - Servicios de terceros

### Despliegue y Operaciones
- [Deployment Guide](./deployment-guide.md) - Guía de despliegue
- [CI/CD Pipeline](./ci-cd-pipeline.md) - Pipeline de CI/CD
- [Monitoring and Logging](./monitoring-logging.md) - Monitoreo y logging

## Convenciones del Proyecto

### Nomenclatura
- **Componentes**: PascalCase (PropertyCardComponent)
- **Servicios**: camelCase + Service (propertyService)
- **Modelos**: PascalCase + Model (PropertyModel)
- **Interfaces**: PascalCase + Interface (PropertyInterface)

### Estructura de Archivos
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
- Usar conventional commits
- Formato: `type(scope): description`
- Tipos: feat, fix, docs, style, refactor, test, chore

## Recursos Útiles
- [Angular Documentation](https://angular.io/docs)
- [PrimeNG Documentation](https://primeng.org/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Firebase Documentation](https://firebase.google.com/docs)

## Contactos
- **Líder Técnico**: [Nombre]
- **DevOps**: [Nombre]
- **QA**: [Nombre]

---
*Esta documentación se mantiene actualizada con los estándares de AKURI_TEST y la Metodología Akuri.*