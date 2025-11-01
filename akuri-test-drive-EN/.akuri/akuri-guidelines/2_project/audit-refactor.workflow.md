---
trigger: model_decision
description: Orchestrator guideline that defines the AUDIT and REFACTOR workflows under the Hierarchical Waterfall Model. It invokes a sequence of micro-guidelines to audit formal compliance (architecture) and then functional (implementation) of a functionality.
status: active
use_case: AUDIT, UI_AUDIT, REFACTOR, UI_REFACTOR
---

# Audit and Refactoring Workflow (audit-refactor.workflow.md)

## 1. Principles of the Workflow

-   **Simple Waterfall Principle:** YOU, as the Akuri Agent, MUST execute each audit step in sequence. If a step reveals critical deviations, the process stops, the report is generated, and you do not proceed to the following steps. **Formal compliance precedes functional compliance.**
-   **Sequence `AUDIT` -> `REFACTOR`:** A `REFACTOR` task must always be preceded by an `AUDIT`. The audit report is the `input` for the refactoring plan.

## 2. `AUDIT` Workflow

### Phase 1: Feature Location (User Input)

-   **Objective:** Identify without ambiguity the scope of the audit.
-   **Your Task:**
    1.  Request from the user the **exact path** of the functionality folder to audit.
    2.  If the user provides a list, create a plan to iterate over each one, generating an individual audit report.

### Phase 2: Formal Compliance Audit (Architecture)

#### Step 2.1: Macro-Architecture Validation
-   **Objective:** Verify if the functionality is in the correct location.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Success Criterion:** The folder must be in an allowed "zone" (e.g., `subsystem/`, `modules/`).

#### Step 2.2: Architectural Pattern Validation
-   **Objective:** Verify if the internal structure follows an approved pattern.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Success Criterion:** The folder structure (`models/`, `services/`, etc.) must match a defined pattern (`STANDARD`, `COMPLEX`, etc.).

#### Step 2.3: File Naming Validation
-   **Objective:** Verify if all files have the correct prefix and convention.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Success Criterion:** All files must comply with prefix and suffix rules.

**Checkpoint:** If critical deviations are found in these steps, the report is generated and the audit process for this feature ends here.

### Phase 3: Functional Compliance Audit (Implementation)

#### Step 3.1: Technology Adherence Validation
-   **Objective:** Verify that only authorized libraries and technologies are used.
-   **Action:** Invoke the `project.manifest.md` and compare code imports against authorized technologies.
-   **Success Criterion:** There should be no imports of unauthorized libraries.

#### Step 3.2: Implementation Patterns Validation
-   **Objective:** Verify if the code follows methodology patterns.
-   **Action:** Invoke relevant implementation `guidelines` from the `3_technology/[tech]/` folder.
-   **Success Criterion:** The code must follow the patterns (e.g., thin controllers, API/Action separation, `@for` syntax, etc.).

### Phase 4: Report Generation

-   **Objective:** Consolidate all findings.
-   **Your Task:** Generate the document `[AUDIT].[feature-name].md`, grouping deviations by each waterfall step.

## 3. `REFACTOR` Workflow

### Phase 1: Planning (`PLAN`)
-   **Objective:** Create an action plan based on an audit report.
-   **Your Task:**
    1.  Use an `[AUDIT]...md` report as input.
    2.  Differentiate between `REFACTOR` (internal changes) and `REMAKE` (changes to public API). If it's `REMAKE`, stop the flow and propose a `DESIGN`.
    3.  Create a document `[PLAN].[refactor]-[feature-name].md` that lists correction tasks in a logical order.
    4.  Request user approval for this plan.

### Phase 2: Execution (`BUILD`)
-   **Objective:** Apply the corrections.
-   **Your Task:** **ONLY after plan approval**, execute the code modification tasks.

### Phase 3: Verification
-   **Objective:** Confirm that all deviations have been corrected.
-   **Your Task:** Run a new `AUDIT` on the refactored functionality and present the results.