---
trigger: sample
description: Ejemplo de TRACKER para BUILD de gestión de productos en Angular, guiando lógica y UI.
---

# TRACKER: Build de Gestión de Productos (Angular)

## Información General
- **Funcionalidad**: Product Management
- **Tipo**: Seguimiento de BUILD (Lógica + UI)
- **Ubicación**: `angular-frontend/src/app/modules/product/akuri-specs/TRACKER.angular.product.build.md`
- **Documentos Base**:
  - [`PLAN-FUNCTIONAL.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL.angular.product.management.md)
  - [`PLAN-FUNCTIONAL-UI.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-FUNCTIONAL-UI.angular.product.management.md)
  - [`PLAN-TESTS.angular.product.management.md`](angular-frontend/src/app/modules/product/akuri-specs/PLAN-TESTS.angular.product.management.md)

## Estado General
- [x] PLAN-FUNCTIONAL aprobado
- [ ] BUILD lógica completado
- [ ] BUILD UI completado
- [ ] Tests pasados
- [ ] Validación final del usuario

## Checklist de Tareas (Lógica)

### Models
- [x] Crear product.entity.ts (interfaz con id/name/price)
- [x] Crear create-product.dto.ts (clase con validaciones)
- [x] Crear product.response.ts (interfaz para backend)

### Services
- [ ] Crear product.api.service.ts (métodos HTTP con HttpClient)
- [ ] Crear product.logic.service.ts (validaciones puras)
- [ ] Crear product.state.service.ts (Signals/RxJS para cache)

## Checklist de Tareas (UI)

### Components
- [ ] Crear product.card.component.ts/html/css (tarjeta shared)
- [ ] Crear product-list-page/ archivos (ts/html/css, subcarpeta ui)
- [ ] Crear product-create-page/ archivos (ts/html/css, subcarpeta ui)
- [ ] Crear product-detail-page/ archivos (ts/html/css, subcarpeta ui)

## Checklist de Tests
- [ ] Ejecutar tests unitarios (Jasmine/Karma, cobertura >80%)
- [ ] Validar interacciones UI

## Notas de Progreso
- **Lógica en progreso**: Services listos, probando state.
- **UI pendiente**: Espera lógica completada.
- **Validación**: Aprobar lógica antes de UI.
- **Próxima**: Completar services, luego empezar components.

## Criterios de Finalización
- Todas las tareas marcadas como [x].
- Tests pasan.
- Usuario aprueba funcionalidad.

---

**Última Actualización**: 2025-10-30  
**Estado**: En progreso (30% completado)