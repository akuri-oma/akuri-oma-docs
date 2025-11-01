---
trigger: always_on
description: Arquitectura general del proyecto siguiendo la filosofía OMA. Define estructura de carpetas, jerarquía de features y ubicación de funcionalidades clave.
status: active
use_case: [PLAN, BUILD, AUDIT]
---

# [ARCHITECTURE] Arquitectura General del Proyecto OMA

## 1. Propósito
Este documento define la arquitectura general de cualquier proyecto que siga la filosofía OMA (Organización Modular Akuri). Establece la estructura de carpetas de primer nivel, la jerarquía de features y la ubicación de funcionalidades clave, asegurando consistencia y mantenibilidad.

## 2. Jerarquía de Features

### 2.1 Tipos de Features
Los features se clasifican en tres niveles jerárquicos:

#### **Global/System Features** 🏗️
Features que gobiernan y configuran el sistema completo:
- **Propósito**: Gestionar aspectos transversales del sistema
- **Alcance**: Todo el proyecto
- **Características**:
  - Persistentes durante todo el ciclo de vida
  - Compartidos por todos los features
  - No tienen estado propio de feature
  - Inicializados antes que cualquier otro feature

**Ejemplos:**
- Configuración del sistema
- Conexiones a bases de datos (backend)
- Autenticación global
- Logging y monitoreo
- Configuración de estilos (frontend)

#### **Shared/Utilitary Features** 🔧
Features utilitarios compartidos por otros features:
- **Propósito**: Proporcionar funcionalidades comunes reutilizables
- **Alcance**: Múltiples features específicos
- **Características**:
  - No tienen estado propio persistente
  - Son consumidos por features standard
  - Pueden tener estado temporal
  - Inicializados bajo demanda

**Ejemplos:**
- Utilidades de fecha/hora
- Servicios de email
- Módulos de chat
- Validadores comunes
- Formatters y parsers

#### **Standard Features** 📦
Features de negocio totalmente desacoplados:
- **Propósito**: Implementar funcionalidades específicas del dominio
- **Alcance**: Feature específico e independiente
- **Características**:
  - Completamente autocontenidos
  - Estado propio centralizado
  - Comunicación via bus de datos
  - Inicialización/finalización independientes

**Ejemplos:**
- Gestión de productos
- Perfiles de usuario
- Carrito de compras
- Reportes específicos

## 3. Estructura por Framework

### 3.1 Backend (NestJS)
```
src/
├── global/                    # 🏗️ Features Globales
│   ├── config/               # Configuración del sistema
│   │   ├── config.module.ts
│   │   ├── database.config.ts
│   │   └── app.config.ts
│   ├── auth/                 # Autenticación global
│   │   ├── auth.module.ts
│   │   ├── jwt.strategy.ts
│   │   └── auth.guard.ts
│   └── database/             # Conexión a BD
│       ├── database.module.ts
│       ├── entities/
│       └── migrations/
├── shared/                   # 🔧 Features Compartidos
│   ├── email/               # Servicio de email
│   ├── logger/              # Utilidades de logging
│   └── validation/          # Validadores comunes
└── features/                # 📦 Features Standard
    ├── product/
    │   ├── product.module.ts
    │   ├── controllers/
    │   ├── services/
    │   ├── models/
    │   └── dto/
    └── user/
        ├── user.module.ts
        ├── controllers/
        ├── services/
        ├── models/
        └── dto/
```

**Funcionalidades Clave - Backend:**
- **Configuración Global**: `src/global/config/`
- **Autenticación**: `src/global/auth/`
- **Base de Datos**: `src/global/database/`
- **Bus de Datos**: `src/global/event-bus/`
- **Utilidades**: `src/shared/`

### 3.2 Frontend (Angular)
```
src/
├── app/
│   ├── global/              # 🏗️ Features Globales
│   │   ├── config/         # Configuración del sistema
│   │   │   ├── environment.ts
│   │   │   └── app.config.ts
│   │   ├── auth/           # Autenticación
│   │   │   ├── auth.service.ts
│   │   │   ├── auth.guard.ts
│   │   │   └── jwt.interceptor.ts
│   │   ├── styles/         # Estilos globales
│   │   │   ├── global.scss
│   │   │   └── theme.scss
│   │   └── i18n/           # Traducciones
│   │       ├── assets/
│   │       └── translation.service.ts
│   ├── shared/             # 🔧 Features Compartidos
│   │   ├── utils/         # Utilidades comunes
│   │   │   ├── date.util.ts
│   │   │   └── format.util.ts
│   │   ├── components/    # Componentes compartidos
│   │   │   ├── button.component.ts
│   │   │   └── modal.component.ts
│   │   └── services/      # Servicios compartidos
│   │       └── notification.service.ts
│   └── features/          # 📦 Features Standard
│       ├── product/
│       │   ├── product.module.ts
│       │   ├── product-routing.module.ts
│       │   ├── services/  # 📊 CAPA LÓGICA
│       │   │   ├── product.service.ts
│       │   │   ├── product.state.service.ts
│       │   │   └── product.actions.ts
│       │   ├── models/
│       │   │   ├── product.model.ts
│       │   │   └── product.dto.ts
│       │   └── presentation/  # 🎨 CAPA VISUAL
│       │       ├── pages/
│       │       │   ├── product.list.page.ts
│       │       │   └── product.create.page.ts
│       │       ├── components/
│       │       │   ├── product.card.component.ts
│       │       │   └── product.form.component.ts
│       │       └── layout/
│       │           └── product.layout.ts
│       └── user/
│           ├── user.module.ts
│           ├── user-routing.module.ts
│           ├── services/  # 📊 CAPA LÓGICA
│           ├── models/
│           └── presentation/  # 🎨 CAPA VISUAL
```

**Funcionalidades Clave - Frontend:**
- **Configuración Global**: `src/app/global/config/`
- **Autenticación**: `src/app/global/auth/`
- **Estilos Globales**: `src/app/global/styles/`
- **Traducciones**: `src/app/global/i18n/`
- **Bus de Datos**: `src/app/global/event-bus/`
- **Utilidades**: `src/app/shared/utils/`

**Separación Lógica vs Visual:**
- **📊 Capa Lógica Primero**: `services/`, `models/` - Conectar con backend, implementar estado
- **🎨 Capa Visual Después**: `presentation/` - Construir UI siguiendo design system

### 3.3 Mobile (Flutter)
```
lib/
├── global/                # 🏗️ Features Globales
│   ├── config/           # Configuración del sistema
│   │   ├── app.config.dart
│   │   └── environment.dart
│   ├── auth/             # Autenticación
│   │   ├── auth.provider.dart
│   │   ├── auth.service.dart
│   │   └── auth.guard.dart
│   ├── storage/          # Persistencia local
│   │   ├── storage.service.dart
│   │   └── shared.preferences.dart
│   └── theme/            # Tema global
│       ├── app.theme.dart
│       └── theme.provider.dart
├── shared/               # 🔧 Features Compartidos
│   ├── utils/           # Utilidades comunes
│   │   ├── date.util.dart
│   │   └── format.util.dart
│   ├── widgets/         # Widgets compartidos
│   │   ├── custom.button.widget.dart
│   │   └── loading.widget.dart
│   └── services/        # Servicios compartidos
│       └── notification.service.dart
└── features/            # 📦 Features Standard
    ├── product/
    │   ├── models/     # 📊 CAPA LÓGICA
    │   │   ├── product.model.dart
    │   │   └── product.dto.dart
    │   ├── providers/  # 📊
    │   │   ├── product.provider.dart
    │   │   └── product.state.provider.dart
    │   ├── services/   # 📊
    │   │   └── product.api.service.dart
    │   ├── screens/    # 🎨 CAPA VISUAL
    │   │   ├── product.list.screen.dart
    │   │   └── product.create.screen.dart
    │   └── widgets/    # 🎨
    │       ├── product.card.widget.dart
    │       └── product.form.widget.dart
    └── user/
        ├── models/     # 📊 CAPA LÓGICA
        ├── providers/  # 📊
        ├── services/   # 📊
        ├── screens/    # 🎨 CAPA VISUAL
        └── widgets/    # 🎨
```

**Funcionalidades Clave - Mobile:**
- **Configuración Global**: `lib/global/config/`
- **Autenticación**: `lib/global/auth/`
- **Almacenamiento Local**: `lib/global/storage/`
- **Tema Global**: `lib/global/theme/`
- **Bus de Datos**: `lib/global/event-bus/`
- **Utilidades**: `lib/shared/utils/`

## 4. Ubicación de Funcionalidades Clave

### 4.1 Por Tipo de Funcionalidad

#### **Persistencia de Datos**
- **Backend**: `src/global/database/`
- **Frontend**: `src/app/global/config/` (localStorage/IndexedDB)
- **Mobile**: `lib/global/storage/`

#### **Autenticación y Autorización**
- **Backend**: `src/global/auth/`
- **Frontend**: `src/app/global/auth/`
- **Mobile**: `lib/global/auth/`

#### **Configuración del Sistema**
- **Backend**: `src/global/config/`
- **Frontend**: `src/app/global/config/`
- **Mobile**: `lib/global/config/`

#### **Bus de Datos/Orquestación**
- **Backend**: `src/global/event-bus/`
- **Frontend**: `src/app/global/event-bus/`
- **Mobile**: `lib/global/event-bus/`

#### **Estilos y Tema**
- **Backend**: N/A
- **Frontend**: `src/app/global/styles/`
- **Mobile**: `lib/global/theme/`

#### **Traducciones/i18n**
- **Backend**: N/A
- **Frontend**: `src/app/global/i18n/`
- **Mobile**: `lib/global/i18n/` (si aplica)

### 4.2 Funcionalidades Especiales

#### **Auth (Vinculado al Backend)**
- **Ubicación**: `global/auth/`
- **Características**:
  - Login/logout conectados al backend
  - Gestión de tokens JWT
  - Guards/protectores de rutas
  - Estado global de autenticación

#### **Configuración de Entorno**
- **Ubicación**: `global/config/`
- **Contiene**:
  - Variables de entorno
  - URLs de APIs
  - Configuración de BD
  - Parámetros del sistema

#### **Utilidades Compartidas**
- **Ubicación**: `shared/utils/`
- **Ejemplos**:
  - Formateadores de fecha/hora
  - Validadores comunes
  - Helpers de UI
  - Constantes globales

## 5. Flujos de Trabajo por Tipo de Feature

### 5.1 Features Globales
**Workflow**: `BUILD` (único paso, sin UI)
1. REQUIREMENT → DESIGN → PLAN → BUILD con TRACKER
2. **No tienen capa visual** (son servicios/configuraciones)
3. **Inicialización automática** al startup de la app

### 5.2 Features Compartidos
**Workflow**: `BUILD` (único paso, sin UI)
1. REQUIREMENT → DESIGN → PLAN → BUILD con TRACKER
2. **Pueden tener componentes básicos** pero no páginas completas
3. **Inicialización bajo demanda** cuando son requeridos

### 5.3 Features Standard
**Workflow Separado**:
1. **BUILD-LOGIC**: REQUIREMENT → DESIGN → PLAN → BUILD (solo lógica)
2. **UI_BUILD**: REQUIREMENT → DESIGN → PLAN-UI → BUILD-UI con TRACKER
3. **UI_SKIN**: Aplicar design system

## 6. Convenciones de Nomenclatura por Nivel

### 6.1 Features Globales
- **Prefijo**: `global.`
- **Ejemplos**:
  - `global.config.database.service.ts`
  - `global.auth.jwt.guard.ts`
  - `global.event-bus.service.ts`

### 6.2 Features Compartidos
- **Prefijo**: `shared.`
- **Ejemplos**:
  - `shared.utils.date.service.ts`
  - `shared.components.button.widget.dart`
  - `shared.email.notification.service.ts`

### 6.3 Features Standard
- **Sin prefijo**: Solo el nombre del feature
- **Ejemplos**:
  - `product.api.service.ts`
  - `user.profile.screen.dart`
  - `order.create.page.ts`

## 7. Referencias a Documentación OMA

### 7.1 Filosofía General
- **`.akuri/oma/oma-philosophy.md`**: Los 6 pilares fundamentales

### 7.2 Por Framework
- **NestJS**: `.akuri/oma/nestjs/` - Implementación específica backend
- **Angular**: `.akuri/oma/angular/` - Implementación específica frontend
- **Flutter**: `.akuri/oma/flutter/` - Implementación específica mobile

### 7.3 Scripts de Validación
- **Validador**: `.akuri/oma/scripts/validate-oma.sh`
- **Auditor**: `.akuri/oma/scripts/audit-oma.sh`

## 8. Checklist de Conformidad

### Arquitectura General
- [ ] Estructura de carpetas sigue jerarquía definida
- [ ] Features globales están en `global/`
- [ ] Features compartidos están en `shared/`
- [ ] Features standard están en `features/`
- [ ] Separación lógica vs visual implementada en frontend

### Funcionalidades Clave
- [ ] Configuración global localizada y accesible
- [ ] Autenticación implementada en `global/auth/`
- [ ] Bus de datos disponible en `global/event-bus/`
- [ ] Persistencia configurada correctamente
- [ ] Utilidades compartidas en `shared/utils/`

### Nomenclatura
- [ ] Features globales usan prefijo `global.`
- [ ] Features compartidos usan prefijo `shared.`
- [ ] Features standard sin prefijo
- [ ] Patrón OMA `[feature].[description].[type]` aplicado

Este documento debe ser personalizado para cada proyecto específico, ajustando las ubicaciones y funcionalidades según las necesidades particulares del proyecto.