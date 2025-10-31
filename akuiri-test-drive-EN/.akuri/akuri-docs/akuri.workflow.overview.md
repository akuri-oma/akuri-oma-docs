---
trigger: presentation
description: Summary of the complete workflow of the Akuri-OMA Methodology for presentations, with diagram and explanations per artifact.
---

# Complete Workflow: Akuri-OMA Methodology

## General Flow Diagram (Slide 1)

```
[User Request] → Triage → REQUIREMENT (CREATIVE MODE)
    ↓
Feasibility Validation → Approval
    ↓
DESIGN (CREATIVE MODE) → Approval
    ↓
PLAN (Subtypes: STRUCTURE, FUNCTIONAL, TESTS, SECURITY) (DICTATORIAL MODE)
    ↓
BUILD with TRACKER (DICTATORIAL MODE) → Testing
    ↓
HANDOVER (Backend → Frontend) → Integration
    ↓
Completion and Audit
```

**Key Notes:**
- Modes: CREATIVE (exploration), DICTATORIAL (rigid execution).
- Security integrated in all phases.
- Step-by-step validation; do not advance without approval.

## Explanation per Artifact (Following Slides)

### 1. REQUIREMENT
- **Purpose**: Defines "what" is needed (purpose, scope, limitations, acceptance criteria, security requirements).
- **When**: Start of any new/modified functionality.
- **Mode**: CREATIVE (questions to user).
- **Example**: For product management: "CRUD of products with validations, without unauthorized access".

### 2. DESIGN
- **Purpose**: Conceptual narrative solution (environment, explanation, problem resolution, guarantees of criteria).
- **When**: After approved REQUIREMENT.
- **Mode**: CREATIVE.
- **Example**: "Use NestJS for backend with Angular for frontend, guaranteeing <500ms responses".

### 3. PLAN (Subtypes)
- **Purpose**: Rigid blueprint (file/folder structure, functional content, tests, security).
- **Subtypes**:
  - STRUCTURE: Folder/file architecture.
  - FUNCTIONAL: Detailed file content.
  - TESTS: Unit tests + security.
  - SECURITY: Cybersecurity measures.
- **When**: After DESIGN.
- **Mode**: DICTATORIAL.
- **Example**: PLAN-STRUCTURE defines modules in NestJS; PLAN-SECURITY details JWT.

### 4. TRACKER
- **Purpose**: Real-time tracking of BUILD (marked checklists, progress, validation).
- **When**: During BUILD.
- **Mode**: DICTATORIAL.
- **Example**: Checklist of completed tasks, risk notes.

### 5. HANDOVER
- **Purpose**: Backend-frontend integration contract (endpoints, DTOs, responses, security).
- **When**: End of backend BUILD.
- **Mode**: DICTATORIAL.
- **Example**: API details with JSON schemas and authentication.

### 6. Security (Integrated)
- **Purpose**: Mandatory pillar (OWASP, encryption, validations).
- **When**: All phases.
- **Example**: Requirements in REQUIREMENT, measures in PLAN-SECURITY.

This flow ensures rigorous, traceable, and secure development.