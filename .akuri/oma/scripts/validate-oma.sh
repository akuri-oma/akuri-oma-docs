#!/bin/bash
# Script de validación OMA para proyectos Akuri
# Valida nomenclatura, estructura y cumplimiento de estándares OMA

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función de logging
log() {
    echo -e "${BLUE}[OMA-VALIDATOR]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Verificar si estamos en un proyecto válido
check_project_structure() {
    log "Verificando estructura del proyecto..."

    if [ ! -d ".akuri" ]; then
        error "No se encuentra carpeta .akuri. ¿Estás en la raíz del proyecto?"
        exit 1
    fi

    if [ ! -d ".akuri/oma" ]; then
        warning "No se encuentra documentación OMA. Se recomienda crear .akuri/oma/"
    fi

    success "Estructura del proyecto válida"
}

# Detectar framework
detect_framework() {
    log "Detectando framework del proyecto..."

    if [ -f "angular.json" ]; then
        FRAMEWORK="angular"
        SRC_DIR="src"
        success "Framework detectado: Angular"
    elif [ -f "nest-cli.json" ] || [ -f "src/main.ts" ]; then
        FRAMEWORK="nestjs"
        SRC_DIR="src"
        success "Framework detectado: NestJS"
    elif [ -f "pubspec.yaml" ]; then
        FRAMEWORK="flutter"
        SRC_DIR="lib"
        success "Framework detectado: Flutter"
    else
        warning "Framework no detectado automáticamente. Usando validaciones genéricas."
        FRAMEWORK="unknown"
        SRC_DIR="src"
    fi
}

# Validar nomenclatura de archivos
validate_naming() {
    log "Validando nomenclatura de archivos..."

    local total_files=0
    local valid_files=0
    local invalid_files=0

    # Encontrar archivos de código
    case $FRAMEWORK in
        "angular")
            find $SRC_DIR -type f \( -name "*.ts" -o -name "*.html" -o -name "*.scss" \) | while read file; do
                validate_angular_file "$file"
            done
            ;;
        "nestjs")
            find $SRC_DIR -type f -name "*.ts" | while read file; do
                validate_nestjs_file "$file"
            done
            ;;
        "flutter")
            find $SRC_DIR -type f -name "*.dart" | while read file; do
                validate_flutter_file "$file"
            done
            ;;
        *)
            warning "Validación de nomenclatura genérica - implementa validación específica"
            ;;
    esac
}

# Validar archivo Angular
validate_angular_file() {
    local file="$1"
    local filename=$(basename "$file")
    local extension="${filename##*.}"
    local name_without_ext="${filename%.*}"

    ((total_files++))

    # Patrón OMA: [feature].[description].[type]
    if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
        ((valid_files++))
    else
        error "Nombre inválido (no sigue patrón OMA): $file"
        ((invalid_files++))
    fi
}

# Validar archivo NestJS
validate_nestjs_file() {
    local file="$1"
    local filename=$(basename "$file")
    local name_without_ext="${filename%.*}"

    ((total_files++))

    # Patrón OMA: [feature].[description].[type]
    if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
        ((valid_files++))
    else
        error "Nombre inválido (no sigue patrón OMA): $file"
        ((invalid_files++))
    fi
}

# Validar archivo Flutter
validate_flutter_file() {
    local file="$1"
    local filename=$(basename "$file")
    local name_without_ext="${filename%.*}"

    ((total_files++))

    # Patrón OMA: [feature].[description].[type]
    if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
        ((valid_files++))
    else
        error "Nombre inválido (no sigue patrón OMA): $file"
        ((invalid_files++))
    fi
}

# Validar estructura de carpetas
validate_structure() {
    log "Validando estructura de carpetas..."

    case $FRAMEWORK in
        "angular")
            validate_angular_structure
            ;;
        "nestjs")
            validate_nestjs_structure
            ;;
        "flutter")
            validate_flutter_structure
            ;;
        *)
            warning "Validación de estructura genérica"
            ;;
    esac
}

# Validar estructura Angular
validate_angular_structure() {
    # Verificar carpetas principales
    local required_dirs=("app" "assets" "environments")
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$SRC_DIR/$dir" ]; then
            warning "Carpeta requerida faltante: $SRC_DIR/$dir"
        fi
    done

    # Verificar features tienen estructura OMA
    if [ -d "$SRC_DIR/app/features" ]; then
        find "$SRC_DIR/app/features" -mindepth 1 -maxdepth 1 -type d | while read feature_dir; do
            validate_feature_structure "$feature_dir"
        done
    fi
}

# Validar estructura NestJS
validate_nestjs_structure() {
    # Verificar carpetas principales
    local required_dirs=("modules" "common" "config")
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$SRC_DIR/$dir" ]; then
            warning "Carpeta requerida faltante: $SRC_DIR/$dir"
        fi
    done

    # Verificar módulos tienen estructura OMA
    if [ -d "$SRC_DIR/modules" ]; then
        find "$SRC_DIR/modules" -mindepth 1 -maxdepth 1 -type d | while read module_dir; do
            validate_feature_structure "$module_dir"
        done
    fi
}

# Validar estructura Flutter
validate_flutter_structure() {
    # Verificar carpetas principales
    local required_dirs=("models" "providers" "screens" "widgets" "services")
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$SRC_DIR/$dir" ]; then
            warning "Carpeta requerida faltante: $SRC_DIR/$dir"
        fi
    done

    # Verificar features tienen estructura OMA
    if [ -d "$SRC_DIR/features" ]; then
        find "$SRC_DIR/features" -mindepth 1 -maxdepth 1 -type d | while read feature_dir; do
            validate_feature_structure "$feature_dir"
        done
    fi
}

# Validar estructura de un feature específico
validate_feature_structure() {
    local feature_dir="$1"
    local feature_name=$(basename "$feature_dir")

    # Verificar si sigue convención kebab-case
    if [[ ! $feature_name =~ ^[a-z]+(-[a-z]+)*$ ]]; then
        warning "Nombre de feature no sigue kebab-case: $feature_name"
    fi

    # Verificar archivos base
    case $FRAMEWORK in
        "angular")
            local required_files=("$feature_name.module.ts" "$feature_name-routing.module.ts")
            ;;
        "nestjs")
            local required_files=("$feature_name.module.ts" "$feature_name.service.ts")
            ;;
        "flutter")
            local required_files=("$feature_name.provider.dart")
            ;;
    esac

    for file in "${required_files[@]}"; do
        if [ ! -f "$feature_dir/$file" ]; then
            warning "Archivo requerido faltante en $feature_name: $file"
        fi
    done
}

# Generar reporte
generate_report() {
    log "Generando reporte de validación..."

    echo "========================================"
    echo "REPORTE DE VALIDACIÓN OMA"
    echo "========================================"
    echo "Framework detectado: $FRAMEWORK"
    echo "Directorio fuente: $SRC_DIR"
    echo "Archivos validados: $total_files"
    echo "Archivos válidos: $valid_files"
    echo "Archivos inválidos: $invalid_files"
    echo "========================================"

    if [ $invalid_files -eq 0 ]; then
        success "¡Todas las validaciones pasaron exitosamente!"
    else
        error "Se encontraron $invalid_files archivos con problemas de nomenclatura"
        echo "Ejecuta el script con --fix para intentar correcciones automáticas"
    fi
}

# Función principal
main() {
    echo "========================================"
    echo "VALIDADOR OMA - Metodología Akuri"
    echo "========================================"

    check_project_structure
    detect_framework
    validate_naming
    validate_structure
    generate_report

    echo ""
    success "Validación OMA completada"
}

# Ejecutar función principal
main "$@"