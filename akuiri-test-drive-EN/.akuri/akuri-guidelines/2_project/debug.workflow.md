---
trigger: model_decision
description: Orchestrator guideline that defines the DEBUG workflow. Details the systematic process for diagnosing and resolving errors, differentiating between compilation/syntax errors and logic/behavior errors.
status: active
use_case: DEBUG_BASIC, DEBUG_ADVANCED
---

# Debugging Workflow (debug.workflow.md)

## 1. Introduction and Fundamental Principle

This document defines the systematic workflow that YOU, as an Akuri Agent, must follow to diagnose and resolve errors (`DEBUG`).

The fundamental principle is: **"A compliant architecture is the first step to error-free code."** Before searching for a logic error, YOU must ensure that the code adheres to the established architecture, as many behavioral failures originate from structural deviations.

## 2. The Debugging Workflow

### Phase 1: Triage and Error Classification (`CLARIFY`)

Your first action is to understand the nature of the error.

1.  **Gather User Information:**
    *   **Key Questions:**
        *   "Please provide the **exact error message** and, if possible, the complete `stack trace` that appears in the console."
        *   "In which file(s) and line(s) is the error reported?"
        *   "Describe the **steps to reproduce** the error. What were you trying to do when it occurred?"
        *   "What was the **expected behavior** and what was the **actual behavior**?"

2.  **Classify the Error:** Based on the response, YOU will classify the problem into one of two categories:
    *   **Compilation/Syntax Error:** The code does not compile or fails to start. The console shows clear errors about syntax, types, missing imports, etc.
    *   **Logic/Behavior Error:** The code compiles and runs, but does not do what is expected.

### Phase 2: Compilation/Syntax Error Diagnosis

These errors are usually a "task list" provided by the compiler.

1.  **Console Analysis:** YOU will analyze the list of errors in the console.
2.  **Iterative Solution (Cascade Model):**
    *   **Action:** YOU will address the errors **one by one, from the first in the list downwards**.
    *   **Reasoning:** Explain to the user: "Often, fixing an initial error (like an incorrect import) solves many of the subsequent cascade errors."
    *   **Correction Cycle:**
        a.  Identify the first error.
        b.  Propose the correction.
        c.  Simulate (or request) a new compilation.
        d.  Re-analyze the new list of errors.
        e.  Repeat until no errors remain.

### Phase 3: Logic/Behavior Error Diagnosis

These errors are more complex and require a deeper approach, following the "architecture first" principle.

1.  **Step 3.1: Mini-Architecture Compliance Audit (Optional but Recommended):**
    *   **Objective:** Rule out that the error is due to an architectural deviation.
    *   **Action:** Perform a quick version of the `audit.workflow.md` on the affected functionality, focusing on:
        *   **File Naming and Location:** Are the files where they should be?
        *   **Service Structure (Frontend):** Is the `API`/`Action`/`State` separation respected?
        *   **Thin Controller Pattern (Backend):** Is the logic in the service?
    *   **Communication:** "Before debugging the logic, I will perform a quick audit to ensure the code structure is correct, as this often reveals the root cause of behavioral issues."

2.  **Step 3.2: Data Flow Analysis ("Follow the Trail"):**
    *   **Objective:** Trace the data flow from user input to the point where the behavior diverges from the expected.
    *   **Action (Frontend):**
        a.  Start at the **`Presentation` component**: Does the user event (`click`, `submit`) correctly call the `Action Service` method?
        b.  Go to the **`Action Service`**: Is the `isLoading` state updated? Is the `API Service` called with the correct parameters?
        c.  Go to the **`API Service`**: Is the HTTP request built correctly?
        d.  Analyze the **`API Service` response**: Does the `Action Service` correctly handle the `next` (success) and `error`?
        e.  Go to the **`State Service`**: Is the state updated with the correct data?
        f.  Return to the **`Presentation` component**: Does it correctly subscribe to the `State` and render the expected data?
    *   **Action (Backend):** Follow a similar flow from the `Controller` -> `Service` -> `Repository/Database` and back.

3.  **Step 3.3: Hypothesis Formulation and Solution Proposal:**
    *   **Action:** Based on the flow analysis, YOU will formulate a hypothesis about the cause of the error. (e.g., "My hypothesis is that the `Action Service` is not handling the API error case, so the `isLoading` state is never reset to `false`").
    *   **Proposal:** Propose the specific code modification to solve the problem.

### Phase 4: Correction Implementation and Verification

1.  **Apply the Change:** Once the user approves the solution, YOU will apply the correction.
2.  **Verification:** YOU must propose or describe the steps to verify that the correction not only fixes the original problem but has not introduced new errors (regression tests).