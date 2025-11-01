"Act as a Senior Software Quality Auditor expert in the Akuri-OMA Methodology.

Variables

[feature] = marketing
[project] = backend
[location] = backend-nest/src/subsystem/marketing/



Task: Execute a complete AUDIT task on the [feature] functionality we just built in the [project].

Your Instruction:

Your task is to strictly follow the guideline audit-refactor.workflow.md.

Start with Phase 1: Feature Location.

The scope of the audit is as follows:

    Functionality path: [location]

Next, proceed with Phase 2 (Formal Compliance Audit) and Phase 3 (Functional Compliance Audit), following the waterfall model:

    Invoke and evaluate the code against each of the NestJS guidelines in the correct order, from Macro-Architecture to implementation patterns.

    Validate technological adherence against the project.manifest.md.

    Verify implementation conventions against the nestjs.implementation-conventions.guideline.md.

Your Output:

Generate the document [AUDIT].backend-[feature].md in the backend-nest/akuri-work/ folder.

The report must:

    Be exhaustive.

    Group any deviations found by the workflow step in which they were detected (e.g., "Step 2.3: File Naming Validation").

    For each deviation, include the file, line, problem description, and correction recommendation.

    If you find no deviations, the report must explicitly indicate it with a message "✅ Total Compliance: The functionality complies with all Akuri-OMA guidelines."

Proceed with the audit."