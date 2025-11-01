---
trigger: triaje_build
description: Workflow para construcción de lógica de negocio y servicios en backend/frontend. Define pasos obligatorios desde REQUIREMENT hasta BUILD con TRACKER.
status: active
use_case: BUILD
---

# Workflow: BUILD - Construcción de Lógica de Negocio

## 1. Propósito
Este workflow define los pasos obligatorios para construir nueva funcionalidad de lógica de negocio en backend o frontend, asegurando que se siga el flujo completo REQUIREMENT → DESIGN → PLAN → BUILD con TRACKER para prevenir improvisaciones.

## 2. Condiciones de Activación
- **Automática:** Triaje clasifica solicitud como BUILD.
- **Manual:** Usuario especifica "Quiero aplicar workflow BUILD para feature X".
- **Requisito:** Solo proceder si existe alcance explícito (carpetas/archivos específicos).

## 3. Pasos Obligatorios

### Paso 1: REQUIREMENT (MODO CREATIVO)
- **Propósito:** Definir exactamente qué se necesita construir.
- **Actividades:**
  - Crear `[REQUIREMENT].feature-name.md` en `.akuri/akuri-specs/feature-name/`.
  - Incluir: Propósito, Alcance, Limitaciones, Criterios de Aceptación, Requisitos de Seguridad.
- **Validación:** Obtener aprobación explícita del usuario.
- **Salida:** REQUIREMENT aprobado.

### Paso 2: DESIGN (MODO CREATIVO)
- **Propósito:** Proponer solución conceptual narrativa.
- **Actividades:**
  - Crear `[DESIGN].feature-name.md`.
  - Describir entorno, explicación de solución, resolución de problemas, garantías de criterios.
- **Validación:** Aprobación del usuario.
- **Salida:** DESIGN aprobado.

### Paso 3: PLAN (MODO DICTATORIAL)
- **Propósito:** Blueprint rígido para construcción.
- **Actividades:**
  - Crear `[PLAN].feature-name.md` con subtipos: STRUCTURE, FUNCTIONAL, TESTS, SECURITY.
  - Definir archivos, imports, métodos, DTOs, etc.
- **Validación:** Aprobación del usuario.
- **Salida:** PLAN aprobado.

### Paso 4: BUILD con TRACKER (MODO DICTATORIAL)
- **Propósito:** Construir código siguiendo PLAN exactamente.
- **Actividades:**
  - Crear `[TRACKER].feature-name.md` para seguimiento.
  - Implementar archivos según PLAN-FUNCTIONAL.
  - Marcar tareas completadas en TRACKER.
  - Ejecutar pruebas según PLAN-TESTS.
- **Validación:** Checklist completo en TRACKER, aprobación por paso.
- **Salida:** Código construido, pruebas pasadas.

## 4. Puntos de Control
- **Antes de cada paso:** Verificar aprobación del paso anterior.
- **Bloqueo:** Si falta REQUIREMENT/DESIGN/PLAN, responder "Workflow no autorizado".
- **Alcance:** Solo modificar archivos especificados en PLAN.

## 5. Modos por Paso
- **CREATIVO:** Pasos 1-2 (exploración con usuario).
- **DICTATORIAL:** Pasos 3-4 (ejecución precisa).

## 6. Artefactos Generados
- `[REQUIREMENT]...md`
- `[DESIGN]...md`
- `[PLAN]...md`
- `[TRACKER]...md`
- Código en archivos especificados.

## 7. Referencias
- Ver `workflow.master.md` para activación.
- Ver `akuri.04-glossary.md` para definiciones.