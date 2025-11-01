    
---
trigger: model_decision
description: Guía maestra para la construcción de formularios reactivos en Angular Akuri-OMA. Detalla el uso de ReactiveFormsModule, la integración con PrimeNG, la aplicación de tokens de layout y estado, y los patrones de validación y UX para garantizar la consistencia y mantenibilidad.
status: active
linked_files: [
  `angular-app.look-and-feel.design.md`,
  `angular-app.primeng-conventions.design.md`,
  `angular.akuri-oma.services.guideline.md`
]
use_case: UI_BUILD, UI_REFACTOR, BUILD, AUDIT
---

# Guía para la Construcción de Formularios (`angular-app.forms-construction.design.md`)

## 1. Introducción y Filosofía

Este documento establece el estándar para la construcción de todos los formularios de entrada de datos en la plataforma. Los formularios son un componente crítico de la interacción del usuario y deben ser consistentes, predecibles y robustos.

**Filosofía:**
-   **`ReactiveFormsModule` como Base:** Todos los formularios **DEBEN** usar el `ReactiveFormsModule` de Angular para un manejo de estado explícito y testable.
-   **Lógica en el Componente `.ts`:** La definición del `FormGroup`, `FormControls` y las validaciones residen en el archivo TypeScript del componente de la página.
-   **Apariencia basada en Tokens:** El layout y la apariencia de los campos del formulario **DEBEN** ser controlados por los tokens de diseño predefinidos (`FORM_LAYOUT_...`, `FORM_STATE_...`), garantizando una UI consistente.
-   **`Tailwind-First`:** La estilización se basa en las utilidades de Tailwind CSS, aplicadas a través de los tokens.

## 2. El Ciclo de Vida de un Formulario

1.  **Inicialización:** El componente (`.page.ts`) obtiene el DTO inicial (ya sea de una función de fábrica o de un endpoint del backend).
2.  **Construcción del `FormGroup`:** Se crea una instancia de `FormGroup`, con `FormControls` que se corresponden con las propiedades del DTO. Se aplican validadores (`Validators.required`, etc.).
3.  **Vinculación a la Plantilla (`.page.html`):** La plantilla HTML vincula los elementos del formulario (`<input>`, `<p-dropdown>`, etc.) a los `FormControls` usando `[formGroup]` y `formControlName`.
4.  **Gestión de Estado Visual:** Las clases CSS se aplican dinámicamente a los campos basándose en el estado del `FormControl` (válido, inválido, tocado) y los tokens de estado.
5.  **Envío (Submit):** Al enviar el formulario, el componente invoca el método correspondiente del **`Action Service`**, pasándole el valor del formulario (`this.form.value`) después de cualquier transformación necesaria.

## 3. Estructura y Tokens de Layout

-   **Módulos Compartidos:** Para formularios con muchos controles, TÚ debes importar `FormsPrimeNgModule` desde `src/app/shared/forms/modules/forms.primeng.module.ts`. Para formularios simples, importa los módulos de PrimeNG directamente.
-   **Columnas Responsivas:** La estructura de columnas del formulario (1, 2, o 4 columnas) **DEBE** ser controlada aplicando las clases de los `FORM_LAYOUT_BREAKPOINTS` definidos en `src/app/shared/forms/tokens/forms.layout.tokens.ts`.
-   **Envoltura de Secciones:** Cada sección lógica del formulario **DEBE** estar envuelta en un `<div>` que utilice el token `FORM_SECTION_CARD` para asegurar consistencia en padding, bordes y fondo.

## 4. Estilización y Tokens de Estado del Campo

La apariencia de cada campo del formulario (input, label, mensaje de error) está estandarizada a través de tokens para reflejar su estado.

-   **Tokens de Estado:** Los colores de fondo y borde se definen en `src/app/shared/forms/tokens/forms.state.tokens.ts`.
-   **Aplicación de Tokens:** TÚ debes combinar estos tokens con directivas como `[ngClass]` para aplicar dinámicamente el estilo correcto:
    -   **Requerido:** `FORM_STATE_REQUIRED`
    -   **Válido:** `FORM_STATE_VALID` (cuando `control.valid && control.touched`)
    -   **Error:** `FORM_STATE_ERROR` (cuando `control.invalid && control.touched`)
-   **Feedback de Interacción:** El token `FORM_STATE_HOVER` **DEBE** aplicarse a cada campo interactivo para el feedback visual.
-   **Tipografía Consistente:**
    -   **Etiquetas (`<label>`):** `FORM_STATE_LABEL`
    -   **Texto de Ayuda:** `FORM_STATE_HELPER`
    -   **Mensajes de Error:** `FORM_STATE_ERROR_TEXT`

## 5. Patrones de Validación y Experiencia de Usuario (UX)

-   **Vinculación de Estado:** TÚ debes vincular el estado de los `FormControl` reactivos a los tokens de estado para que los colores y estilos reflejen el estado de validación en tiempo real.
-   **Estructura Visual:** Las etiquetas (`label`) **DEBEN** colocarse encima de los inputs. Los mensajes de error y ayuda **DEBEN** colocarse debajo.
-   **Accesibilidad:**
    -   El atributo `for` de la etiqueta debe coincidir con el `id` del input.
    -   El orden de tabulación debe ser lógico (izquierda a derecha, arriba a abajo).
    -   TÚ debes asegurar que el foco del teclado se mantenga dentro de los modales y se cicle correctamente dentro del formulario.

## 6. Integración con Servicios Akuri-OMA

-   **Tema y Timezone:** Si el formulario incluye controles de fecha/hora, TÚ debes inyectar y utilizar `SettingsTimezoneService` para mostrar la zona horaria actual. Las operaciones de cambio de tema son gestionadas por `SettingsThemeService`.
-   **Guardado de Borradores (Opcional):** Para formularios largos, la lógica para guardar borradores en `sessionStorage` puede ser implementada utilizando el `State Service` y su `storage` asociado.

## 7. Ejemplo Práctico (Pseudo-código)

**Componente (`.ts`):**
```typescript
export class PropertyEditorPage implements OnInit {
  form: FormGroup;
  propertyState = inject(PropertyStateService);
  propertyAction = inject(PropertyActionService);
  fb = inject(FormBuilder);

  ngOnInit() {
    // Obtener DTO inicial
    const initialData = createInitialPropertyDto();
    // Crear el FormGroup
    this.form = this.fb.group({
      name: [initialData.name, Validators.required],
      price: [initialData.price, [Validators.required, Validators.min(0)]],
    });
  }

  onSubmit() {
    if (this.form.valid) {
      this.propertyAction.onCreate(this.form.value);
    }
  }
}

  

Plantilla (.html):
code Html

    
<form [formGroup]="form" (ngSubmit)="onSubmit()">
  <div [ngClass]="FORM_SECTION_CARD">
    <!-- Campo de Nombre -->
    <div class="field-container">
      <label [ngClass]="FORM_STATE_LABEL" for="name">Property Name</label>
      <input pInputText formControlName="name" id="name" [ngClass]="{
        [FORM_STATE_REQUIRED]: true,
        [FORM_STATE_ERROR]: form.controls.name.invalid && form.controls.name.touched,
        [FORM_STATE_VALID]: form.controls.name.valid && form.controls.name.touched
      }" />
      <small [ngClass]="FORM_STATE_ERROR_TEXT" *ngIf="form.controls.name.invalid && form.controls.name.touched">
        Name is required.
      </small>
    </div>
    <!-- ... otros campos ... -->
  </div>
</form>

  