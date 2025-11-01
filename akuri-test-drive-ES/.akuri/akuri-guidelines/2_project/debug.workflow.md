---
trigger: model_decision
description: Guideline orquestador que define el flujo de trabajo de DEBUG. Detalla el proceso sistemático para diagnosticar y resolver errores, diferenciando entre errores de compilación/sintaxis y errores de lógica/comportamiento.
status: active
use_case: DEBUG_BASIC, DEBUG_ADVANCED
---

# Flujo de Trabajo de Depuración (debug.workflow.md)

## 1. Introducción y Principio Fundamental

Este documento define el flujo de trabajo sistemático que TÚ, como Agente Akuri, debes seguir para diagnosticar y resolver errores (`DEBUG`).

El principio fundamental es: **"Una arquitectura conforme es el primer paso para un código sin errores."** Antes de buscar un error de lógica, TÚ debes asegurar que el código se adhiere a la arquitectura establecida, ya que muchas fallas de comportamiento se originan en desviaciones estructurales.

## 2. El Flujo de Trabajo de Depuración

### Fase 1: Triaje y Clasificación del Error (`CLARIFY`)

Tu primera acción es entender la naturaleza del error.

1.  **Recopilar Información del Usuario:**
    *   **Preguntas Clave:**
        *   "Por favor, proporciona el **mensaje de error exacto** y, si es posible, el `stack trace` completo que aparece en la consola."
        *   "¿En qué archivo(s) y línea(s) se reporta el error?"
        *   "Describe los **pasos para reproducir** el error. ¿Qué estabas intentando hacer cuando ocurrió?"
        *   "¿Cuál era el **comportamiento esperado** y cuál fue el **comportamiento real**?"

2.  **Clasificar el Error:** Basado en la respuesta, TÚ clasificarás el problema en una de dos categorías:
    *   **Error de Compilación/Sintaxis:** El código no compila o falla al arrancar. La consola muestra errores claros sobre sintaxis, tipos, importaciones faltantes, etc.
    *   **Error de Lógica/Comportamiento:** El código compila y se ejecuta, pero no hace lo que se espera.

### Fase 2: Diagnóstico de Errores de Compilación/Sintaxis

Estos errores suelen ser una "lista de tareas" proporcionada por el compilador.

1.  **Análisis de la Consola:** TÚ analizarás la lista de errores de la consola.
2.  **Solución Iterativa (Modelo Cascada):**
    *   **Acción:** TÚ abordarás los errores **uno por uno, desde el primero de la lista hacia abajo**.
    *   **Razonamiento:** Explica al usuario: "A menudo, corregir un error inicial (como una importación incorrecta) soluciona muchos de los errores subsiguientes en cascada."
    *   **Ciclo de Corrección:**
        a.  Identifica el primer error.
        b.  Propón la corrección.
        c.  Simula (o solicita) una nueva compilación.
        d.  Re-analiza la nueva lista de errores.
        e.  Repite hasta que no queden errores.

### Fase 3: Diagnóstico de Errores de Lógica/Comportamiento

Estos errores son más complejos y requieren un enfoque más profundo, siguiendo el principio de "arquitectura primero".

1.  **Paso 3.1: Mini-Auditoría de Conformidad Arquitectónica (Opcional pero Recomendado):**
    *   **Objetivo:** Descartar que el error se deba a una desviación arquitectónica.
    *   **Acción:** Realiza una versión rápida del `audit.workflow.md` en la funcionalidad afectada, enfocándote en:
        *   **Nomenclatura y Ubicación de Archivos:** ¿Están los archivos donde deberían?
        *   **Estructura de Servicios (Frontend):** ¿Se respeta la separación `API`/`Action`/`State`?
        *   **Patrón de Controlador Delgado (Backend):** ¿La lógica está en el servicio?
    *   **Comunicación:** "Antes de depurar la lógica, realizaré una rápida auditoría para asegurar que la estructura del código es correcta, ya que esto a menudo revela la causa raíz de problemas de comportamiento."

2.  **Paso 3.2: Análisis de Flujo de Datos ("Seguir la Pista"):**
    *   **Objetivo:** Trazar el flujo de datos desde la entrada del usuario hasta el punto donde el comportamiento diverge de lo esperado.
    *   **Acción (Frontend):**
        a.  Empieza en el **componente de `Presentation`**: ¿El evento de usuario (`click`, `submit`) llama correctamente al método del `Action Service`?
        b.  Ve al **`Action Service`**: ¿Se actualiza el estado `isLoading`? ¿Se llama al `API Service` con los parámetros correctos?
        c.  Ve al **`API Service`**: ¿La petición HTTP se construye correctamente?
        d.  Analiza la **respuesta del `API Service`**: ¿El `Action Service` maneja correctamente el `next` (éxito) y el `error`?
        e.  Ve al **`State Service`**: ¿El estado se actualiza con los datos correctos?
        f.  Vuelve al **componente de `Presentation`**: ¿Se suscribe correctamente al `State` y renderiza los datos esperados?
    *   **Acción (Backend):** Sigue un flujo similar desde el `Controller` -> `Service` -> `Repository/Base de Datos` y de vuelta.

3.  **Paso 3.3: Formulación de Hipótesis y Propuesta de Solución:**
    *   **Acción:** Basado en el análisis de flujo, TÚ formularás una hipótesis sobre la causa del error. (ej., "Mi hipótesis es que el `Action Service` no está manejando el caso de error de la API, por lo que el estado `isLoading` nunca se resetea a `false`").
    *   **Propuesta:** Propón la modificación de código específica para solucionar el problema.

### Fase 4: Implementación de la Corrección y Verificación

1.  **Aplicar el Cambio:** Una vez que el usuario apruebe la solución, TÚ aplicarás la corrección.
2.  **Verificación:** TÚ debes proponer o describir los pasos para verificar que la corrección no solo ha solucionado el problema original, sino que no ha introducido nuevos errores (pruebas de regresión).