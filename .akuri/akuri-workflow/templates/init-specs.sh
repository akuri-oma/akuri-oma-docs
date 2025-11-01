#!/bin/sh
# Script de inicialización para nuevas funcionalidades en akuri-specs
# Uso: ./init-specs.sh [funcionalidad-kebab-case]

set -e  # Salir en caso de error

# Verificar argumentos
if [ $# -ne 1 ]; then
    echo "Uso: $0 [funcionalidad-kebab-case]"
    echo "Ejemplo: $0 product-management"
    exit 1
fi

FUNCIONALIDAD="$1"
SPECS_DIR=".akuri/akuri-specs"
SUBDIR="$SPECS_DIR/$FUNCIONALIDAD"

# Verificar que estamos en el directorio correcto
if [ ! -d ".akuri" ]; then
    echo "Error: No se encuentra la carpeta .akuri. Ejecutar desde la raíz del proyecto."
    exit 1
fi

# Verificar si ya existe la subcarpeta
if [ -d "$SUBDIR" ]; then
    echo "La funcionalidad '$FUNCIONALIDAD' ya existe en $SUBDIR"
    echo "Usando documentos existentes..."
    ls -la "$SUBDIR"
    exit 0
fi

echo "Inicializando funcionalidad: $FUNCIONALIDAD"

# Crear subcarpeta
mkdir -p "$SUBDIR"

# Crear documentos base usando templates
echo "Creando documentos base..."

# REQUIREMENT
if [ -f ".akuri/akuri-workflow/templates/requirement.template.md" ]; then
    cp ".akuri/akuri-workflow/templates/requirement.template.md" \
       "$SUBDIR/[REQUIREMENT].$FUNCIONALIDAD.md"
    echo "✓ [REQUIREMENT].$FUNCIONALIDAD.md creado"
else
    touch "$SUBDIR/[REQUIREMENT].$FUNCIONALIDAD.md"
    echo "# [REQUIREMENT] $FUNCIONALIDAD" > "$SUBDIR/[REQUIREMENT].$FUNCIONALIDAD.md"
    echo "✓ [REQUIREMENT].$FUNCIONALIDAD.md creado (sin template)"
fi

# DESIGN
if [ -f ".akuri/akuri-workflow/templates/design.template.md" ]; then
    cp ".akuri/akuri-workflow/templates/design.template.md" \
       "$SUBDIR/[DESIGN].$FUNCIONALIDAD.md"
    echo "✓ [DESIGN].$FUNCIONALIDAD.md creado"
else
    touch "$SUBDIR/[DESIGN].$FUNCIONALIDAD.md"
    echo "# [DESIGN] $FUNCIONALIDAD" > "$SUBDIR/[DESIGN].$FUNCIONALIDAD.md"
    echo "✓ [DESIGN].$FUNCIONALIDAD.md creado (sin template)"
fi

# PLAN
touch "$SUBDIR/[PLAN].$FUNCIONALIDAD.md"
echo "# [PLAN] $FUNCIONALIDAD" > "$SUBDIR/[PLAN].$FUNCIONALIDAD.md"
echo "✓ [PLAN].$FUNCIONALIDAD.md creado"

# TRACKER
touch "$SUBDIR/[TRACKER].$FUNCIONALIDAD.md"
cat > "$SUBDIR/[TRACKER].$FUNCIONALIDAD.md" << EOF
---
trigger: build
description: Seguimiento de progreso para la funcionalidad $FUNCIONALIDAD
status: active
---

# [TRACKER] $FUNCIONALIDAD

## Estado General
- **Inicio:** $(date +%Y-%m-%d)
- **Modo:** DICTATORIAL
- **Progreso:** 0% completado

## Checklist de Tareas
- [ ] Definir REQUIREMENT completo
- [ ] Crear DESIGN aprobado
- [ ] Desarrollar PLAN detallado
- [ ] Ejecutar BUILD con seguimiento
- [ ] Completar testing
- [ ] Validar criterios de aceptación

## Notas
Funcionalidad inicializada. Comenzar con REQUIREMENT.
EOF
echo "✓ [TRACKER].$FUNCIONALIDAD.md creado"

echo ""
echo "Funcionalidad '$FUNCIONALIDAD' inicializada exitosamente en $SUBDIR"
echo ""
echo "Documentos creados:"
ls -la "$SUBDIR"
echo ""
echo "Próximo paso: Editar [REQUIREMENT].$FUNCIONALIDAD.md con los requisitos específicos"