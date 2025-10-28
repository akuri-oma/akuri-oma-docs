---
trigger: model_decision
description: Manual de referencia rápida para convenciones de implementación en Angular. Define los alias de importación obligatorios y las correcciones de API para librerías clave como PrimeNG.
status: active
use_case: PLAN, BUILD, REFACTOR, AUDIT, DEBUG
---

# Angular: Manual de Convenciones de Implementación

## 1. Propósito
Este documento es una "hoja de trucos" (cheat sheet) para prevenir errores comunes de importación y uso de APIs. TÚ, como Agente Akuri, DEBES consultar este manual en la Fase 5 del flujo de trabajo, antes de escribir cualquier código de implementación.

## 2. Convenciones de Rutas de Importación (Path Aliases)

Para evitar errores de rutas relativas (`../..`), todas las importaciones DEBEN usar los siguientes alias definidos en `tsconfig.json`:

| Alias | Ruta Lógica | Ejemplo de Uso |
| :---- | :---------- | :------------- |
| `@app` | `src/app/` | `import { AppComponent } from '@app/app.component';` |
| `@core` | `src/app/core/` | `import { AuthService } from '@core/auth/services/auth.service';` |
| `@shared` | `src/app/shared/` | `import { PrimaryButton } from '@shared/ui/primary-button.component';` |
| `@env` | `src/environments/`| `import { environment } from '@env/environment';` |

## 3. Convenciones Específicas de Librerías

### 3.1 PrimeNG (Versión 20+)

| Tarea / Componente | Módulo/Importación Incorrecta (Antigua) | **Módulo/Importación Correcta (Obligatoria)** |
| :----------------- | :------------------------------------ | :------------------------------------------ |
| Dropdown (Seleccionable) | `DropdownModule` | **`AutoCompleteModule`** |
| Notificaciones (Toast) | `ToastModule` de `ngx-toastr` | **`MessageService` de `primeng/api`** |
| Input de Texto Multilínea | `InputTextareaModule` | **`TextareaModule`** |

### 3.2 Firebase

| Tarea | Importación Incorrecta Común | **Importación Correcta (Obligatoria)** |
| :---- | :--------------------------- | :----------------------------------- |
| Módulo Principal | `import { FirebaseModule } from '...';` | **`import { FirebaseModule } from '@core/firebase/firebase.module';`** |

*(Este documento crecerá con el tiempo a medida que se identifiquen más errores recurrentes)*