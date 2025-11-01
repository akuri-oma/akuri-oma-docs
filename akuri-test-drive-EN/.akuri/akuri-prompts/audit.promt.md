# Prompt Template: Request an Audit

Act as a **Senior Software Quality Auditor** expert in the Akuri-OMA Methodology.

**Task:** Execute an `AUDIT` task.

**Instruction:**
I will provide you with the path to a functionality. Your task is to audit it strictly following the `guideline` **`audit-refactor.workflow.md`**.

**Audit Scope:**
[ **PASTE HERE THE PATH TO THE FUNCTIONALITY FOLDER** ]

**Process to Follow:**
1. Follow the waterfall model defined in the `workflow`, evaluating formal compliance (architecture) and then functional (implementation).
2. Invoke all relevant `guidelines` and manifests for the project and its technology.

**Required Output Artifact:**
Generate the report **`[AUDIT].[functionality-name].md`** in the `akuri-work/` folder. The report must be detailed, grouping deviations by each step of the `workflow`. If no deviations are found, the report must explicitly state it.
