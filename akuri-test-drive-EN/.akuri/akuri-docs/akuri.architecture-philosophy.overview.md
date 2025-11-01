---
trigger: overview
description: General description of the OMA architecture and Akuri philosophy in the Akuri-OMA Methodology.
---

# OMA Architecture and Akuri Philosophy

## Introduction
The Akuri-OMA Methodology (Oriented Methodology Architecture) is a rigorous framework for software development, designed to guarantee quality, traceability, and security in technological projects. It combines civil engineering principles with development best practices, emphasizing living documentation and progressive validation. Its name reflects the "methodology-oriented architecture" (OMA), where each phase of the process is structured to minimize risks and maximize efficiency.

## Akuri Philosophy
The Akuri philosophy is based on "Specification Oriented Development", a disciplinary approach that prioritizes clarity and rigidity over improvisation. Its fundamental principles are:

- **Specifications as Base**: All development begins with detailed documents (REQUIREMENT, DESIGN, PLAN), which define "what" is needed before "how" to implement it. This avoids "pretty" solutions but not aligned with the user.
- **Rigidity and Traceability**: Plans are "rigid like civil engineering blueprints"; changes require new documents. Each step is validated with the user, ensuring progressive advancement without unexpected setbacks.
- **AI Integration with Limits**: AI agents (like this one) operate in defined modes (CREATIVE for exploration, DICTATORIAL for execution), with strict rules to prevent improvisations. AI is a tool, not a replacement for the methodology.
- **Quality and Security by Default**: Testing and security are integrated into all phases, following standards like OWASP. There are no "optionals"; failures block progress.
- **Collaboration and Continuous Improvement**: Emphasizes user feedback and living documentation, allowing audits and scalability. The methodology evolves with lessons learned.

In essence, Akuri transforms chaotic development into a predictable process, like building a house with precise blueprints instead of improvising.

## OMA Architecture
The OMA architecture organizes development into interconnected layers and phases, forming a "skeleton" that guides from idea to final product. It is divided into:

### 1. Governance Layers
- **Master Documents**: Glossary, guidelines and manifests that define global rules and restrictive technologies.
- **Workflow Artifacts**: REQUIREMENT, DESIGN, PLAN (subtypes: STRUCTURE, FUNCTIONAL, TESTS, SECURITY), TRACKER, HANDOVER.
- **Operational Modes**: CREATIVE (analytical, questions) and DICTATORIAL (executor, precision).

### 2. Process Phases
1. **Triage**: Initial classification of the user's request.
2. **Specification**: REQUIREMENT (what) → DESIGN (conceptual solution).
3. **Planning**: PLAN (rigid technical blueprint).
4. **Execution**: BUILD with TRACKER (progressive tracking).
5. **Integration**: HANDOVER (backend-frontend contract).
6. **Validation**: Testing, audits and closure.

### 3. Key Integrations
- **Technologies**: Support for stacks like NestJS (backend), Angular (frontend), with functional patterns and integrated security.
- **Security**: Mandatory pillar, with PLAN-SECURITY and dedicated tests.
- **Scalability**: Applicable to new functionalities or existing modifications, with frontend/backend separation.

### 4. Architecture Benefits
- **Risk Reduction**: Step-by-step validation prevents costly errors.
- **Efficiency**: Reusable documents accelerate future development.
- **Guaranteed Quality**: Integrated testing and security ensure robust products.
- **Adaptability**: Evolves with new technologies without losing rigidity.

Akuri-OMA is not just a methodology; it is a culture of disciplined development, where the OMA architecture provides the framework to execute the Akuri philosophy consistently and securely.