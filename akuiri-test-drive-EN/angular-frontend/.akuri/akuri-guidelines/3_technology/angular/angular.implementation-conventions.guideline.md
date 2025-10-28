---
trigger: model_decision
description: Quick reference manual for implementation conventions in Angular. Defines mandatory import aliases and API fixes for key libraries like PrimeNG.
status: active
use_case: PLAN, BUILD, REFACTOR, AUDIT, DEBUG
---

# Angular: Implementation Conventions Manual

## 1. Purpose
This document is a "cheat sheet" to prevent common import and API usage errors. YOU, as an Akuri Agent, MUST consult this manual in Phase 5 of the workflow, before writing any implementation code.

## 2. Import Path Conventions (Path Aliases)

To avoid relative path errors (`../..`), all imports MUST use the following aliases defined in `tsconfig.json`:

| Alias | Logical Path | Usage Example |
| :---- | :---------- | :------------- |
| `@app` | `src/app/` | `import { AppComponent } from '@app/app.component';` |
| `@core` | `src/app/core/` | `import { AuthService } from '@core/auth/services/auth.service';` |
| `@shared` | `src/app/shared/` | `import { PrimaryButton } from '@shared/ui/primary-button.component';` |
| `@env` | `src/environments/`| `import { environment } from '@env/environment';` |

## 3. Library-Specific Conventions

### 3.1 PrimeNG (Version 20+)

| Task / Component | Incorrect Module/Import (Legacy) | **Correct Module/Import (Mandatory)** |
| :----------------- | :------------------------------------ | :------------------------------------------ |
| Dropdown (Selectable) | `DropdownModule` | **`AutoCompleteModule`** |
| Notifications (Toast) | `ToastModule` from `ngx-toastr` | **`MessageService` from `primeng/api`** |
| Multiline Text Input | `InputTextareaModule` | **`TextareaModule`** |

### 3.2 Firebase

| Task | Common Incorrect Import | **Correct Import (Mandatory)** |
| :---- | :--------------------------- | :----------------------------------- |
| Main Module | `import { FirebaseModule } from '...';` | **`import { FirebaseModule } from '@core/firebase/firebase.module';`** |

*(This document will grow over time as more recurring errors are identified)*