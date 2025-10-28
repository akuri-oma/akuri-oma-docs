    
# Akuri-OMA Methodology

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Documentation Status](https://img.shields.io/badge/docs-up%20to%20date-brightgreen.svg)](/docs/es/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**A Specification-Driven Development (SDD) methodology for building high-quality, scalable, and predictable software with AI agents.**

---

## The Problem: AI Agents are Brilliant, but Chaotic

Large Language Models (LLMs) are incredibly powerful code generators. However, when used without a structured framework, they often behave like a brilliant but undisciplined intern:
-   **They Hallucinate:** Inventing libraries, methods, and architectural patterns that don't fit the project.
-   **They are Inconsistent:** Applying different coding styles and structures from one task to the next.
-   **They Lack Context:** Forgetting previous corrections and repeating the same mistakes.
-   **They are Difficult to Govern:** Direct, unguided commands lead to unpredictable results, requiring extensive and frustrating cycles of review and correction.

## The Solution: Akuri-OMA - A Governance Layer for AI

**Akuri-OMA (Orchestrated Modular Architecture)** is not another framework or library. It is a **governance layer** and a **structured dialogue system** that transforms the AI agent from a chaotic partner into a disciplined and predictable executor.

Instead of telling the AI *what to build*, you collaborate with it to create a formal **Specification**. The AI then uses this specification as its "sheet music" to execute the implementation with precision.

### Why Akuri-OMA?

-   **Predictability & Control:** By forcing a step-by-step process of specification and approval, you eliminate surprises. You know exactly what will be built before any code is written.
-   **High-Quality & Consistent Code:** The methodology is enforced by a system of hierarchical `guidelines`. The AI is obligated to follow your project's architectural patterns, naming conventions, and technological restrictions.
-   **Technology Agnostic:** The core workflows are universal. We provide ready-to-use guidelines for **NestJS, Angular, and Flutter**, but the principles can be adapted to any technology stack.
-   **Self-Documenting by Design:** The artifacts created during the development process (`[INVENTORY]`, `[PLAN]`, `[HANDOVER]`) are archived within each feature, creating perfect, permanent traceability from requirement to code.

## The Core Workflow

The methodology follows a "Progressive Scaffolding" model, guided by two operating modes.

`Supervisor (You)` ↔ `Executor (AI Agent)`

  

[ CREATIVE MODE ]

    INVENTORY: Define "what" the feature should do.
    ↓ (Approval)
    [ DICTATORIAL MODE ]

    ARCHITECTURAL BLUEPRINT: Define "where" the code will live (folders & files).
    ↓ (Approval)

    IMPLEMENTATION SKELETON: Define the "shape" of the code (classes & methods).
    ↓ (Approval)

    TECHNICAL BLUEPRINT: Define the "tools" to be used (dependencies & conventions).
    ↓ (Approval)

    BUILD: The AI executes the plan, building the code block by block.

code Code

    
## 🚀 How to Get Started

1.  **Read the Quick Start Guide:** Set up the Akuri-OMA environment in your project in under 5 minutes.
    -   ➡️ **[QUICK_START.md](./QUICK_START.md)**

2.  **Follow the Tutorial:** Build your first feature from scratch by following our guided tutorial.
    -   ➡️ **[TUTORIAL_My_First_Feature.md](./TUTORIAL_Mi_Primera_Funcionalidad.md)** (Spanish)

3.  **Dive into the Full Documentation:** Explore all the concepts, principles, and workflows in detail.
    -   ➡️ **[Full Documentation (Spanish)](./docs/es/)**
    -   *(English documentation coming soon)*

## 📦 Example Projects

The best way to learn is by seeing a complete implementation. These repositories serve as a "golden reference" for the Akuri-OMA methodology.

-   **Backend Example (NestJS):** [Link to `akuri-oma-example-nestjs` repository - *coming soon*]
-   **Frontend Example (Angular):** [Link to `akuri-oma-example-angular` repository - *coming soon*]

## 🤝 How to Contribute

Akuri-OMA is an open-source project, and we welcome contributions from the community. Whether it's improving the documentation, translating it into a new language, or adapting the guidelines to a new technology (like React, Vue, or Svelte), your input is valuable.

Please read our **[Contribution Guide](./CONTRIBUTING.md)** to get started.

## 📜 License

This project is licensed under the MIT License. See the **[LICENSE](./LICENSE)** file for details.

  