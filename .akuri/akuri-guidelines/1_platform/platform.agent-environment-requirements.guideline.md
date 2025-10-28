    
---
trigger: always_on
description: Define los requisitos mínimos del entorno de ejecución (máquina local o CI/CD) para que el Agente Akuri pueda operar correctamente.
status: active
---

# Requisitos del Entorno de Ejecución del Agente Akuri

## 1. Propósito

Este documento define los requisitos técnicos mínimos que debe cumplir cualquier entorno (máquina de desarrollador, servidor de integración continua, etc.) para garantizar el correcto funcionamiento del Agente Akuri.

El Agente Akuri depende de ciertas herramientas de línea de comandos estándar para interactuar con el sistema de archivos y ejecutar tareas. La ausencia de estas herramientas causará fallos en la ejecución.

## 2. Requisitos Mínimos del Entorno de Ejecución

### 2.1 Shell

-   **Requerimiento:** Una shell compatible con POSIX.
-   **Verificación:** `sh` debe estar disponible en el `PATH` del sistema.

### 2.2 Sistema de Control de Versiones

-   **Requerimiento:** Git.
-   **Verificación:** El comando `git` debe estar disponible. Ejecutar `git --version` debe devolver una versión válida.

### 2.3 Intérprete de Python

-   **Requerimiento:** Python 3.x.
-   **Problema Común:** El agente invoca al intérprete usando el comando `python`. En muchos sistemas, el ejecutable de Python 3 está instalado como `python3`.
-   **Solución Obligatoria:** Debe existir un ejecutable o un enlace simbólico llamado `python` en el `PATH` del sistema que apunte a una instalación de Python 3.

## 3. Procedimiento de Verificación y Configuración

Antes de iniciar una sesión de trabajo con el Agente Akuri, el usuario debe verificar que su entorno cumple con los requisitos.

**Comando de Verificación de Python:**
```bash
python --version

  

    Resultado Esperado: Muestra una versión de Python 3.x (ej. Python 3.9.6).

    Si falla con python: not found: Ejecute los siguientes comandos para crear un enlace simbólico:
    code Bash

        
    # 1. Encuentra la ruta de python3
    which python3

    # 2. Crea el enlace (reemplaza la ruta si es diferente)
    #    Puede requerir 'sudo'
    ln -s /usr/bin/python3 /usr/local/bin/python

      