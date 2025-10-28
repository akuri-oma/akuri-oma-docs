
--- START OF FILE QUICK_START.md ---

# Akuri-OMA Quick Start Guide

Welcome to Akuri-OMA! This guide will show you how to set up your first project to use the methodology in under 5 minutes.

## What is Akuri-OMA?

It's a **Specification-Driven Development (SDD)** methodology designed to work with AI agents. Instead of giving direct commands, you and the AI collaborate to create detailed specifications that are then turned into high-quality code. For more details, read the [Introduction to Akuri-OMA](./docs/en/00_Introduction_to_Akuri_OMA.md).

## Step 1: Set Up the `.akuri` Folder Structure

The Akuri-OMA methodology lives in an `.akuri` folder at the root of your platform.

1.  **Create the Root Folder:** At the root of your repository (monorepo), create the `.akuri` folder.

2.  **Copy the Base Structure:** Clone or copy the `guidelines`, `prompts`, and `docs` structure from this repository into your new `.akuri` folder. Your initial structure should look like this:

    ```
    YOUR_PROJECT/
    └── .akuri/
        ├── akuri-docs/         # Contains the glossary and documentation.
        ├── akuri-guidelines/   # Contains all rules and workflows.
        ├── akuri-manifest/     # (Empty for now)
        └── akuri-prompts/      # Contains prompt templates.
    ```

## Step 2: Create Your Platform Manifest

The `platform.manifest.md` is the "brain" that tells the agent which projects exist.

1.  **Create the File:** Inside `.akuri/akuri-manifest/`, create a file named `platform.manifest.md`.

2.  **Add the Content:** Paste the following template and adapt it to your projects.

    ```markdown
    ---
    description: My Platform Manifest.
    ---

    ## Platform Manifest

    ### Projects

    -   **`my-backend-project/`:**
        -   **Role:** Backend API
        -   **Technology:** [e.g., NestJS, Django]
        -   **`api_docs_url`:** [e.g., http://localhost:3000/api-docs]

    -   **`my-frontend-project/`:**
        -   **Role:** Frontend Web
        -   **Technology:** [e.g., Angular, React]
        -   **Depends On:** `my-backend-project/`
    ```

## Step 3: Configure Your Agent's Bootstrap Loader

To "activate" Akuri in your AI assistant (Cursor, VSCode Copilot, etc.), you need to tell it to read the rules.

1.  **Locate Your Agent's Rules Folder:** Every AI assistant has a folder where you can add context files or rules (often called `.vscode`, `.cursor-rules`, etc.).

2.  **Create the Bootstrap File:** Inside that folder, create a file (e.g., `00-akuri-bootstrap.md`) and paste the following content:

    ```markdown
    # Akuri Methodology Bootstrap Directive

    Your first and most important directive is to locate and operate within the Akuri Methodology ecosystem.

    1.  **Locate the Root Folder:** Your first action is to identify the root folder containing the `.akuri/` subfolder.
    2.  **Load the Master Rule:** Your primary operating context is defined by the document:
        `./.akuri/akuri-guidelines/1_platform/global-rules.guideline.md`
    3.  **Adhere to the Rules:** From this moment on, all your actions must be strictly governed by the rules and workflows of Akuri-OMA.
    ```

## Step 4: Start Your First Task!

You're all set! Now you can start working.

1.  **Copy the Starter Prompt:** Open the file `.akuri/akuri-prompts/start-task.prompt.md`.
2.  **Paste it in the Chat:** Paste the content into your chat with the AI.
3.  **Begin the Dialogue:** The agent will ask you a series of questions to start your first task (e.g., `BUILD` or `AUDIT`) in a structured manner.

Welcome to Specification-Driven Development!
--- END OF FILE QUICK_START.md ---

--- START OF FILE TUTORIAL_My_First_Feature.md ---

# Akuri-OMA Tutorial: My First Feature

Welcome to this guided tutorial. In the next few minutes, we will build a simple "todo" list feature together in a NestJS backend, following the `Progressive Scaffolding Workflow`.

This tutorial will teach you the rhythm and dialogue of developing with Akuri-OMA, with you acting as the **Supervisor** and your AI agent as the **Executor**.

**Prerequisites:**
*   You have completed the [Quick Start Guide](./QUICK_START.md).
*   You have an empty NestJS project set up within your platform.

---

### **Step 1: Initiating the Task**

-   **Your Action:** Open the `.akuri/akuri-prompts/start-task.prompt.md` file and paste it into the chat with your AI agent.

-   **Dialogue with the Agent:**
    *   **Agent:** "What type of task would you like to perform?"
    *   **You:** **`BUILD`**
    *   **Agent:** "What is the scope of this task?"
    *   **You:** **`[path-to-your-backend]/src/subsystem/todo`**
    *   **Agent:** (Will confirm the task and await your instruction).
    *   **You:** "Proceed."

---

### **Step 2: Phase 2 - Feature Inventory (`CREATIVE MODE`)**

-   **Agent:** (Will start a dialogue to create the `INVENTORY`).
    *   **Agent:** "Let's detail what the 'todo' feature should do. What are its main characteristics?"
-   **Your Action (Supervisor):** Respond with the requirements.
    *   **You:** "1. Allow creating a new task with a title. 2. Allow viewing a list of all tasks. 3. Allow marking a task as completed. 4. Tasks should be saved in Firestore."
-   **Result:** The agent will present you with an `[INVENTORY].todo.md` document with these features.
-   **Your Action:** Review the inventory and approve it.
    *   **You:** "The inventory is correct. Approved."

---

### **Step 3: Phase 3 - Architectural Blueprint (`DICTATORIAL MODE`)**

-   **Agent:** (Will initiate the nomenclature design phase).
    *   **Agent:** "Based on the inventory, this feature appears to be `STANDARD` type. Do you agree?"
    *   **You:** "Yes, `STANDARD` is correct."
    *   **Agent:** "Confirmed. The feature name is `todo`. I will now generate the file `tree` for the `[PLAN]`."
-   **Result:** The agent will present a file `tree` in the `[PLAN].todo.md` that looks something like this:
    ```
    todo/
    ├── models/
    │   ├── dto/
    │   ├── entity/
    │   └── response/
    ├── services/
    │   └── todo.service.ts
    ├── controllers/
    │   └── todo.controller.ts
    └── todo.module.ts
    ```
-   **Your Action:** Review the `tree` and approve it.
    *   **You:** "The structure is correct. Approved."

---

### **Step 4: Phases 4, 5, & 6 - `PLAN` Refinement**

-   **Agent:** (Will ask to expand the plan with the following blueprints).
    *   **Implementation Skeleton:** The agent will propose classes and methods (`create`, `findAll`, `updateStatus`).
    *   **Technical Blueprint:** The agent will declare that it will use `firebase-admin` and `class-validator`.
    *   **API Contract:** (This phase is skipped for the backend).
-   **Your Action:** Review and approve each section as the agent presents it.
    *   **You:** "The skeleton is correct. Approved."
    *   **You:** "The technical blueprint is correct. Approved."

---

### **Step 5: Phase 7 - Implementation (`DICTATORIAL MODE`)**

-   **Agent:** (Will create the `[EXECUTION].todo.md` with a checklist).
    *   **Agent:** "I have created the execution log. The first task is: '[ ] Task 1: Create the base folder and file structure'. Shall I proceed?"
-   **Your Action:** Give the command for each step.
    *   **You:** "Proceed."
    *   *(The agent completes Task 1 and updates the `EXECUTION` file)*
    *   **Agent:** "Task 1 completed. The next task is: '[ ] Task 2: Implement the models in 'todo/models/'. Shall I proceed?"
    *   **You:** "Proceed."
-   **... and so on**, you will supervise the construction step-by-step, including the "Build Validation Tasks".

---

### **Tutorial Conclusion**

Congratulations! you have supervised the construction of your first feature with Akuri-OMA.

You have learned the rhythm of the methodology:
1.  **Initiate** the task in a structured way.
2.  **Define** the requirements in `CREATIVE MODE`.
3.  **Approve** the technical specifications (`PLAN`) in `DICTATORIAL MODE`.
4.  **Supervise** the construction step-by-step (`EXECUTION`).

You are now ready to apply this workflow to more complex features. For more details, consult the full documentation in the `/docs/en/` folder.
--- END OF FILE TUTORIAL_My_First_Feature.md ---

--- START OF FILE 00_Introduction_to_Akuri_OMA.md ---

# Introduction to the Akuri-OMA Methodology

Welcome to Akuri-OMA, a software development methodology designed for the era of artificial intelligence. Its goal is to provide a disciplined, predictable, and scalable framework that allows development teams (both human and AI agents) to collaborate efficiently to build high-quality software.

This document introduces the philosophical concepts that underpin the entire system.

## 1. The Core Philosophy: Specification-Driven Development (SDD)

The foundation of Akuri-OMA is **Specification-Driven Development (SDD)**.

> Specification-Driven Development (SDD) is a software development methodology where **detailed, formal specifications act as the central "blueprint"** for building an application, rather than just being a preliminary guide.
>
> It emphasizes writing clear, structured specifications **before** implementation to guide the **entire process**, including code generation, testing, and validation.
>
> This approach is especially crucial in AI-assisted development, as it ensures clarity, maintainability, and control by **guiding AI agents through a structured plan, instead of giving them direct, unguided commands.**

In Akuri-OMA, we never ask an agent to "build a feature." Instead, we collaborate with it to *specify* the feature in detail through artifacts like `[INVENTORY]` and `[PLAN]`. The code is simply the final result of a well-defined specification.

### Advantages of the SDD Approach
- **Clarity and Predictability:** Everyone involved knows exactly what will be built before a single line of code is written.
- **Control and Governance:** It allows for rigorous quality control at each phase, ensuring the implementation adheres to the architecture and requirements.
- **Efficiency for AI:** It provides AI agents with a limited and focused context, drastically reducing "hallucinations," errors, and the need for rework.
- **Self-Documentation:** The specification artifacts (`PLAN`, `INVENTORY`) become living and accurate documentation for the feature.

### Considerations (Drawbacks)
- **Discipline Required:** It demands a greater time investment in the planning and design phases compared to more agile, less formal methodologies.
- **Initial Rigidity:** The process is intentionally rigid. Creativity is focused on the conceptualization phases, while implementation is an exercise in disciplined execution.

## 2. The Dual-Agent Model: Supervisor and Executor

To implement SDD effectively with AI, Akuri-OMA proposes a **dual-agent model**, where two distinct roles collaborate:

-   **The Supervisor (The Architect):**
    *   **Actor:** Typically a human developer (or a highly advanced AI in the future), or a human with an auxiliary AI.
    *   **Responsibility:** To make strategic decisions. The Supervisor guides the process, asks the right questions, reviews the artifacts generated by the Executor, and gives final approval at each gate. Their role is that of an orchestra conductor.

-   **The Executor (The Implementer):**
    *   **Actor:** The AI agent operating within a code assistant (VSCode, Cursor, etc.).
    *   **Responsibility:** To follow instructions and `guidelines` with absolute precision. It generates the artifacts (`PLAN`, code, etc.), executes tasks, and reports the results. Its role is that of an expert musician following the sheet music.

This collaboration, where the Supervisor focuses on the "what" and "why" and the Executor focuses on the "how," is the key to leveraging the full power of AI without losing control of the process.
--- END OF FILE 00_Introduction_to_Akuri_OMA.md ---

--- START OF FILE 01_Fundamental_Principles_of_Akuri_OMA.md ---

# Fundamental Principles of Akuri-OMA

After understanding the philosophy of Specification-Driven Development (SDD), it is crucial to comprehend the architectural and process principles that make the Akuri-OMA methodology robust and scalable.

## 1. OMA: Orchestrated Modular Architecture

Akuri-OMA is based on the principle of **Orchestrated Modular Architecture (OMA)**. This means that applications are built as a set of **decoupled modules or features**, where each module is an expert in its own domain, but all are orchestrated by clear rules and contracts.

-   **Modules (Features):** A feature is a self-contained unit of software that solves a specific business problem (e.g., `shopping-cart`, `provider-profile`).
-   **Decoupling:** Modules should not have deep knowledge of the internal implementation of other modules.
-   **Orchestration:** They communicate with each other through well-defined contracts (APIs, events) and are governed by global architectural rules.

The main advantage of OMA is **maintainability and scalability**. You can modify, replace, or audit a feature without affecting the rest of the system, as long as the contracts are respected.

## 2. Technology Agnosticism

The Akuri-OMA methodology is **technology-agnostic**. The principles of SDD, the hierarchy of `guidelines`, and the workflows are universal software engineering concepts.

-   **How it works:** The methodology separates the **process `workflows`** (which are universal) from the **technology `guidelines`** (which are specific).
-   **Example:** The `Progressive Scaffolding Workflow` is the same for NestJS, Angular, or Flutter. What changes is that, during the `Architectural Blueprint` phase, the agent will invoke the `architectural-patterns` guideline specific to the technology it is working on.

This allows a team to adopt Akuri-OMA across their entire tech stack, maintaining a consistent way of working even with different languages and frameworks.

## 3. Hierarchical Governance

The rules and `guidelines` in Akuri-OMA are not a flat list; they exist in a strict **hierarchy of precedence**. This ensures that high-level decisions always govern low-level ones.

The hierarchy is:
1.  **Level 1 (Platform):** Global rules that apply to all projects (e.g., the Triage Protocol).
2.  **Level 2 (Project):** `Workflows` that define the main processes (e.g., `BUILD`, `AUDIT`).
3.  **Level 3 (Technology):** Implementation `guidelines` specific to a framework (e.g., how to structure a module in NestJS).

A Level 3 guideline can never contradict a Level 1 rule.

## 4. Formalism Before Functionalism

This is a fundamental principle of the construction process, inspired by civil engineering: **you don't build the second floor on unstable foundations.**

-   **Definition:** In Akuri-OMA, **formal (architectural) compliance** always precedes **functional (implementation) compliance**.
-   **In Practice:** Before implementing the business logic of a service, the system (through the `Progressive Scaffolding Workflow`) ensures that:
    1.  The nomenclature is correct.
    2.  The folder and file structure is correct.
    3.  The skeleton of classes and methods is correct.

If the architecture is wrong, the feature, even if it "works," is considered invalid. This principle is the key to building quality software that is predictable, auditable, and scalable in the long term.
--- END OF FILE 01_Fundamental_Principles_of_Akuri_OMA.md ---

--- START OF FILE 02_Configuring_the_Akuri_Environment.md ---

# Configuring the Akuri Environment

For the Akuri-OMA methodology to work, it requires a specific and standardized folder structure. This structure acts as the "file system" of the Akuri operating system, where each folder has a clear and defined purpose.

## Level 0
General guides for the specific manager (windsur, kilocode, cursor, etc)

## 1. The `.akuri` Folder

The `.akuri` folder is the heart of governance. It exists at two hierarchical levels:

-   **Platform Level (`./.akuri/`):**
    *   **Location:** At the root of the repository or monorepo.
    *   **Purpose:** Contains documents that are **global** and apply to **all projects** on the platform.

-   **Project Level (`./[project-name]/.akuri/`):**
    *   **Location:** At the root of each individual project (e.g., `backend-nest/`, `webpage-angular/`).
    *   **Purpose:** Contains documents that are **specific** to that project, such as its technology guidelines or design system.

## 2. Detailed Structure of the `.akuri` Folder

The following structure is replicated, with variations, at both the Platform and Project levels.


.akuri/
├── akuri-manifest/ # The declarative contracts.
├── akuri-guidelines/ # The instruction manuals (the "how").
├── akuri-design-system/ # The visual identity (frontends only).
├── akuri-prompts/ # Prompt templates for the user.
├── akuri-work/ # The temporary workbench.
├── akuri-history/ # The archive of completed tasks.
└── akuri-docs/ # General documentation and examples.
    
### Description of each Subfolder:

-   **`akuri-manifest/`**:
    *   Contains the `manifests`. The `platform.manifest.md` defines the projects, while each `project.manifest.md` declares the tech stack and constraints of that project (e.g., "use Firebase," "dependency file is pubspec.yaml").

-   **`akuri-guidelines/`**:
    *   The technical knowledge base. It is organized hierarchically:
        *   `1_platform/`: Global operating rules.
        *   `2_project/`: `Workflows` like `BUILD` or `AUDIT`.
        *   `3_technology/`: `Guidelines` specific to each technology (NestJS, Angular, etc.).
        *   `4_task/`: Predefined tasks and work patterns.

-   **`akuri-design-system/`**:
    *   **Only exists at the Frontend Project Level.** Contains the manifests that define the `Look & Feel`: colors, typography, components, iconography, etc., as well as guidelines for various technologies used as part of the visual design (css preprocessors, module libraries, icons, fonts, etc.).

-   **`akuri-prompts/`**:
    *   Contains reusable `prompt` templates for the user to initiate common tasks (`start-task.prompt.md`) in a standardized way.

-   **`akuri-work/`**:
    *   This is the agent's **temporary** work folder. Artifacts (`INVENTORY`, `PLAN`, `AUDIT Report`) are created and modified here during a task. Once the task is complete, this folder is cleaned up.

-   **`akuri-history/`**:
    *   A long-term archive of completed execution logs (`EXECUTION`), for process auditing.

-   **`akuri-docs/`**:
    *   Contains supporting documentation, such as `akuri.glossary.md` (glossary of terms), examples, and tutorials.

## 3. The `akuri-specs` Folder (The Design History)

Unlike the previous folders, the `akuri-specs/` folder **does not live inside `.akuri`**.

-   **Location:** It is created at the **root of each built feature** (e.g., `backend-nest/src/subsystem/provider/akuri-specs/`).
-   **Purpose:** It acts as the "black box" or historical record of a feature. Upon completion of a `BUILD`, the design artifacts (`INVENTORY`, `PLAN`, `HANDOVER`) are moved from `akuri-work/` to this folder.
-   **Advantage:** This creates **perfect traceability** from the original requirement to the source code. To understand why a feature was built a certain way, one simply needs to read the specifications that live alongside it.

  
--- END OF FILE 02_Configuring_the_Akuri_Environment.md ---

--- START OF FILE 03_The_Artifacts_of_Akuri.md ---

# The Artifacts of Akuri

The Akuri-OMA methodology is based on the generation and evolution of a series of formal documents, or "artifacts." Each artifact has a specific purpose and is used in a specific phase of the workflow. Understanding the role of each is fundamental to guiding the AI agent.

## 1. Governance Artifacts (Configuration)

These documents establish the rules and context of the environment. They rarely change.

-   **Manifest (`*.manifest.md`):**
    *   **Purpose:** A declarative document that establishes the **technologies, projects, and constraints** of a `PLATFORM` or `PROJECT`. It answers the question: "What is it and what technologies does it use?".
    *   **Examples:** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline (`*.guideline.md` or `*.workflow.md`):**
    *   **Purpose:** A technical instruction manual. It defines **"how"** code should be structured, logic should be implemented, or a process should be followed. These are the rules of **implementation and architecture**.
    *   **Example:** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document (`*.design.md`):**
    *   **Purpose:** A visual identity manual. It defines **"how"** a user interface should look and feel. These are the rules of **appearance and visual behavior**.
    *   **Example:** `angular-app.look-and-feel.design.md`.

-   **Prompt Template (`*.prompt.md`):**
    *   **Purpose:** A reusable template for the user to initiate a standardized task, ensuring the agent receives the correct context.
    *   **Example:** `start-task.prompt.md`.

## 2. Workflow Artifacts (Operational)

These documents are created and modified during the execution of a task. They live temporarily in the `akuri-work/` folder.

-   **CONCEPT (`[CONCEPT]...md`):**
    *   **Phase:** 1 (Conceptualization).
    *   **Purpose:** An initial brainstorming document to explore high-level ideas without constraints, operating in `CREATIVE MODE`.

-   **INVENTORY (`[INVENTORY]...md`):**
    *   **Phase:** 2 (Feature Inventory).
    *   **Purpose:** The detailed list of **functional requirements** for a feature. It answers the question: "What should it do?". It is created in `CREATIVE MODE`.

-   **PLAN (`[PLAN]...md`):**
    *   **Phases:** 3 to 7.
    *   **Purpose:** The **living document** and technical blueprint for construction. It evolves through the phases, from the architecture (`tree`), to the implementation skeleton, the technical blueprint, the API contract, and finally the test plan. It is created and managed in `DICTATORIAL MODE`.

-   **EXECUTION (`[EXECUTION]...md`):**
    *   **Phase:** 7 (Implementation).
    *   **Purpose:** A "build log" with a checklist of implementation tasks and validation points. It allows for managing complex `BUILD` tasks sequentially and reliably, avoiding context window issues.

-   **HANDOVER (`[HANDOVER]...md`):**
    *   **Phase:** 9 (Post-`BUILD` of Backend).
    *   **Purpose:** The transfer document from the backend to the frontend. It summarizes the business capabilities, suggests pages to be built, and provides a summary of the API contract.

-   **AUDIT Report (`[AUDIT]...md`):**
    *   **Phase:** `AUDIT`.
    *   **Purpose:** The report resulting from an audit. It details the deviations found in the code compared to the `guidelines` and manifests. It is the `input` for a `REFACTOR` task.
--- END OF FILE 03_The_Artifacts_of_Akuri.md ---

--- START OF FILE 04_The_Triage_Process_and_Operating_Modes.md ---

# The Triage Process and Operating Modes

At the heart of the interaction with the Akuri Agent are two fundamental concepts: **Triage**, which is the initial classification process for a task, and **Operating Modes**, which define the agent's "state of mind" during execution.

## 1. Triage: The First Step of Every Task

**Triage** is the first action the agent must perform for any user request. It consists of analyzing the `prompt` and classifying it into one of the predefined categories. This classification determines which workflow to follow and which set of documents (`guidelines` or `design-system`) to consult.

The generic `start-task.prompt.md` is designed to facilitate this process, guiding the user to provide the necessary information for a correct classification.

### The Triage Categories:

#### Logic and Structure Tasks
*Focus on "how it works."*
-   `DESIGN`: Conceptually define something new.
-   `INVENTORY`: List functional requirements.
-   `PLAN`: Create or update the construction plan.
-   `BUILD`: Implement business logic, services, etc.
-   `AUDIT`: Review code compliance against architecture and logic `guidelines`.
-   `REFACTOR`: Improve the internal structure of the code.
-   `DEBUG`: Debug logic errors.
-   `... and others`

#### Look & Feel Tasks (Frontend)
*Focus on "how it looks and feels."*
-   `UI_BUILD`: Create the visual structure (HTML and connections) of a UI.
-   `UI_REFACTOR` / `UI_SKIN`: Apply or modify the style (CSS, colors, fonts).
-   `UI_AUDIT`: Review the visual compliance of a UI against the `design-system`.

## 2. Operating Modes: Creative vs. Dictatorial

To execute the phases of a workflow, the agent alternates between two distinct modes of behavior, each with a clear objective.

### `CREATIVE MODE` (The Analyst)
-   **Phases:** Conceptualization and Inventory.
-   **Objective:** To explore, analyze, and define.
-   **Behavior:**
    -   Acts as a business analyst or an architect in a brainstorming phase.
    -   Asks open-ended questions to understand the vision and requirements.
    -   Proposes ideas and alternatives.
    -   **Is not governed by strict implementation rules.** The priority is defining the "what" and the "why."
-   **Result:** Artifacts like `[CONCEPT]` and `[INVENTORY]`.

### `DICTATORIAL MODE` (The Executor)
-   **Phases:** Architecture, Skeleton, Implementation, Testing, etc.
-   **Objective:** To execute, build, and verify with precision.
-   **Behavior:**
    -   Acts as a disciplined software engineer.
    -   **Follows the `guidelines` and the user's decisions with absolute precision.**
    -   Does not propose creative alternatives to the structure; it implements it.
    -   Its input `prompts` are usually decisions already made or artifacts already approved (e.g., "Use these names," "Implement this skeleton").
-   **Result:** Artifacts like `[PLAN]`, `[EXECUTION]`, and the final source code.

Understanding this duality is key to collaborating effectively with the Akuri Agent. The human Supervisor guides the agent through these modes, leveraging its creative capacity to define the task and its disciplined execution capacity to build it without errors.
--- END OF FILE 04_The_Triage_Process_and_Operating_Modes.md ---

--- START OF FILE 05_Workflow_Creating_Features_(BUILD).md ---

# User Manual: Creating Features (BUILD Workflow)

This document is a practical guide for the **Supervisor** role on how to direct the Akuri Agent to build a new feature from scratch, following the `Progressive Scaffolding Workflow` (`akuri.progressive-scaffolding-workflow.guideline.md`).

The process is a sequence of `prompts` and approvals that guide the agent through the design and implementation phases, ensuring quality and consistency.

---

### **Step 0: Initiating the Task**

-   **Your Action:** Use the generic `start-task.prompt.md`.
-   **Dialogue with the Agent:**
    1.  When the agent asks for the "Task Type," respond: **`BUILD`**.
    2.  When it asks for the "Scope," provide the path where the new feature will be created.
    3.  The agent will confirm the task and await your instruction to begin.

---

### **Step 1: Phases 1 & 2 - Conceptualization and Inventory (`CREATIVE MODE`)**

-   **Your Objective:** To collaborate with the agent to define what the new feature should do.
-   **Your Role (Supervisor):**
    -   Participate in the brainstorming dialogue (Phase 1, optional).
    -   Answer the agent's questions to create a detailed list of functional requirements (Phase 2).
-   **Approval Gate:** At the end of this stage, the agent will present the `[INVENTORY]...md` document. You must review it carefully and **explicitly approve it** to continue.

---

### **Step 2: Phases 3 to 6 - Design and Planning (`DICTATORIAL MODE`)**

-   **Your Objective:** To make architectural decisions and validate the technical contracts before construction.
-   **Your Role (Supervisor):** The agent will sequentially expand the `[PLAN]...md` document. Your job is to review and approve each of these sections:
    1.  **Architectural Blueprint (Phase 3):**
        *   Provide (in a "dictatorial" manner) or approve the nomenclature for the feature and its sub-modules.
        *   Review and approve the folder and file `tree`.
    2.  **Implementation Skeleton (Phase 4):**
        *   Review and approve the signatures of classes, interfaces, and methods.
    3.  **Technical Blueprint (Phase 5):**
        *   Verify the list of dependencies and approve any new proposed libraries.
        *   Confirm that the agent has acknowledged the key implementation conventions.
    4.  **API Contract (Phase 6, Frontend only):**
        *   Validate that the endpoint mapping is correct and that the synchronization status with the backend is "✅ Successful."

**Each of these approvals is a blocking gate.**

---

### **Step 3: Phase 7 - Implementation by Blocks (`DICTATORIAL MODE`)**

-   **Your Objective:** To supervise the code construction in a safe and controlled manner.
-   **Your Role (Supervisor):**
    1.  Give the agent the command to start the `BUILD` phase. The agent will create the `[EXECUTION]...md` document with a checklist.
    2.  Your main task during this phase is to give the "continue" command for the agent to execute the next task on the checklist.
    3.  Supervise the results of the "Build Validation Tasks" after each logical block to ensure the codebase remains stable.

---

### **Step 4: Phases 8, 9, & 10 - Finalization and Archiving**

-   **Your Objective:** To validate the final product and ensure the documentation is archived correctly.
-   **Your Role (Supervisor):**
    1.  **Test Plan (End of Phase 7):** Review and approve the "Test Plan" that the agent adds to the `PLAN`.
    2.  **Test Execution (Phase 8):** Direct the agent to execute the tests and fix any found bugs.
    3.  **Handover Document (Phase 9, Backend only):** Request and review the `[HANDOVER]...md`.
    4.  **Archiving of Specifications (Phase 10):** Give the final command for the agent to move all design artifacts (`INVENTORY`, `PLAN`, `HANDOVER`) from `akuri-work/` to the new `akuri-specs/` folder within the feature.

Upon completing this workflow, you will have a new feature that is built, tested, and has all its design documentation permanently archived alongside the source code.
--- END OF FILE 05_Workflow_Creating_Features_(BUILD).md ---

--- START OF FILE 06_Workflow_Auditing_and_Refactoring_(AUDIT_REFACTOR).md ---

# User Manual: Auditing and Refactoring (AUDIT & REFACTOR Workflows)

This document is a practical guide for the **Supervisor** role on how to direct the Akuri Agent to audit the quality of existing code (`AUDIT`) and to fix the found deviations (`REFACTOR`).

This workflow is fundamental for maintenance, continuous improvement, and ensuring the codebase remains aligned with the Akuri-OMA methodology over time.

---

### **Step 1: Initiating an `AUDIT` Task**

-   **Your Objective:** To obtain a detailed report on the compliance of an existing feature.
-   **Your Action:** Use the generic `start-task.prompt.md`.
-   **Dialogue with the Agent:**
    1.  When the agent asks for the "Task Type," respond: **`AUDIT`** (or `UI_AUDIT` if it's only visual).
    2.  When it asks for the "Scope," provide the **path to the feature folder** you want to review.
    3.  The agent will confirm the task, the workflow it will follow (`audit-refactor.workflow.md`), and the artifact it will produce.

-   **Execution:** The agent will proceed autonomously to execute the cascaded audit, comparing the code against all relevant `guidelines`.
-   **Result:** The agent will present you with the `[AUDIT]...md` document, listing all found deviations or a declaration of full compliance.

---

### **Step 2: Reviewing the Report and Deciding the Next Step**

-   **Your Objective:** To analyze the audit report and make a strategic decision.
-   **Your Role (Supervisor):**
    -   Read the `[AUDIT]...md` carefully.
    -   **Decision A:** If the report is "✅ **Full Compliance**," the process ends. The feature is solid.
    -   **Decision B:** If deviations were found, the next step is to initiate a `REFACTOR` task.

---

### **Step 3: Initiating a `REFACTOR` Task**

-   **Your Objective:** To create a plan to fix the deviations found in the audit.
-   **Your Action:** Use the generic `refactor.prompt.md` (or simply continue the conversation).
-   **Dialogue with the Agent:**
    1.  State that you want to start a `REFACTOR` task.
    2.  Provide the **filename of the `[AUDIT]...md`** that will serve as the `input`.
    3.  Confirm the path of the feature to be refactored.

-   **Agent Execution (`DICTATORIAL MODE`):**
    1.  The agent will analyze the audit report.
    2.  It will differentiate whether the changes are a `REFACTOR` (internal) or require a `REMAKE` (changes to the public API). If it's a `REMAKE`, it will notify you and stop the flow.
    3.  It will create the `[PLAN].[refactor]...md` document, converting the report's recommendations into a **prioritized checklist of correction tasks**.

-   **Approval Gate:** The agent will present the refactoring plan to you. **You must review and explicitly approve it** before any code is modified.

---

### **Step 4: Supervising the Execution and Verification of the `REFACTOR`**

-   **Your Objective:** To ensure the corrections are applied correctly.
-   **Your Role (Supervisor):**
    1.  **Execution:** Give the agent the command to execute the tasks from the refactoring plan. For complex tasks, you can ask it to proceed task by task.
    2.  **Verification:** Once the agent reports that it has completed all corrections, its guideline instructs it to perform a **second verification `AUDIT`**.
    3.  **Final Result:** The agent will present a new audit report that should ideally show "✅ **Full Compliance**." If deviations remain, a new "micro-cycle" of `REFACTOR` is initiated.

Upon completing this workflow, you will have a feature that has been audited, corrected, and validated, ensuring its quality meets Akuri-OMA standards.
--- END OF FILE 06_Workflow_Auditing_and_Refactoring_(AUDIT_REFACTOR).md ---

--- START OF FILE 07_Workflow_Debugging_Errors_(DEBUG).md ---

# User Manual: Debugging Errors (DEBUG Workflow)

This document is a practical guide for the **Supervisor** role on how to direct the Akuri Agent to diagnose and resolve errors in the code, following the `debug.workflow.md`.

The objective is to provide a systematic process that allows the agent to identify the root cause of a problem, propose a solution, and verify its effectiveness.

---

### **Step 1: Initiating a `DEBUG` Task**

-   **Your Objective:** To report an error as clearly as possible so the agent can begin working.
-   **Your Action:** Use the generic `start-task.prompt.md` or simply start a conversation.
-   **Dialogue with the Agent (`CLARIFY` Phase):**
    1.  **Task Type:** State that you want to start a `DEBUG` task.
    2.  **Scope:** Provide the path to the feature where the error is occurring.
    3.  **Essential Information:** The agent will ask you a series of key questions. For effective debugging, it is **crucial** that you provide:
        *   The **exact error message** and the `stack trace` (if it's a compilation error).
        *   The **steps to reproduce** the error.
        *   A description of the **expected behavior** vs. the **actual behavior** (if it's a logic error).

-   **Agent's Classification:** Based on your information, the agent will classify the error as "Compilation/Syntax Error" or "Logic/Behavior Error."

---

### **Step 2: Supervising the Diagnosis**

-   **Your Objective:** To follow the agent's reasoning as it investigates the cause of the error.
-   **Your Role (Supervisor):**
    -   **If it's a Compilation Error:** The agent will propose corrections one by one, following the error list from the console. Your role is to validate if the proposed correction is logical before it is applied.
    -   **If it's a Logic Error:** The agent will follow a deeper process:
        1.  **Mini-Audit (Optional):** It may first perform a quick architectural review to rule out structural problems.
        2.  **Data Flow Analysis:** It will explain how it is "tracing" the data or action through the layers (Component -> Action Service -> API Service, etc.).
        3.  **Hypothesis Formulation:** It will present its hypothesis about the root cause of the problem (e.g., "My hypothesis is that the `State` is not being updated because the API subscription is in the wrong place.").

---

### **Step 3: Approving the Solution and Verifying**

-   **Your Objective:** To validate the proposed solution and confirm that the error has been resolved.
-   **Your Role (Supervisor):**
    1.  **Solution Approval:** The agent will present the specific code change it proposes to fix the error. You must review and **explicitly approve it**.
    2.  **Execution:** Once approved, the agent will apply the change.
    3.  **Verification:** The agent will ask you to verify that the error no longer occurs. Your task is to perform the reproduction steps and confirm if the behavior is now as expected.

Upon completing this workflow, you will have an error that is diagnosed, corrected, and verified, following a logical and traceable process.
--- END OF FILE 07_Workflow_Debugging_Errors_(DEBUG).md ---