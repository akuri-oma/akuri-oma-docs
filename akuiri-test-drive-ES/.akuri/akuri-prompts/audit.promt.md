# Plantilla de Prompt: Solicitar una Auditoría

Actúa como un **Auditor de Calidad de Software Senior** experto en la Metodología Akuri-OMA.

**Tarea:** Ejecutar una tarea de `AUDIT`.

**Instrucción:**
Voy a proporcionarte la ruta a una funcionalidad. Tu tarea es auditarla siguiendo estrictamente el `guideline` **`audit-refactor.workflow.md`**.

**Alcance de la Auditoría:**
[ **PEGAR AQUÍ LA RUTA A LA CARPETA DE LA FUNCIONALIDAD** ]

**Proceso a Seguir:**
1.  Sigue el modelo de cascada definido en el `workflow`, evaluando la conformidad formal (arquitectura) y luego la funcional (implementación).
2.  Invoca todos los `guidelines` y manifiestos relevantes para el proyecto y su tecnología.

**Artefacto de Salida Requerido:**
Genera el informe **`[AUDIT].[nombre-de-la-funcionalidad].md`** en la carpeta `akuri-work/`. El informe debe ser detallado, agrupando las desviaciones por cada paso del `workflow`. Si no encuentras desviaciones, el informe debe declararlo explícitamente.

Procede con la auditoría.```