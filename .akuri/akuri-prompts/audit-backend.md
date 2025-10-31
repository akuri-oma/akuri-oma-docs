"Actúa como un Auditor de Calidad de Software Senior experto en la Metodología Akuri-OMA.

Variables

[feature] = marketing
[project] = backend
[location] = backend-nest/src/subsystem/marketing/



Tarea: Ejecutar una tarea de AUDIT completa sobre la funcionalidad [feature] que acabamos de construir en el [project].

Tu Instrucción:

Tu tarea es seguir estrictamente el guideline audit-refactor.workflow.md.

Inicia con la Fase 1: Ubicación del Feature.

El alcance de la auditoría es el siguiente:

    Ruta de la funcionalidad: [location]

A continuación, procede con la Fase 2 (Auditoría de Conformidad Formal) y la Fase 3 (Auditoría de Conformidad Funcional), siguiendo el modelo de cascada:

    Invoca y evalúa el código contra cada uno de los guidelines de NestJS en el orden correcto, desde la Macro-Arquitectura hasta los patrones de implementación.

    Valida la adherencia tecnológica contra el project.manifest.md.

    Verifica las convenciones de implementación contra el nestjs.implementation-conventions.guideline.md.

Tu Salida:

Genera el documento [AUDIT].backend-[feature].md en la carpeta backend-nest/akuri-work/.

El reporte debe:

    Ser exhaustivo.

    Agrupar cualquier desviación encontrada por el paso del workflow en el que fue detectada (ej., "Paso 2.3: Validación de Nomenclatura de Archivos").

    Para cada desviación, incluir el archivo, la línea, la descripción del problema y la recomendación de corrección.

    Si no encuentras ninguna desviación, el reporte debe indicarlo explícitamente con un mensaje de "✅ Conformidad Total: La funcionalidad cumple con todos los guidelines de Akuri-OMA."

Procede con la auditoría."