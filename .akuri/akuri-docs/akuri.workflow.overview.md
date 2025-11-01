---
trigger: presentation
description: Resumen del flujo de trabajo completo de la Metodología Akuri-OMA para presentaciones, con diagrama y explicaciones por artefacto.
---

# Flujo de Trabajo Completo: Metodología Akuri-OMA

Para detalles específicos de cada workflow y su aplicación, consulta `akuri-workflow/workflow.master.md` y los documentos individuales en `akuri-workflow/`.

## Diagrama General del Flujo (Lámina 1)

```
[Usuario Solicitud] → Triaje → REQUIREMENT (MODO CREATIVO)
    ↓
Validación de Factibilidad → Aprobación
    ↓
DESIGN (MODO CREATIVO) → Aprobación
    ↓
PLAN (Subtipos: STRUCTURE, FUNCTIONAL, TESTS, SECURITY) (MODO DICTATORIAL)
    ↓
BUILD con TRACKER (MODO DICTATORIAL) → Pruebas
    ↓
HANDOVER (Backend → Frontend) → Integración
    ↓
Finalización y Auditoría
```

**Notas Clave:**
- Modos: CREATIVO (exploración), DICTATORIAL (ejecución rígida).
- Seguridad integrada en todas las fases.
- Validación paso a paso; no avanzar sin aprobación.

## Explicación por Artefacto (Láminas Siguientes)

### 1. REQUIREMENT
- **Propósito**: Define "qué" se necesita (propósito, alcance, limitaciones, criterios de aceptación, requisitos de seguridad).
- **Cuándo**: Inicio de cualquier funcionalidad nueva/modificación.
- **Modo**: CREATIVO (preguntas al usuario).
- **Ejemplo**: Para gestión de productos: "CRUD de productos con validaciones, sin acceso no autorizado".

### 2. DESIGN
- **Propósito**: Solución conceptual narrativa (entorno, explicación, resolución de problemas, garantías de criterios).
- **Cuándo**: Después de REQUIREMENT aprobado.
- **Modo**: CREATIVO.
- **Ejemplo**: "Usar NestJS para backend con Angular para frontend, garantizando <500ms responses".

### 3. PLAN (Subtipos)
- **Propósito**: Blueprint rígido (estructura de archivos, contenido funcional, pruebas, seguridad).
- **Subtipos**:
  - STRUCTURE: Arquitectura de carpetas/archivos.
  - FUNCTIONAL: Contenido detallado de archivos.
  - TESTS: Pruebas unitarias + seguridad.
  - SECURITY: Medidas de ciberseguridad.
- **Cuándo**: Después de DESIGN.
- **Modo**: DICTATORIAL.
- **Ejemplo**: PLAN-STRUCTURE define módulos en NestJS; PLAN-SECURITY detalla JWT.

### 4. TRACKER
- **Propósito**: Seguimiento en tiempo real de BUILD (checklists marcadas, progreso, validación).
- **Cuándo**: Durante BUILD.
- **Modo**: DICTATORIAL.
- **Ejemplo**: Checklist de tareas completadas, notas de riesgos.

### 5. HANDOVER
- **Propósito**: Contrato de integración backend-frontend (endpoints, DTOs, responses, seguridad).
- **Cuándo**: Final de BUILD backend.
- **Modo**: DICTATORIAL.
- **Ejemplo**: Detalles de API con schemas JSON y autenticación.

### 6. Seguridad (Integrada)
- **Propósito**: Pilar obligatorio (OWASP, encriptación, validaciones).
- **Cuándo**: Todas las fases.
- **Ejemplo**: Requisitos en REQUIREMENT, medidas en PLAN-SECURITY.

Este flujo asegura desarrollo riguroso, trazable y seguro siguiendo los principios OMA (Organización Modular Akuri) definidos en `.akuri/oma/oma-philosophy.md`.