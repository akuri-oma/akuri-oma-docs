---
trigger: always_on
description: Documento maestro que define los seis pilares fundamentales de la filosofía OMA (Organización Modular Akuri) para desarrollo de software consistente y mantenible.
status: active
use_case: [PLAN, DESIGN, BUILD, AUDIT, REFACTOR]
---

# Filosofía OMA (Organización Modular Akuri)

## 1. Propósito
La filosofía OMA establece los principios fundamentales para desarrollar software modular, predecible y mantenible. OMA significa **"Organización Modular Akuri"** y se basa en seis pilares que garantizan consistencia arquitectural independiente de la tecnología utilizada.

## 2. Los Seis Pilares de OMA

### Pilar 1: Sistema de Nombres Estandarizado
**Principio:** Todo elemento del código debe seguir un patrón de nomenclatura predefinido y consistente.

**Características:**
- **Predecible:** Los nombres siguen patrones reconocibles inmediatamente.
- **Estandarizado:** Mismas reglas aplican a todas las funcionalidades.
- **Jerárquico:** Estructura `[feature].[descripcion].[tipo].[extension]`.

**Ejemplo Conceptual:**
```
property.create.dto.ts     → Data Transfer Object para crear propiedad
property.list.page.ts      → Página de listado de propiedades
property.api.service.ts    → Servicio API para propiedad
```

### Pilar 2: Desacoplamiento/Modularidad
**Principio:** Cada feature debe ser independiente y sus cambios no afectar otros features.

**Características:**
- **Unidad Autónoma:** Cada feature es autocontenida.
- **Interfaces Claras:** Comunicación solo a través de contratos definidos.
- **Aislamiento:** Cambios en un feature no propagan efectos colaterales.

**Beneficios:**
- Mantenibilidad: Modificar un feature sin riesgo de romper otros.
- Escalabilidad: Agregar/quitar features sin afectar el sistema.
- Testabilidad: Features pueden probarse en aislamiento.

### Pilar 3: Bus de Datos/Orquestación
**Principio:** Los features se comunican mediante un mecanismo centralizado de intercambio de datos.

**Características:**
- **Mecanismo Flexible:** Puede ser localStorage, archivos, eventos, APIs, etc.
- **Orquestación:** Coordinación de datos entre features desacoplados.
- **Protocolos Definidos:** Reglas claras de comunicación.

**Ejemplo Conceptual:**
```typescript
// Feature A envía datos
bus.emit('property-selected', propertyData);

// Feature B recibe datos
bus.on('property-selected', (data) => {
  // Procesar datos recibidos
});
```

### Pilar 4: Features Globales
**Principio:** Algunos features se inicializan al arranque y permanecen activos durante toda la vida de la aplicación.

**Características:**
- **Inicialización Temprana:** Se cargan cuando la aplicación inicia.
- **Persistencia:** Nunca se apagan hasta cierre de aplicación.
- **Disponibilidad Global:** Accesibles desde cualquier parte del sistema.

**Ejemplos Típicos:**
- Sistema de autenticación
- Gestor de configuración global
- Logger centralizado
- Bus de datos principal

### Pilar 5: Protocolo de Inicialización/Finalización
**Principio:** Los features normales tienen ciclo de vida definido con protocolos de entrada y salida.

**Características:**
- **Inicialización:** Al entrar en el feature, se establece estado inicial.
- **Estado Local:** Variables de control específicas del feature.
- **Finalización:** Al salir, se resetea estado a valores iniciales.
- **Limpieza:** Liberación de recursos y memoria.

**Ciclo de Vida:**
```
Entrada → Inicialización → Estado Activo → Finalización → Salida
```

### Pilar 6: Manejo Centralizado de Estado por Feature
**Principio:** Cada feature mantiene su estado en un lugar centralizado accesible por todos sus componentes.

**Características:**
- **Bus Local:** Variables compartidas dentro del feature.
- **Centralización:** Un solo punto de verdad para el estado del feature.
- **Compartición:** Todos los archivos del feature acceden al mismo estado.

**Ejemplo Conceptual:**
```typescript
// Estado centralizado del feature
export class PropertyState {
  selectedProperty: Property | null = null;
  isLoading = false;
  filters = {
    priceRange: [0, 1000000],
    location: '',
    type: 'all'
  };
}
```

## 3. Implementación por Tecnología

Cada tecnología implementa estos pilares de manera específica:

### NestJS (Backend)
- **Nombres:** PascalCase para clases, camelCase para métodos.
- **Desacoplamiento:** Módulos independientes con imports explícitos.
- **Bus de Datos:** EventEmitter o Redis para comunicación.
- **Features Globales:** Módulos globales registrados en AppModule.
- **Estado:** Servicios singleton con estado compartido.

### Angular (Frontend)
- **Nombres:** kebab-case para archivos, PascalCase para componentes.
- **Desacoplamiento:** Lazy loading modules, servicios independientes.
- **Bus de Datos:** RxJS Subjects, localStorage, o servicios compartidos.
- **Features Globales:** App-level services y guards.
- **Estado:** Component state management (NgRx, Akita, o servicios).

### Flutter (Mobile)
- **Nombres:** camelCase para archivos, PascalCase para clases.
- **Desacoplamiento:** Provider pattern o BLoC pattern.
- **Bus de Datos:** Streams, EventBus, o InheritedWidget.
- **Features Globales:** App-level providers.
- **Estado:** State management solutions (Provider, Riverpod, BLoC).

## 4. Beneficios de Aplicar OMA

### Para Desarrolladores
- **Consistencia:** Código predecible y fácil de entender.
- **Velocidad:** Menos tiempo en decisiones de arquitectura.
- **Mantenibilidad:** Cambios localizados y seguros.

### Para Equipos
- **Colaboración:** Estándares compartidos facilitan el trabajo en equipo.
- **Onboarding:** Nuevos miembros aprenden patrones rápidamente.
- **Code Reviews:** Criterios objetivos de calidad.

### Para Proyectos
- **Escalabilidad:** Arquitectura que crece sin complejidad adicional.
- **Mantenibilidad:** Código que se mantiene productivo a largo plazo.
- **Calidad:** Menos bugs por inconsistencias.

## 5. Integración con Metodología Akuri

OMA se integra perfectamente con los workflows Akuri:

- **En REQUIREMENT:** Verificar cumplimiento de pilares OMA.
- **En DESIGN:** Diseñar siguiendo principios OMA.
- **En PLAN:** Estructurar según estándares del framework.
- **En BUILD:** Implementar con patrones OMA.
- **En AUDIT:** Verificar conformidad con guidelines OMA.

## 6. Referencias
- Ver guidelines específicos por framework en `.akuri/oma/[framework]/`
- Ver `akuri.01-global-rules.md` para reglas generales
- Ver `akuri-workflow.master.md` para integración con workflows