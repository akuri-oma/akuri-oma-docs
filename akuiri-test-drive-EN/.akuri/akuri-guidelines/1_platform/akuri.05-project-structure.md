---

trigger: always_on
description: Defines the standard project structure in the Akuri-oma Methodology, including the organization of the .akuri folder and its subfolders.
status: active
---

# Standard Akuri Project Structure

## 1. .akuri Folder

Each project must contain a `.akuri` folder with the following structure:

### akuri-docs/
- Project-specific documentation
- User manuals
- Architecture diagrams

### akuri-guidelines/
- Implementation guides specific to the project
- Architectural patterns
- Code conventions

### akuri-history/
- Change history
- Technical decision records
- Development logs

### akuri-manifest/
- Project manifest
- Technologies and dependencies
- Technical restrictions

### akuri-prompts/
- Initial project prompts
- Functional requirements
- Use cases

### akuri-work/
- Work in progress
- Temporary documents
- Drafts

### akuri-tasks/
- Task lists
- Issue tracking
- Planning

## 2. Initialization Flow

1. Create the base project structure
2. Initialize the `.akuri` folder with standard subfolders
3. Create the minimum initial documents:
   - `project.manifest.md`
   - `project.guideline.md`
   - `project.history.md`
4. Integrate the project with the platform manifest

## 3. Base Templates

Minimum templates for each document type will be provided in the `.akuri/templates/` folder.

## 4. akuri-specs Folder per Functionality

Each functionality or module of the project (e.g., `src/modules/property`, `src/modules/product`) must include a dedicated subfolder called `akuri-specs`. As an Akuri Agent, I am responsible for creating this folder if it does not exist when starting work on a specific functionality.

### Purpose
- Centralize the "living" documents related to that functionality while interacting with it.
- Facilitate quick access to references during tasks like BUILD, REFACTOR, AUDIT, or DEBUG, allowing traceability and subsequent auditing.
- Maintain a local record in the functionality to avoid information loss, complementing the optional use of `.akuri/akuri-history/`.

### Recommended Content
- `[INVENTORY]...md`: List of features and functional requirements.
- `[PLAN]...md`: Technical blueprint and construction plan.
- `[TRACKER]...md`: Task tracking during BUILD or REFACTOR.
- Other living documents: Temporary specifications, design notes, or any artifact generated during the process (e.g., CONCEPT, REQUIREMENT).

### Workflow
1. When starting work on a functionality, create or verify `akuri-specs` and store active documents.
2. Keep documents in `akuri-specs` while the functionality is in development or modification.
3. Archiving documents in `.akuri/akuri-history/` is optional and at the developer's discretion; there is no automatic process that requires removing them from `akuri-specs`.

### Structure Example
```
src/modules/property/
├── akuri-specs/
│   ├── [INVENTORY] property-features.md
│   └── [PLAN] property-blueprint.md
├── controllers/
├── services/
└── models/
```

This reinforces organization by functionality and improves project maintainability.