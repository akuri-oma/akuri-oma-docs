---
trigger: design
description: Diseño conceptual de la implementación OMA en Flutter, definiendo cómo se materializan los seis pilares en arquitectura mobile.
status: active
use_case: DESIGN
---

# [DESIGN] OMA Flutter Implementation

## 1. Entorno de Ejecución
### 1.1 Infraestructura
- **Framework:** Flutter con Dart
- **Arquitectura:** Widget-based con Provider pattern
- **State Management:** Riverpod o Provider
- **Navegación:** GoRouter con nested navigation

### 1.2 Tecnologías
- **Lenguaje:** Dart con null safety
- **UI:** Material Design 3 / Cupertino
- **Persistencia:** SharedPreferences + SQLite
- **Networking:** Dio HTTP client
- **Testing:** Flutter test + Mockito

## 2. Explicación de la Solución
Implementaremos OMA en Flutter aprovechando su arquitectura basada en widgets y el patrón Provider. Cada feature será un conjunto de widgets con providers dedicados, comunicándose a través de streams y SharedPreferences para persistencia.

## 3. Resolución de Problemas

### 3.1 Desacoplamiento
**Problema:** Widgets acoplados dificultan testing y mantenimiento.
**Solución:** Provider pattern con interfaces claras.

### 3.2 Comunicación entre Features
**Problema:** Cómo features se comunican sin dependencias directas.
**Solución:** Event bus con streams + SharedPreferences.

### 3.3 Estado por Feature
**Problema:** Estado disperso en widgets.
**Solución:** StateNotifier por feature con providers.

## 4. Arquitectura de Alto Nivel

```
MaterialApp (Root)
├── Global Providers (Features Globales)
│   ├── AuthProvider
│   ├── ConfigProvider
│   └── NavigationProvider
├── Feature Screens (Por Feature)
│   ├── PropertyFeature
│   ├── UserFeature
│   └── PaymentFeature
└── BottomNavigationBar
    └── Feature Navigation
```

## 5. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```dart
// ✅ CORRECTO
// Archivo: property.create.screen.dart
class PropertyCreateScreen extends StatefulWidget {
  // Propiedades en camelCase
  final Property? initialProperty;
  static const maxPrice = 10000000; // Constantes lowerCamelCase

  // Métodos en camelCase
  void onSubmit() {
    // Implementation
  }
}

// Archivo: property.list.widget.dart
class PropertyListWidget extends StatelessWidget {
  // Implementation
}
```

### Pilar 2: Desacoplamiento/Modularidad
```dart
// lib/features/property/
├── models/
│   ├── property.model.dart
│   └── property.create.dto.dart
├── providers/
│   ├── property.provider.dart
│   └── property.state.provider.dart
├── screens/
│   ├── property.list.screen.dart
│   └── property.create.screen.dart
├── widgets/
│   ├── property.card.widget.dart
│   └── property.filter.widget.dart
└── services/
    └── property.api.service.dart

// property.provider.dart
@riverpod
class PropertyNotifier extends _$PropertyNotifier {
  @override
  PropertyState build() {
    return PropertyState.initial();
  }

  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true);
    try {
      final properties = await ref.read(propertyApiServiceProvider).getAll();
      state = state.copyWith(
        properties: properties,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}
```

### Pilar 3: Bus de Datos/Orquestación
```dart
// event_bus.service.dart (Global)
class EventBus {
  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get stream => _controller.stream;

  void emit(Event event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}

// events.dart
abstract class Event {}

class PropertyCreatedEvent extends Event {
  final Property property;
  PropertyCreatedEvent(this.property);
}

class UserLoggedInEvent extends Event {
  final User user;
  UserLoggedInEvent(this.user);
}

// Uso en providers
@riverpod
class PropertyNotifier extends _$PropertyNotifier {
  @override
  PropertyState build() {
    // Escuchar eventos globales
    ref.listen(eventBusProvider, (previous, next) {
      if (next is UserLoggedInEvent) {
        // Reset filters when user changes
        state = state.copyWith(filters: PropertyFilters.initial());
      }
    });
    return PropertyState.initial();
  }

  Future<void> createProperty(PropertyCreateDto dto) async {
    final property = await ref.read(propertyApiServiceProvider).create(dto);

    // Emitir evento para otros features
    ref.read(eventBusProvider).emit(PropertyCreatedEvent(property));

    // Persistir en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last-created-property', jsonEncode(property.toJson()));

    state = state.copyWith(
      properties: [...state.properties, property],
    );
  }
}
```

### Pilar 4: Features Globales
```dart
// main.dart
void main() {
  runApp(
    ProviderScope(
      overrides: [
        // Providers globales
        configProvider.overrideWithValue(ConfigService()),
        authProvider.overrideWith(() => AuthNotifier()),
        eventBusProvider.overrideWithValue(EventBus()),
      ],
      child: const MyApp(),
    ),
  );
}

// auth.provider.dart (Global)
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Persistir sesión
    _loadPersistedSession();
    return AuthState.initial();
  }

  Future<void> _loadPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth-token');
    if (token != null) {
      // Validar token y restaurar sesión
      await loginWithToken(token);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await ref.read(authApiServiceProvider).login(email, password);
      state = state.copyWith(
        user: user,
        isAuthenticated: true,
        isLoading: false,
      );

      // Persistir token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth-token', user.token);

      // Emitir evento global
      ref.read(eventBusProvider).emit(UserLoggedInEvent(user));
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> logout() async {
    state = AuthState.initial();

    // Limpiar persistencia
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth-token');

    // Emitir evento
    ref.read(eventBusProvider).emit(UserLoggedOutEvent());
  }
}
```

### Pilar 5: Protocolo de Inicialización/Finalización
```dart
// property.state.provider.dart
@riverpod
class PropertyStateNotifier extends _$PropertyStateNotifier {
  @override
  PropertyState build() {
    // Inicialización del feature
    _initializeFeature();
    return PropertyState.initial();
  }

  Future<void> _initializeFeature() async {
    // Cargar filtros persistidos
    await _loadPersistedFilters();

    // Configurar listeners
    _setupEventListeners();
  }

  Future<void> _loadPersistedFilters() async {
    final prefs = await SharedPreferences.getInstance();
    final filtersJson = prefs.getString('property-filters');
    if (filtersJson != null) {
      final filters = PropertyFilters.fromJson(jsonDecode(filtersJson));
      state = state.copyWith(filters: filters);
    }
  }

  void _setupEventListeners() {
    // Cleanup se hace automáticamente con ref.onDispose
    ref.onDispose(() {
      // Limpiar recursos si es necesario
    });
  }

  // Método público para reset del feature
  void resetFeature() {
    state = PropertyState.initial();

    // Limpiar persistencia
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('property-filters');
      prefs.remove('selected-property');
    });

    // Emitir evento de reset
    ref.read(eventBusProvider).emit(PropertyFeatureResetEvent());
  }
}

// property.list.screen.dart
class PropertyListScreen extends ConsumerStatefulWidget {
  const PropertyListScreen({super.key});

  @override
  ConsumerState<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends ConsumerState<PropertyListScreen> {
  @override
  void initState() {
    super.initState();
    // Inicializar feature si es necesario
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(propertyStateNotifierProvider.notifier).initializeIfNeeded();
    });
  }

  @override
  void dispose() {
    // Reset feature cuando se sale
    ref.read(propertyStateNotifierProvider.notifier).resetFeature();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}
```

### Pilar 6: Manejo Centralizado de Estado
```dart
// property.state.dart
@freezed
class PropertyState with _$PropertyState {
  const factory PropertyState({
    @Default([]) List<Property> properties,
    @Default(null) Property? selectedProperty,
    @Default(PropertyFilters()) PropertyFilters filters,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _PropertyState;

  factory PropertyState.initial() => const PropertyState();
}

// property.state.provider.dart
@riverpod
class PropertyStateNotifier extends _$PropertyStateNotifier {
  @override
  PropertyState build() {
    // Inicializar feature
    _initializeFeature();
    return PropertyState.initial();
  }

  Future<void> _initializeFeature() async {
    await _loadPersistedState();
  }

  Future<void> _loadPersistedState() async {
    final prefs = await SharedPreferences.getInstance();

    // Cargar filtros
    final filtersJson = prefs.getString('property-filters');
    if (filtersJson != null) {
      final filters = PropertyFilters.fromJson(jsonDecode(filtersJson));
      state = state.copyWith(filters: filters);
    }

    // Cargar propiedad seleccionada
    final selectedJson = prefs.getString('selected-property');
    if (selectedJson != null) {
      final selected = Property.fromJson(jsonDecode(selectedJson));
      state = state.copyWith(selectedProperty: selected);
    }
  }

  // Métodos controlados para mutar estado
  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final properties = await ref.read(propertyApiServiceProvider).getAll();
      state = state.copyWith(
        properties: properties,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  void setSelectedProperty(Property? property) {
    state = state.copyWith(selectedProperty: property);

    // Persistir selección
    SharedPreferences.getInstance().then((prefs) {
      if (property != null) {
        prefs.setString('selected-property', jsonEncode(property.toJson()));
      } else {
        prefs.remove('selected-property');
      }
    });
  }

  void updateFilters(PropertyFilters newFilters) {
    state = state.copyWith(filters: newFilters);

    // Persistir filtros
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('property-filters', jsonEncode(newFilters.toJson()));
    });

    // Emitir evento
    ref.read(eventBusProvider).emit(PropertyFiltersChangedEvent(newFilters));
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  // Reset completo del estado
  void resetState() {
    state = PropertyState.initial();

    // Limpiar persistencia
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('property-filters');
      prefs.remove('selected-property');
    });
  }
}
```

## 6. Integración con Navegación
```dart
// router.dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/properties',
      builder: (context, state) => const PropertyListScreen(),
      routes: [
        GoRoute(
          path: 'create',
          builder: (context, state) => const PropertyCreateScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => PropertyDetailScreen(
            propertyId: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final authState = ref.read(authNotifierProvider);
    final isLoggedIn = authState.isAuthenticated;

    if (!isLoggedIn && state.matchedLocation != '/login') {
      return '/login';
    }

    return null;
  },
);

// main.dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
```

## 7. Patrón de Widgets por Feature
```dart
// property.card.widget.dart
class PropertyCard extends ConsumerWidget {
  const PropertyCard({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          // Actualizar estado centralizado
          ref.read(propertyStateNotifierProvider.notifier)
             .setSelectedProperty(property);

          // Navegar
          context.go('/properties/${property.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text('\$${property.price}'),
              const SizedBox(height: 8),
              Text(property.location),
            ],
          ),
        ),
      ),
    );
  }
}

// property.list.screen.dart
class PropertyListScreen extends ConsumerWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyStateNotifierProvider);
    final propertyNotifier = ref.read(propertyStateNotifierProvider.notifier);

    ref.listen<PropertyState>(
      propertyStateNotifierProvider,
      (previous, next) {
        if (next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.error!)),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/properties/create'),
          ),
        ],
      ),
      body: propertyState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: propertyState.properties.length,
              itemBuilder: (context, index) {
                final property = propertyState.properties[index];
                return PropertyCard(property: property);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => propertyNotifier.loadProperties(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

## 8. Garantías de Criterios de Aceptación
- **Nombres estandarizados:** Patrón consistente en archivos y clases
- **Lazy loading:** Features cargados bajo demanda
- **Reutilización de estado:** Providers por feature
- **Comunicación desacoplada:** Event bus con streams
- **Ciclo de vida:** Inicialización/finalización automática
- **Performance:** Efficient rebuilds con const constructors

## 9. Consideraciones de Seguridad
- Secure storage para datos sensibles
- Certificate pinning para HTTPS
- Jailbreak detection
- Obfuscation de código

## 10. Alternativas Consideradas
- **Bloc pattern puro:** Complejidad innecesaria → Usar Riverpod
- **Redux:** Overkill para apps móviles → Riverpod suficiente
- **Scoped model:** Deprecated → Provider/Riverpod

## 11. Riesgos y Mitigaciones
- **Memory leaks:** Dispose automático → Mitigación: ref.onDispose
- **Estado inconsistente:** Mutaciones controladas → Mitigación: Métodos dedicados
- **Navegación compleja:** GoRouter → Mitigación: Guards y redirects