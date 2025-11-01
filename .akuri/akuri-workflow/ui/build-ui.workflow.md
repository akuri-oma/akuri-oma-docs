---
trigger: triaje_build_ui
description: Workflow para construcción de la capa visual en frontend (presentation/pages/components) después de tener lógica completa.
status: active
use_case: BUILD-UI
---

# Workflow: BUILD-UI - Construcción de Capa Visual

## 1. Propósito
Este workflow define los pasos para construir únicamente la capa visual de un feature frontend (páginas, componentes, layouts) después de que la capa lógica esté completamente implementada y probada. Se enfoca en la experiencia de usuario siguiendo el design system establecido.

## 2. Condiciones de Activación
- **Automática:** Triaje identifica necesidad de capa visual en frontend
- **Manual:** Usuario especifica "Construir UI para feature X"
- **Requisito:** Capa lógica completa (BUILD-LOGIC finalizado)
- **Alcance:** Solo archivos en `presentation/` - NADA en `services/`, `models/`

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir experiencia visual requerida
- **Actividades:**
  - Crear `[REQUIREMENT].ui.feature-name.md`
  - Incluir: Flujos de usuario, layouts, interacciones
  - Referenciar design system existente
  - Excluir: Lógica de negocio (ya implementada)
- **Validación:** Aprobación del usuario
- **Salida:** REQUIREMENT aprobado

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Diseñar experiencia visual
- **Actividades:**
  - Crear `[DESIGN].ui.feature-name.md`
  - Definir wireframes conceptuales
  - Especificar componentes del design system
  - Planificar navegación y transiciones
- **Validación:** Aprobación del usuario
- **Salida:** DESIGN aprobado

### Paso 3: PLAN-UI (MODO DICTATORIAL)
- **Propósito:** Detallar implementación visual exacta
- **Actividades:**
  - Crear `[PLAN-UI].feature-name.md`
  - Listar páginas, componentes, layouts
  - Definir conexiones con estado existente
  - Especificar responsive design
  - Excluir cualquier lógica nueva
- **Validación:** Aprobación del usuario
- **Salida:** PLAN aprobado

### Paso 4: BUILD-UI con TRACKER (MODO DICTATORIAL)
- **Propósito:** Implementar UI conectada a lógica existente
- **Actividades:**
  - Crear `[TRACKER].ui.feature-name.md`
  - Implementar páginas básicas (HTML/structure)
  - Crear componentes conectados a estado
  - Configurar navegación y routing
  - Implementar interacciones básicas
  - Probar integración con lógica existente
- **Validación:** UI funcional conectada a lógica, navegación correcta
- **Salida:** Capa visual básica implementada

## 4. Artefactos Generados
- `[REQUIREMENT].ui.feature-name.md`
- `[DESIGN].ui.feature-name.md`
- `[PLAN-UI].feature-name.md`
- `[TRACKER].ui.feature-name.md`
- Archivos en `presentation/pages/`, `presentation/components/`, `presentation/layout/`

## 5. Reglas Específicas
- **Lógica ya existe:** NO crear nueva lógica, solo consumir estado existente
- **Design system:** Seguir estrictamente componentes y estilos definidos
- **Conexión con estado:** Usar servicios de estado ya implementados
- **Navegación:** Integrar con rutas ya configuradas
- **Progresivo:** Construir página por página con validación

## 6. Verificación de Completitud
- ✅ Páginas creadas con estructura HTML básica
- ✅ Componentes conectados a estado existente
- ✅ Navegación funcional
- ✅ Interacciones básicas implementadas
- ✅ Responsive design considerado
- ❌ NO se creó lógica nueva
- ❌ NO se modificó estado existente

## 7. Siguiente Paso
Después de completar BUILD-UI, proceder con:
- `UI_SKIN`: Aplicar estilos y design system completo
- `UI_AUDIT`: Auditar conformidad visual

## 8. Diferencias con BUILD-LOGIC
| Aspecto | BUILD-LOGIC | BUILD-UI |
|---------|-------------|----------|
| **Alcance** | `services/`, `models/`, rutas | `presentation/` |
| **Backend** | Conectar APIs | Usar APIs ya conectadas |
| **Estado** | Crear estado centralizado | Consumir estado existente |
| **Tests** | Unitarios de lógica | Tests de integración UI |
| **Tiempo** | Rápido (semanas) | Lento (meses) |
| **Validación** | Funcionalidad | UX/UI + Design System |

## 9. Referencias
- Ver `workflow.master.md` para activación
- Ver `akuri.04-glossary.md` para definiciones
- Ver `[ARCHITECTURE].project-architecture.md` para estructura
- Ver design system del proyecto