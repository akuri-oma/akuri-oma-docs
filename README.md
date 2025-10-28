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
