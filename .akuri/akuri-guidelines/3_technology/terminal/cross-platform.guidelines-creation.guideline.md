    
---
trigger: model_decision

description: Guía para el uso compatible del terminal en operaciones de creación de archivos y directorios en entornos Akuri, enfocada en comandos universales para Windows, Linux y macOS, evitando sintaxis específicas de shells para máxima portabilidad.

status: active

linked_files: [] # No se identifican documentos Akuri vinculados directamente en este caso.

use_case: BUILD, DESIGN, PLAN # Relevante al construir estructuras, diseñar carpetas, o planificar operaciones.
---

# Guía para Operaciones de Terminal Multiplataforma (akuri-terminal.cross-platform-terminal-operations.guideline.md)

## 1. Introducción y Propósito

Este documento proporciona pautas esenciales para la interacción con el terminal en la creación de estructuras de archivos y directorios dentro de cualquier proyecto de la Metodología Akuri. Su propósito fundamental es asegurar la **compatibilidad multiplataforma** y la **seguridad operativa**, garantizando que los comandos funcionen de manera consistente en entornos como VSCode, Windows (PowerShell/WSL), Linux y macOS.

**TÚ** debes priorizar la simplicidad y la universalidad de los comandos, evitando sintaxis específicas de shells que puedan generar inconsistencias o fallos en distintos sistemas operativos.

## 2. Estructura y Principios Generales

### 2.1 Principios Fundamentales para Operaciones de Terminal

*   **Compatibilidad Multiplataforma:**
    *   **Evitar sintaxis específicas de Bash:** No utilizar expansiones de corchetes (`{dir1,dir2}`) o características avanzadas de `globbing` (`**/*.ts`) que no son universales.
    *   **Comandos Individuales y Explícitos:** Crear directorios y archivos de uno en uno o en secuencias claras y atómicas.
    *   **Rutas Estándar:** Usar barras inclinadas (`/`) para las rutas, ya que son compatibles con Windows (PowerShell), Linux y macOS.

*   **Operaciones Seguras:**
    *   **Verificar antes de Ejecutar:** Siempre confirmar el directorio actual (`pwd`) y el posible impacto de un comando antes de ejecutarlo.
    *   **Rutas Relativas Claras:** Preferir el prefijo `./` para rutas relativas para evitar ambigüedades.
    *   **Evitar Operaciones Destructivas no Controladas:** Extrema precaución con comandos como `rm`, `del` o cualquier operación de sobreescritura.

### 2.2 Estructura de este Guideline

1.  Introducción y Propósito
2.  Estructura y Principios Generales
3.  Guía para la Creación de Directorios
4.  Guía para Operaciones de Archivos
5.  Guía para Navegación
6.  Mejores Prácticas en la Ejecución de Comandos
7.  Consideraciones Específicas del Entorno
8.  Patrones Comunes a Evitar
9.  Flujo de Trabajo Recomendado
10. Ejemplos en Contexto
11. Migración de Patrones Antiguos
12. Conclusión

## 3. Guía para la Creación de Directorios

### 3.1 ❌ Enfoques Incorrectos (A Evitar)

```bash
# NO USAR: Expansión de llaves de Bash (no compatible en todos los entornos, ej. CMD en Windows)
mkdir -p backend-nest/src/subsytem/product/product-presentation/{controllers,services,models/{dto,response,enums},data}

# NO USAR: Anidamiento complejo de comandos que puede ocultar fallos
mkdir -p dir1 && mkdir -p dir1/subdir1 && mkdir -p dir1/subdir2

  

3.2 ✅ Enfoques Correctos (Recomendado)
Método 1: Comandos Secuenciales y Explícitos

Este método es el más compatible y fácil de depurar.
code Bash

    
# 1. Crear el directorio base principal
mkdir -p backend-nest/src/subsytem/product/product-presentation

# 2. Luego, crear los subdirectorios uno por uno
mkdir -p backend-nest/src/subsytem/product/product-presentation/controllers
mkdir -p backend-nest/src/subsytem/product/product-presentation/services
mkdir -p backend-nest/src/subsytem/product/product-presentation/models
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/dto
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/response
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/enums
mkdir -p backend-nest/src/subsytem/product/product-presentation/data

  

Método 2: Uso de Scripts (Recomendado para Estructuras Complejas y Repetibles)

Para estructuras complejas o que se repiten frecuentemente (ej., al crear nuevos módulos o componentes), encapsular la lógica en un script Shell (.sh o .ps1 para PowerShell) mejora la mantenibilidad y la compatibilidad.
code Bash

    
# Ejemplo de Script para Bash/Zsh (asegurar compatibilidad con `sh` para Windows/WSL)
# Guardar como create_dirs.sh
cat > create_dirs.sh << 'EOF'
#!/bin/sh
# Script de creación de estructura de directorios para el módulo product-presentation

BASE_DIR="backend-nest/src/subsytem/product/product-presentation"

# Crear el directorio base principal
mkdir -p "$BASE_DIR"

# Crear subdirectorios individualmente
mkdir -p "$BASE_DIR/controllers"
mkdir -p "$BASE_DIR/services"
mkdir -p "$BASE_DIR/models" # Asegurar que 'models' exista antes de sus subdirectorios
mkdir -p "$BASE_DIR/models/dto"
mkdir -p "$BASE_DIR/models/response"
mkdir -p "$BASE_DIR/models/enums"
mkdir -p "$BASE_DIR/data"

echo "Estructura de directorios creada exitosamente en: $BASE_DIR"
EOF

# Hacer el script ejecutable y ejecutarlo
chmod +x create_dirs.sh
./create_dirs.sh

  

Método 3: Interfaz Gráfica (VSCode/Cursor File Explorer)

Para tareas de creación puntuales o estructuras menos repetitivas, utilizar la interfaz gráfica del explorador de archivos del IDE (VSCode o Cursor) es una opción segura y compatible.

    Navegar al directorio deseado en el explorador de archivos.

    Hacer clic derecho → "Nueva Carpeta" para cada directorio necesario.

    Esto garantiza la compatibilidad y proporciona confirmación visual.

4. Guía para Operaciones de Archivos
4.1 Creación de Archivos
code Bash

    
# ✅ Correcto: Crear archivos de forma individual
touch backend-nest/src/subsytem/product/product-presentation/product-presentation.module.ts

# ❌ Incorrecto: Creación de múltiples archivos a la vez (puede no funcionar en todos los shells o versiones)
touch file1.ts file2.ts file3.ts

  

4.2 Permisos de Archivos

Siempre establecer permisos explícitamente cuando sea necesario, especialmente para scripts.
code Bash

    
# ✅ Correcto: Establecer permisos de forma explícita y comprensible
chmod 644 script.sh  # Lectura/escritura para el propietario, solo lectura para otros
chmod 755 script.sh  # Permiso de ejecución para todos los usuarios

# ❌ Incorrecto: Asumir permisos por defecto que pueden no ser los deseados o seguros

  

5. Guía para Navegación
5.1 Cambios de Directorio
code Bash

    
# ✅ Correcto: Usar rutas absolutas cuando sea posible para evitar ambigüedades
cd /full/path/to/project/backend-nest

# ✅ Correcto: Usar rutas relativas con verificación
cd ./backend-nest
pwd # Verificar la ubicación actual después de un cambio

# ❌ Incorrecto: Asumir la ubicación actual sin verificación, puede llevar a errores
cd backend-nest # Podría fallar si no se está en el directorio esperado

  

5.2 Verificación de Rutas y Existencia

Siempre verifica la ubicación y la existencia de elementos antes de realizar operaciones críticas.
code Bash

    
# Siempre verificar la ubicación actual antes de cualquier operación
pwd
ls -la # Listar contenido del directorio actual

# Verificar si un directorio existe antes de intentar crearlo o interactuar con él
if [ ! -d "backend-nest/src" ]; then
    echo "Error: El directorio 'backend-nest/src' no existe."
    exit 1
fi

  

6. Mejores Prácticas en la Ejecución de Comandos
6.1 Manejo de Errores

Asegurar que los comandos manejen posibles fallos para evitar ejecuciones inesperadas.
code Bash

    
# ✅ Correcto: Verificar el éxito del comando y reaccionar ante fallos
mkdir -p some/dir || echo "Error: Falló la creación del directorio 'some/dir'."

# ✅ Correcto: Usar '&&' para encadenar comandos que dependen del éxito del anterior
mkdir -p some/dir && cd some/dir && echo "Directorio creado y navegado exitosamente."

  

6.2 Encadenamiento de Comandos

Mantener las cadenas de comandos simples y claras.
code Bash

    
# ✅ Correcto: Encadenamiento simple con un propósito claro
cd backend-nest && npm install

# ❌ Incorrecto: Cadenas complejas que pueden ocultar errores en pasos intermedios
cd backend-nest && npm install && npm run build && npm test
# (Es mejor dividir esto en pasos separados con verificaciones)

  

6.3 Comandos Largos

Mejorar la legibilidad de comandos largos.
code Bash

    
# ✅ Correcto: Dividir comandos largos usando la barra invertida para mayor legibilidad
npm run command \
    --param1 value1 \
    --param2 value2 \
    --another-option

# ✅ Correcto: Usar variables para comandos complejos y reutilizables
COMMAND="npm run build --prod --output-path=dist"
eval "$COMMAND" # 'eval' ejecuta el contenido de la variable como un comando

  

7. Consideraciones Específicas del Entorno
7.1 Compatibilidad con Windows

    Barras Inclinadas en Rutas: Usar siempre barras inclinadas (/) en las rutas (ej., /c/projects/backend-nest). Esto funciona tanto en shells tipo Unix (Git Bash, WSL) como en PowerShell.

    Evitar Comandos Específicos de Unix:

        ❌ Incorrecto: grep, sed, awk (pueden no estar disponibles en instalaciones por defecto de Windows).

        ✅ Correcto: Utilizar alternativas basadas en Node.js (scripts), Python o herramientas de PowerShell para la manipulación de texto.

7.2 Integración con Terminal de VSCode/Cursor

    Salida Clara: Los comandos se ejecutan en el terminal integrado. Asegurarse de que los mensajes de salida sean claros y descriptivos, ya que la salida puede ser capturada o filtrada por el IDE.

    Evitar Comandos Interactivos: Preferir versiones no interactivas de comandos que requieren entrada del usuario, ya que la interacción puede ser incómoda o no compatible con la automatización.

8. Patrones Comunes a Evitar
8.1 Características Específicas de Bash

    ❌ Expansión de llaves: echo {1..5}

    ❌ Sustitución de comandos con backticks: `command` (preferir $(command) si es estrictamente necesario y se verifica la compatibilidad).

    ❌ Globbing avanzado: ls **/*.ts (no universal).

8.2 Comandos Solo para Unix

    ❌ Pueden no funcionar en Windows: grep "pattern" file.txt, sed 's/old/new/' file.txt, awk '{print $1}' file.txt.

    ✅ Alternativas multiplataforma: Usar scripts de Node.js/Python para manipulación de archivos, o el entorno WSL en Windows.

8.3 Comandos Interactivos

    ❌ Comandos que esperan entrada del usuario: git commit (sin flag -m), npm init (modo interactivo).

    ✅ Alternativas no interactivas: git commit -m "mensaje", npm init --yes.

9. Flujo de Trabajo Recomendado
9.1 Para la Creación de Estructuras de Directorios

    Planificar la Estructura: Trazar la estructura de directorios deseada (en un archivo de texto, comentarios o mentalmente).

    Crear Directorios Padres: Usar mkdir -p para crear los directorios padres principales.

    Crear Subdirectorios Secuencialmente: Crear los subdirectorios nivel por nivel o individualmente.

    Verificar la Creación: Utilizar ls -la o el explorador de archivos del IDE para confirmar la estructura.

    Crear Archivos: Crear archivos individualmente según sea necesario.

9.2 Para Operaciones Complejas y Repetibles

    Escribir un Script: Desarrollar un script (.sh o .ps1) para encapsular la lógica de operaciones complejas o repetibles.

    Probar el Script: Ejecutar el script en un entorno seguro y verificar su comportamiento en todas las plataformas objetivo (si es posible).

    Documentar el Script: Añadir comentarios claros al script explicando su propósito, parámetros y cualquier consideración especial.

    Control de Versiones: Mantener los scripts bajo control de versiones (git) junto con el código del proyecto.

10. Ejemplos en Contexto
10.1 Creación de Estructura de Módulos (Enfoque Recomendado)

Este ejemplo muestra la creación de un módulo product-offer utilizando el método secuencial.
code Bash

    
# 1. Navegar a la raíz del proyecto
cd /path/to/project

# 2. Crear el directorio base del nuevo módulo
mkdir -p backend-nest/src/subsytem/product/product-offer

# 3. Crear los subdirectorios secuencialmente
mkdir -p backend-nest/src/subsytem/product/product-offer/controllers
mkdir -p backend-nest/src/subsytem/product/product-offer/services
mkdir -p backend-nest/src/subsytem/product/product-offer/models
mkdir -p backend-nest/src/subsytem/product/product-offer/models/dto
mkdir -p backend-nest/src/subsytem/product/product-offer/models/response
mkdir -p backend-nest/src/subsytem/product/product-offer/models/enums
mkdir -p backend-nest/src/subsytem/product/product-offer/data

# 4. Verificar la estructura creada
ls -la backend-nest/src/subsytem/product/product-offer/

  

10.2 Operaciones Seguras de Archivos
code Bash

    
# 1. Crear archivos individualmente
touch backend-nest/src/subsytem/product/product-offer/product-offer.module.ts
touch backend-nest/src/subsytem/product/product-offer/controllers/product-offer.controller.ts
touch backend-nest/src/subsytem/product/product-offer/services/product-offer.service.ts

# 2. Verificar los resultados
ls -la backend-nest/src/subsytem/product/product-offer/controllers/
ls -la backend-nest/src/subsytem/product/product-offer/services/

  

11. Migración de Patrones Antiguos

Si TÚ, o un usuario, encuentran scripts o documentación que utilizan patrones no compatibles (ej., sintaxis específica de Bash):

    Identificar los Comandos Problemáticos: Reconocer las partes del script que utilizan sintaxis no multiplataforma.

    Reemplazar con Operaciones Individuales: Sustituir los comandos problemáticos por las alternativas secuenciales o basadas en scripts que cumplen con estas pautas.

    Probar en Plataformas Objetivo: Ejecutar el script o los comandos actualizados en las diferentes plataformas (Windows, Linux, macOS) para confirmar su correcto funcionamiento.

    Actualizar Documentación: Asegurar que cualquier documentación o guideline que haga referencia a estos patrones sea también actualizada.

12. Conclusión

Seguir estas pautas asegura que las operaciones del terminal sean consistentes y confiables en todos los entornos de desarrollo Akuri. Cuando haya dudas, TÚ debes preferir comandos simples e individuales sobre sintaxis complejas o específicas de shells. Siempre TÚ debes probar los comandos en el entorno de destino antes de depender de ellos en scripts o documentación.

Recordatorio: El objetivo es lograr operaciones fiables y mantenibles que funcionen para todo el equipo de desarrollo, no atajos ingeniosos que solo son funcionales en sistemas específicos.
