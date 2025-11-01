---
trigger: model_decision
description: Master guide for building reactive forms in Angular Akuri-OMA. Details the use of ReactiveFormsModule, integration with PrimeNG, application of layout and state tokens, and validation and UX patterns to ensure consistency and maintainability.
status: active
linked_files: [
  `angular-app.look-and-feel.design.md`,
  `angular-app.primeng-conventions.design.md`,
  `angular.akuri-oma.services.guideline.md`
]
use_case: UI_BUILD, UI_REFACTOR, BUILD, AUDIT
---

# Guide for Forms Construction (`angular-app.forms-construction.design.md`)

## 1. Introduction and Philosophy

This document establishes the standard for building all data entry forms on the platform. Forms are a critical component of user interaction and must be consistent, predictable, and robust.

**Philosophy:**
-   **`ReactiveFormsModule` as Base:** All forms **MUST** use Angular's `ReactiveFormsModule` for explicit and testable state management.
-   **Logic in the `.ts` Component:** The definition of `FormGroup`, `FormControls`, and validations reside in the TypeScript file of the page component.
-   **Appearance Based on Tokens:** The layout and appearance of form fields **MUST** be controlled by predefined design tokens (`FORM_LAYOUT_...`, `FORM_STATE_...`), ensuring consistent UI.
-   **`Tailwind-First`:** Styling is based on Tailwind CSS utilities, applied through tokens.

## 2. The Lifecycle of a Form

1.  **Initialization:** The component (`.page.ts`) obtains the initial DTO (either from a factory function or a backend endpoint).
2.  **`FormGroup` Construction:** A `FormGroup` instance is created, with `FormControls` corresponding to the DTO properties. Validators (`Validators.required`, etc.) are applied.
3.  **Template Binding (`.page.html`):** The HTML template binds form elements (`<input>`, `<p-dropdown>`, etc.) to `FormControls` using `[formGroup]` and `formControlName`.
4.  **Visual State Management:** CSS classes are dynamically applied to fields based on the `FormControl` state (valid, invalid, touched) and state tokens.
5.  **Submission (Submit):** When the form is submitted, the component invokes the corresponding method of the **`Action Service`**, passing it the form value (`this.form.value`) after any necessary transformation.

## 3. Structure and Layout Tokens

-   **Shared Modules:** For forms with many controls, YOU must import `FormsPrimeNgModule` from `src/app/shared/forms/modules/forms.primeng.module.ts`. For simple forms, import PrimeNG modules directly.
-   **Responsive Columns:** The form column structure (1, 2, or 4 columns) **MUST** be controlled by applying the classes of the `FORM_LAYOUT_BREAKPOINTS` defined in `src/app/shared/forms/tokens/forms.layout.tokens.ts`.
-   **Section Wrapping:** Each logical section of the form **MUST** be wrapped in a `<div>` that uses the `FORM_SECTION_CARD` token to ensure consistency in padding, borders, and background.

## 4. Styling and Field State Tokens

The appearance of each form field (input, label, error message) is standardized through tokens to reflect its state.

-   **State Tokens:** Background and border colors are defined in `src/app/shared/forms/tokens/forms.state.tokens.ts`.
-   **Token Application:** YOU must combine these tokens with directives like `[ngClass]` to dynamically apply the correct style:
    -   **Required:** `FORM_STATE_REQUIRED`
    -   **Valid:** `FORM_STATE_VALID` (when `control.valid && control.touched`)
    -   **Error:** `FORM_STATE_ERROR` (when `control.invalid && control.touched`)
-   **Interaction Feedback:** The `FORM_STATE_HOVER` token **MUST** be applied to each interactive field for visual feedback.
-   **Consistent Typography:**
    -   **Labels (`<label>`):** `FORM_STATE_LABEL`
    -   **Help Text:** `FORM_STATE_HELPER`
    -   **Error Messages:** `FORM_STATE_ERROR_TEXT`

## 5. Validation and User Experience (UX) Patterns

-   **State Binding:** YOU must bind the state of reactive `FormControl` to state tokens so that colors and styles reflect the validation state in real time.
-   **Visual Structure:** Labels (`label`) **MUST** be placed above inputs. Error and help messages **MUST** be placed below.
-   **Accessibility:**
    -   The `for` attribute of the label must match the `id` of the input.
    -   The tab order must be logical (left to right, top to bottom).
    -   YOU must ensure that keyboard focus remains within modals and cycles correctly within the form.

## 6. Integration with Akuri-OMA Services

-   **Theme and Timezone:** If the form includes date/time controls, YOU must inject and use `SettingsTimezoneService` to display the current timezone. Theme change operations are managed by `SettingsThemeService`.
-   **Draft Saving (Optional):** For long forms, the logic to save drafts in `sessionStorage` can be implemented using the `State Service` and its associated `storage`.

## 7. Practical Example (Pseudo-code)

**Component (`.ts`):**
```typescript
export class PropertyEditorPage implements OnInit {
  form: FormGroup;
  propertyState = inject(PropertyStateService);
  propertyAction = inject(PropertyActionService);
  fb = inject(FormBuilder);

  ngOnInit() {
    // Get initial DTO
    const initialData = createInitialPropertyDto();
    // Create the FormGroup
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
```

**Template (`.html`):**
```html
<form [formGroup]="form" (ngSubmit)="onSubmit()">
  <div [ngClass]="FORM_SECTION_CARD">
    <!-- Name Field -->
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
    <!-- ... other fields ... -->
  </div>
</form>