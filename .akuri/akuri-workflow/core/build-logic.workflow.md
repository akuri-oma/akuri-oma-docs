---
trigger: triaje_build_logic
description: Workflow para construcción de la capa lógica en frontend (models, services, state, routes) sin capa visual.
status: active
use_case: BUILD-LOGIC
---

# Workflow: BUILD-LOGIC - Construcción de Capa Lógica

## 1. Propósito
Este workflow define los pasos para construir únicamente la capa lógica de un feature frontend (models, servicios, estado centralizado, rutas), conectando completamente con el backend pero sin implementar ninguna interfaz visual. La capa visual se construye posteriormente en un workflow separado.

## 2. Condiciones de Activación
- **Automática:** Triaje identifica necesidad de capa lógica en frontend
- **Manual:** Usuario especifica "Construir lógica para feature X"
- **Requisito:** Backend APIs disponibles (HANDOVER completado)
- **Alcance:** Solo archivos en `services/`, `models/`, rutas - NADA en `presentation/`

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir qué lógica implementar
- **Actividades:**
  - Crear `[REQUIREMENT].logic.feature-name.md`
  - Incluir: APIs a consumir, estado a manejar, lógica de negocio
  - Excluir: Aspectos visuales o de UI
- **Validación:** Aprobación del usuario
- **Salida:** REQUIREMENT aprobado

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Diseñar arquitectura lógica
- **Actividades:**
  - Crear `[DESIGN].logic.feature-name.md`
  - Definir servicios, modelos, estado, comunicación con backend
  - Especificar integración con bus de datos global
- **Validación:** Aprobación del usuario
- **Salida:** DESIGN aprobado

### Paso 3: PLAN (MODO DICTATORIAL)
- **Propósito:** Detallar implementación lógica exacta
- **Actividades:**
  - Crear `[PLAN].logic.feature-name.md`
  - Listar archivos en `services/`, `models/`, rutas
  - Definir métodos, DTOs, estado, integraciones
  - Excluir cualquier archivo visual
- **Validación:** Aprobación del usuario
- **Salida:** PLAN aprobado

### Paso 4: BUILD-LOGIC con TRACKER (MODO DICTATORIAL)
- **Propósito:** Implementar lógica conectada al backend
- **Actividades:**
  - Crear `[TRACKER].logic.feature-name.md`
  - Implementar modelos y DTOs
  - Crear servicios API conectados al backend
  - Implementar estado centralizado
  - Configurar rutas del feature
  - Integrar con bus de datos global
  - Probar conexiones backend (sin UI)
- **Validación:** Lógica funcional, tests unitarios pasan
- **Salida:** Capa lógica completa y testeada

## 4. Artefactos Generados
- `[REQUIREMENT].logic.feature-name.md`
- `[DESIGN].logic.feature-name.md`
- `[PLAN].logic.feature-name.md`
- `[TRACKER].logic.feature-name.md`
- Archivos en `services/`, `models/`, rutas
- Tests unitarios para lógica

## 5. Reglas Específicas
- **NO crear archivos visuales:** Nada en `presentation/`, `pages/`, `components/`
- **Backend first:** Toda lógica debe conectar con APIs existentes
- **Estado centralizado:** Implementar desde el inicio
- **Bus de datos:** Integrar comunicación entre features
- **Tests obligatorios:** Validar lógica sin UI

## 6. Verificación de Completitud
- ✅ APIs conectadas y funcionales
- ✅ Estado centralizado implementado
- ✅ Comunicación con otros features vía bus
- ✅ Tests unitarios cubren toda lógica
- ✅ Rutas configuradas
- ❌ Nada visual implementado

## 7. Siguiente Paso
Después de completar BUILD-LOGIC, proceder con:
- `UI_BUILD`: Construir capa visual
- `UI_SKIN`: Aplicar design system

## 8. Referencias
- Ver `workflow.master.md` para activación
- Ver `akuri.04-glossary.md` para definiciones
- Ver `[ARCHITECTURE].project-architecture.md` para estructura