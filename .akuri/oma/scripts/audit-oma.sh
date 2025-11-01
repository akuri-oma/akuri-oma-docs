#!/bin/bash
# Script de auditoría OMA para proyectos Akuri
# Realiza auditoría completa de cumplimiento OMA por pilares

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Función de logging
log() {
    echo -e "${BLUE}[OMA-AUDITOR]${NC} $1"
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

info() {
    echo -e "${PURPLE}[INFO]${NC} $1"
}

# Variables globales
FRAMEWORK=""
SRC_DIR=""
REPORT_FILE="oma-audit-report-$(date +%Y%m%d-%H%M%S).md"

# Detectar framework
detect_framework() {
    log "Detectando framework del proyecto..."

    if [ -f "angular.json" ]; then
        FRAMEWORK="angular"
        SRC_DIR="src"
    elif [ -f "nest-cli.json" ] || [ -f "src/main.ts" ]; then
        FRAMEWORK="nestjs"
        SRC_DIR="src"
    elif [ -f "pubspec.yaml" ]; then
        FRAMEWORK="flutter"
        SRC_DIR="lib"
    else
        FRAMEWORK="unknown"
        SRC_DIR="src"
    fi

    info "Framework detectado: $FRAMEWORK"
    info "Directorio fuente: $SRC_DIR"
}

# Inicializar reporte
init_report() {
    cat > "$REPORT_FILE" << EOF
# Reporte de Auditoría OMA
**Fecha:** $(date)
**Framework:** $FRAMEWORK
**Proyecto:** $(basename "$(pwd)")

## Resumen Ejecutivo

## Detalle por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
**Estado:** ⏳ Evaluando...

### Pilar 2: Desacoplamiento/Modularidad
**Estado:** ⏳ Evaluando...

### Pilar 3: Bus de Datos/Orquestación
**Estado:** ⏳ Evaluando...

### Pilar 4: Features Globales
**Estado:** ⏳ Evaluando...

### Pilar 5: Protocolo de Inicialización/Finalización
**Estado:** ⏳ Evaluando...

### Pilar 6: Manejo Centralizado de Estado
**Estado:** ⏳ Evaluando...

## Hallazgos Críticos

## Recomendaciones

## Puntaje General
**Puntuación:** 0/100
**Nivel de Cumplimiento:** N/A

---
*Auditoría realizada con OMA Validator v1.0*
EOF
}

# Auditar Pilar 1: Sistema de Nombres Estandarizado
audit_pillar_1() {
    log "Auditando Pilar 1: Sistema de Nombres Estandarizado..."

    local total_files=0
    local compliant_files=0
    local non_compliant_files=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            find $SRC_DIR -type f \( -name "*.ts" -o -name "*.html" -o -name "*.scss" \) | while read file; do
                ((total_files++))
                local filename=$(basename "$file")
                local name_without_ext="${filename%.*}"

                if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
                    ((compliant_files++))
                else
                    ((non_compliant_files++))
                    issues="${issues}- ${file} (patrón incorrecto: ${name_without_ext})\n"
                fi
            done
            ;;
        "nestjs")
            find $SRC_DIR -type f -name "*.ts" | while read file; do
                ((total_files++))
                local filename=$(basename "$file")
                local name_without_ext="${filename%.*}"

                if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
                    ((compliant_files++))
                else
                    ((non_compliant_files++))
                    issues="${issues}- ${file} (patrón incorrecto: ${name_without_ext})\n"
                fi
            done
            ;;
        "flutter")
            find $SRC_DIR -type f -name "*.dart" | while read file; do
                ((total_files++))
                local filename=$(basename "$file")
                local name_without_ext="${filename%.*}"

                if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
                    ((compliant_files++))
                else
                    ((non_compliant_files++))
                    issues="${issues}- ${file} (patrón incorrecto: ${name_without_ext})\n"
                fi
            done
            ;;
    esac

    local compliance_rate=0
    if [ $total_files -gt 0 ]; then
        compliance_rate=$((compliant_files * 100 / total_files))
    fi

    # Actualizar reporte
    sed -i "s|### Pilar 1: Sistema de Nombres Estandarizado\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 1: Sistema de Nombres Estandarizado\n**Estado:** ${compliance_rate}% cumplimiento\n\n**Archivos evaluados:** $total_files\n**Cumplen:** $compliant_files\n**No cumplen:** $non_compliant_files\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 1 completado: $compliance_rate% cumplimiento"
    return $compliance_rate
}

# Auditar Pilar 2: Desacoplamiento/Modularidad
audit_pillar_2() {
    log "Auditando Pilar 2: Desacoplamiento/Modularidad..."

    local score=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            # Verificar lazy loading
            if grep -r "loadChildren" $SRC_DIR/app/app-routing.module.ts > /dev/null 2>&1; then
                ((score += 25))
            else
                issues="${issues}- No se detecta lazy loading de features\n"
            fi

            # Verificar servicios por feature
            local feature_count=$(find $SRC_DIR/app/features -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
            local service_count=$(find $SRC_DIR/app/features -name "*.service.ts" 2>/dev/null | wc -l)

            if [ $feature_count -gt 0 ] && [ $service_count -ge $feature_count ]; then
                ((score += 25))
            else
                issues="${issues}- Servicios insuficientes por feature (features: $feature_count, servicios: $service_count)\n"
            fi
            ;;
        "nestjs")
            # Verificar módulos independientes
            local module_count=$(find $SRC_DIR/modules -name "*.module.ts" 2>/dev/null | wc -l)
            if [ $module_count -gt 0 ]; then
                ((score += 25))
            fi

            # Verificar inyección de dependencias
            if grep -r "@Injectable" $SRC_DIR/modules/*/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 25))
            fi
            ;;
        "flutter")
            # Verificar providers por feature
            local provider_count=$(find $SRC_DIR -name "*provider*.dart" 2>/dev/null | wc -l)
            if [ $provider_count -gt 0 ]; then
                ((score += 25))
            fi

            # Verificar widgets independientes
            local widget_count=$(find $SRC_DIR -name "*widget*.dart" 2>/dev/null | wc -l)
            if [ $widget_count -gt 0 ]; then
                ((score += 25))
            fi
            ;;
    esac

    # Verificar imports no circulares (genérico)
    if [ -f "package.json" ] && command -v npx > /dev/null 2>&1; then
        if npx madge --circular --extensions ts $SRC_DIR > /dev/null 2>&1; then
            ((score += 25))
        else
            issues="${issues}- Posibles dependencias circulares detectadas\n"
        fi
    fi

    # Actualizar reporte
    sed -i "s|### Pilar 2: Desacoplamiento/Modularidad\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 2: Desacoplamiento/Modularidad\n**Estado:** ${score}% cumplimiento\n\n**Evaluación:** Arquitectura modular\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 2 completado: $score% cumplimiento"
    return $score
}

# Auditar Pilar 3: Bus de Datos/Orquestación
audit_pillar_3() {
    log "Auditando Pilar 3: Bus de Datos/Orquestación..."

    local score=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            # Verificar RxJS
            if grep -r "BehaviorSubject\|Subject" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            else
                issues="${issues}- No se detecta uso de Subjects para comunicación\n"
            fi

            # Verificar localStorage
            if grep -r "localStorage" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 20))
            fi
            ;;
        "nestjs")
            # Verificar EventEmitter
            if grep -r "EventEmitter" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi

            # Verificar DTOs de eventos
            if find $SRC_DIR -name "*event*.dto.ts" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 20))
            fi
            ;;
        "flutter")
            # Verificar streams
            if grep -r "Stream\|BehaviorSubject" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi

            # Verificar SharedPreferences
            if grep -r "SharedPreferences" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 20))
            fi
            ;;
    esac

    # Verificar orquestación
    if find $SRC_DIR -name "*orchestrat*.dart" -o -name "*orchestrat*.ts" -o -name "*orchestrat*.js" | grep -v "node_modules" > /dev/null 2>&1; then
        ((score += 25))
    fi

    # Actualizar reporte
    sed -i "s|### Pilar 3: Bus de Datos/Orquestación\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 3: Bus de Datos/Orquestación\n**Estado:** ${score}% cumplimiento\n\n**Evaluación:** Comunicación entre features\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 3 completado: $score% cumplimiento"
    return $score
}

# Auditar Pilar 4: Features Globales
audit_pillar_4() {
    log "Auditando Pilar 4: Features Globales..."

    local score=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            # Verificar servicios globales
            if grep -r "providedIn: 'root'" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 40))
            fi

            # Verificar guards globales
            if find $SRC_DIR -name "*guard*.ts" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "nestjs")
            # Verificar módulos globales
            if grep -r "@Global()" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 40))
            fi

            # Verificar servicios globales
            if find $SRC_DIR -name "*service*.ts" | xargs grep -l "@Injectable" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "flutter")
            # Verificar providers globales
            if grep -r "ProviderScope\|MultiProvider" $SRC_DIR/main.dart 2>/dev/null; then
                ((score += 40))
            fi

            # Verificar servicios globales
            if find $SRC_DIR -name "*service*.dart" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
    esac

    # Actualizar reporte
    sed -i "s|### Pilar 4: Features Globales\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 4: Features Globales\n**Estado:** ${score}% cumplimiento\n\n**Evaluación:** Servicios y configuración global\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 4 completado: $score% cumplimiento"
    return $score
}

# Auditar Pilar 5: Protocolo de Inicialización/Finalización
audit_pillar_5() {
    log "Auditando Pilar 5: Protocolo de Inicialización/Finalización..."

    local score=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            # Verificar ngOnInit/ngOnDestroy
            if grep -r "ngOnInit\|ngOnDestroy" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 40))
            fi

            # Verificar unsubscriptions
            if grep -r "takeUntil\|ngOnDestroy" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "nestjs")
            # Verificar OnModuleInit/OnModuleDestroy
            if grep -r "OnModuleInit\|OnModuleDestroy" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 40))
            fi

            # Verificar cleanup
            if grep -r "onModuleDestroy\|close\|clear" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "flutter")
            # Verificar initState/dispose
            if grep -r "initState\|dispose" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 40))
            fi

            # Verificar cleanup
            if grep -r "dispose\|cancel" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
    esac

    # Actualizar reporte
    sed -i "s|### Pilar 5: Protocolo de Inicialización/Finalización\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 5: Protocolo de Inicialización/Finalización\n**Estado:** ${score}% cumplimiento\n\n**Evaluación:** Ciclo de vida de features\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 5 completado: $score% cumplimiento"
    return $score
}

# Auditar Pilar 6: Manejo Centralizado de Estado
audit_pillar_6() {
    log "Auditando Pilar 6: Manejo Centralizado de Estado..."

    local score=0
    local issues=""

    case $FRAMEWORK in
        "angular")
            # Verificar servicios de estado
            if find $SRC_DIR -name "*state*.service.ts" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi

            # Verificar BehaviorSubjects
            if grep -r "BehaviorSubject" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "nestjs")
            # Verificar servicios de estado
            if find $SRC_DIR -name "*state*.service.ts" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi

            # Verificar estado compartido
            if grep -r "private.*state\|shared.*state" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
        "flutter")
            # Verificar providers de estado
            if find $SRC_DIR -name "*state*.dart" | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi

            # Verificar StateNotifier/ChangeNotifier
            if grep -r "StateNotifier\|ChangeNotifier" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
                ((score += 30))
            fi
            ;;
    esac

    # Verificar métodos controlados
    if grep -r "update.*State\|set.*State" $SRC_DIR/ | grep -v "node_modules" > /dev/null 2>&1; then
        ((score += 20))
    fi

    # Actualizar reporte
    sed -i "s|### Pilar 6: Manejo Centralizado de Estado\n\*\*Estado:\*\* ⏳ Evaluando...|### Pilar 6: Manejo Centralizado de Estado\n**Estado:** ${score}% cumplimiento\n\n**Evaluación:** Estado compartido por feature\n\n**Problemas encontrados:**\n$issues|" "$REPORT_FILE"

    info "Pilar 6 completado: $score% cumplimiento"
    return $score
}

# Calcular puntaje general y generar recomendaciones
finalize_report() {
    log "Finalizando reporte de auditoría..."

    # Calcular promedio
    local total_score=$((pillar1_score + pillar2_score + pillar3_score + pillar4_score + pillar5_score + pillar6_score))
    local average_score=$((total_score / 6))

    # Determinar nivel
    local level="CRÍTICO"
    if [ $average_score -ge 80 ]; then
        level="EXCELENTE"
    elif [ $average_score -ge 60 ]; then
        level="BUENO"
    elif [ $average_score -ge 40 ]; then
        level="REGULAR"
    fi

    # Actualizar resumen
    sed -i "s|## Resumen Ejecutivo|## Resumen Ejecutivo\n\nLa aplicación cumple con **${average_score}%** de los estándares OMA. Nivel de cumplimiento: **${level}**.\n\nSe evaluaron los 6 pilares fundamentales de la filosofía OMA en el framework ${FRAMEWORK}.|" "$REPORT_FILE"

    # Agregar recomendaciones
    local recommendations=""
    if [ $pillar1_score -lt 70 ]; then
        recommendations="${recommendations}- **Revisar nomenclatura:** Muchos archivos no siguen el patrón OMA [feature].[description].[type]\n"
    fi
    if [ $pillar2_score -lt 70 ]; then
        recommendations="${recommendations}- **Mejorar modularidad:** Asegurar que cada feature sea independiente\n"
    fi
    if [ $pillar3_score -lt 70 ]; then
        recommendations="${recommendations}- **Implementar bus de datos:** Establecer mecanismo de comunicación entre features\n"
    fi
    if [ $pillar4_score -lt 70 ]; then
        recommendations="${recommendations}- **Definir features globales:** Identificar servicios que deben persistir\n"
    fi
    if [ $pillar5_score -lt 70 ]; then
        recommendations="${recommendations}- **Implementar ciclo de vida:** Agregar protocolos de inicialización/finalización\n"
    fi
    if [ $pillar6_score -lt 70 ]; then
        recommendations="${recommendations}- **Centralizar estado:** Crear servicios de estado por feature\n"
    fi

    sed -i "s|## Recomendaciones|## Recomendaciones\n\n${recommendations}|" "$REPORT_FILE"

    # Actualizar puntaje
    sed -i "s|\*\*Puntuación:\*\* 0/100|\*\*Puntuación:\*\* ${average_score}/100|" "$REPORT_FILE"
    sed -i "s|\*\*Nivel de Cumplimiento:\*\* N/A|\*\*Nivel de Cumplimiento:\*\* ${level}|" "$REPORT_FILE"

    success "Auditoría completada. Reporte generado: $REPORT_FILE"
    info "Puntuación final: ${average_score}/100 (${level})"
}

# Función principal
main() {
    echo "========================================="
    echo "AUDITOR OMA - Metodología Akuri"
    echo "========================================="

    detect_framework
    init_report

    # Auditar cada pilar
    audit_pillar_1
    pillar1_score=$?

    audit_pillar_2
    pillar2_score=$?

    audit_pillar_3
    pillar3_score=$?

    audit_pillar_4
    pillar4_score=$?

    audit_pillar_5
    pillar5_score=$?

    audit_pillar_6
    pillar6_score=$?

    finalize_report

    echo ""
    success "Auditoría OMA completada"
}

# Ejecutar función principal
main "$@"