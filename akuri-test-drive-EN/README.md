# Akuri-OMA - Tutorial Starter Projects

Welcome! This repository contains the starter projects for the official Akuri-OMA tutorial. Its purpose is to provide you with a clean, pre-configured environment to experience Specification-Driven Development (SDD) with an AI agent from scratch.

This repository is intended for developers with a **moderate to advanced understanding** of the technologies used (NestJS, Angular). The focus is on applying the methodology, not on teaching the basics of the frameworks.

Feel free to change to other frameworks or technologies once you get the basics!

---

## What's Inside?

This monorepo contains two bare-bones projects, freshly created with their respective CLIs:

-   **`nestjs-backend/`**: A minimal NestJS backend project.
-   **`angular-frontend/`**: A minimal Angular frontend project.

The only modification made to these projects is the addition of the complete `.akuri/` folder structure, including the base `guidelines`, `manifests`, and `prompts` for each technology. This allows you to start the tutorial immediately.

---

## The Recommended Dual-Agent Workflow

To get the most out of the Akuri-OMA methodology, we strongly recommend a **two-screen, dual-agent setup**. You, the human developer, will act as the **Supervisor**, orchestrating two specialized AI agents.

### Screen 1: The Supervisor AI (Your Strategic Partner)
-   **Tool:** Your preferred browser-based AI (we use **Google AI Studio**, but others work too).
-   **Role:** This AI knows the **methodology**. It will act as your assistant for creating prompts, reviewing results, and providing strategic guidance.
-   **Setup:** In a new chat session, you will **upload all the context documents** from the `akuri-oma-methodology` repository (all the `guidelines`, `workflows`, `manifests`, etc.). This gives the AI a deep understanding of the entire Akuri-OMA system.

### Screen 2: The Executor AI (Your Code Assistant)
-   **Tool:** Your preferred AI-powered code editor (e.g., **Cursor, WindSorf, KiloCode**).
-   **Role:** This AI knows the **codebase**. It will execute tasks, write code, and run commands.
-   **Setup:** You must configure your editor's workspace rules to use the **`00-akuri-bootstrap.md`** file located in the `.akuri/` folder of the platform. This file instructs the Executor AI to follow the master rules of the Akuri-OMA methodology.

---

## Prerequisites

Before you begin, make sure you have the following installed:
-   Node.js (LTS version)
-   Angular CLI (`npm install -g @angular/cli`)
-   NestJS CLI (`npm install -g @nestjs/cli`)
-   Access to a browser-based AI and an AI-powered code editor.

## How to Use This Repository

1.  **Clone the Repository:**
    ```bash
    git clone [URL_OF_THIS_TUTORIAL_REPOSITORY]
    cd [repository-name]
    ```

2.  **Install Dependencies:**
    Run `npm install` inside both project folders:
    ```bash
    cd nestjs-backend
    npm install
    cd ../angular-frontend
    npm install
    ```

3.  **Set Up the Supervisor AI:**
    -   Open your browser-based AI (e.g., Google AI Studio).
    -   Start a new session and upload all the `guideline` and documentation files from your local copy of the `akuri-oma-methodology` repository.

4.  **Set Up the Executor AI:**
    -   Open this repository folder in your AI-powered code editor (e.g., Cursor).
    -   Configure its workspace rules to use the `akuri-prompts/00-akuri-bootstrap.md` file as a primary rule.

5.  **Start the Tutorial:**
    -   You are now ready to begin. Follow the step-by-step guide in the main methodology repository:
        ➡️ **[TUTORIAL_My_First_Feature.md](https://github.com/user/akuri-oma-methodology/blob/main/TUTORIAL_My_First_Feature.md)**

## Repository Structure

.akuri # pre-configured Akuri folder that governs the platfrom
├── nestjs-backend/
│ ├── .akuri/ # Pre-configured Akuri folder for NestJS
│ └── src/
├── angular-frontend/
│ ├── .akuri/ # Pre-configured Akuri folder for Angular
│ └── src/
├── LEEME.md # This file in Spanish
└── README.md # This file
