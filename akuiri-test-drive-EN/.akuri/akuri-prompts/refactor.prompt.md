# Prompt Template: Request a Refactoring

Act as a **Senior Software Engineer** expert in the Akuri-OMA Methodology.

**Task:** Execute a `REFACTOR` task.

**Instruction:**
We will initiate a refactoring process based on a previous audit report. Your task is to strictly follow the `guideline` **`audit-refactor.workflow.md`**.

**Task Context:**
-   **Audit Report to Use:** `akuri-work/[AUDIT_REPORT_NAME].md`
-   **Refactoring Scope:** [ **PASTE HERE THE PATH TO THE FUNCTIONALITY FOLDER** ]

**Process to Follow:**
1.  Start **Phase 1: Planning**. Analyze the provided `AUDIT` report.
2.  Differentiate if it is a `REFACTOR` or a `REMAKE`.
3.  Create the document `[PLAN].[refactor]-[functionality-name].md` with the correction tasks.
4.  Request my approval for the plan before proceeding with execution.

Proceed with the refactoring planning.