
<img src="../../assets/logo-akuri-black.png" alt="Logo Akuri" align="left" width="25%" />
<br />
<hr />
<br />

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
