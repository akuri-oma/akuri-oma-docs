---
trigger: plan
description: Plan técnico detallado para implementar OMA en Flutter, definiendo estructura de archivos, patrones y convenciones específicas.
status: active
use_case: PLAN
---

# [PLAN] OMA Flutter Implementation

## 1. Estructura de Archivos por Feature

### 1.1 Estructura Base por Feature
```
lib/features/[feature]/
├── models/
│   ├── [feature].model.dart                 # Modelo principal
│   ├── [feature].create.dto.dart            # DTO creación
│   ├── [feature].update.dto.dart            # DTO actualización
│   └── [feature].*.model.dart               # Modelos específicos
├── providers/
│   ├── [feature].provider.dart              # Provider principal
│   ├── [feature].state.provider.dart        # Estado del feature
│   └── [feature].*.provider.dart            # Providers específicos
├── screens/
│   ├── [feature].list.screen.dart           # Pantalla de lista
│   ├── [feature].create.screen.dart         # Pantalla de creación
│   ├── [feature].detail.screen.dart         # Pantalla de detalle
│   └── [feature].*.screen.dart              # Pantallas específicas
├── widgets/
│   ├── [feature].card.widget.dart           # Widget de tarjeta
│   ├── [feature].form.widget.dart           # Widget de formulario
│   └── [feature].*.widget.dart              # Widgets específicos
├── services/
│   ├── [feature].api.service.dart           # Servicio API
│   └── [feature].*.service.dart             # Servicios específicos
└── utils/
    └── [feature].*.util.dart                # Utilidades específicas
```

### 1.2 Estructura para Features Globales
```
lib/core/
├── providers/
│   ├── auth.provider.dart                   # Provider global auth
│   ├── config.provider.dart                 # Configuración global
│   └── event.bus.provider.dart              # Bus de eventos global
├── services/
│   ├── api.service.dart                     # Servicio API base
│   ├── storage.service.dart                 # Servicio de almacenamiento
│   └── logger.service.dart                  # Servicio de logging
├── models/
│   └── global.models.dart                   # Modelos globales
├── widgets/
│   ├── app.bar.widget.dart                  # App bar global
│   └── error.widget.dart                    # Widget de error global
└── utils/
    ├── constants.util.dart                  # Constantes globales
    └── extensions.util.dart                 # Extensiones globales
```

## 2. Patrones de Nomenclatura

### 2.1 Archivos
**Patrón:** `[feature].[description].[type].dart`

**Ejemplos:**
- `property.create.screen.dart`
- `property.api.service.dart`
- `user.auth.provider.dart`

### 2.2 Clases y Componentes
**Regla:** Nombre de clase = nombre de archivo sin extensión, en PascalCase

**Ejemplos:**
```dart
// Archivo: property.create.screen.dart
class PropertyCreateScreen extends StatefulWidget {
  // Implementation
}

// Archivo: user.auth.service.dart
class UserAuthService {
  // Implementation
}
```

### 2.3 Variables y Métodos
- **Variables:** camelCase
- **Constantes:** lowerCamelCase con prefijo `k` o UPPER_SNAKE_CASE
- **Getters/Setters:** camelCase
- **Métodos:** camelCase

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado
```dart
// ✅ CORRECTO
// Archivo: property.create.screen.dart
class PropertyCreateScreen extends StatefulWidget {
  const PropertyCreateScreen({super.key});

  @override
  State<PropertyCreateScreen> createState() => _PropertyCreateScreenState();
}

class _PropertyCreateScreenState extends State<PropertyCreateScreen> {
  // Variables en camelCase
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Constantes con prefijo k
  static const double kMaxPrice = 10000000.0;

  // Métodos en camelCase
  void onSubmit() {
    // Implementation
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}

// ❌ INCORRECTO
// Archivo: PropertyCreateScreen.dart
class propertyCreateScreen extends StatefulWidget { // Nombres inconsistentes
  // Implementation
}
```

### Pilar 2: Desacoplamiento/Modularidad
```dart
// lib/features/property/property.provider.dart
@riverpod
class PropertyNotifier extends _$PropertyNotifier {
  @override
  PropertyState build() {
    // Estado específico del feature
    return PropertyState.initial();
  }

  // Métodos específicos del feature
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

// lib/features/property/services/property.api.service.dart
@riverpod
PropertyApiService propertyApiService(Ref ref) {
  final dio = ref.read(dioProvider);
  return PropertyApiService(dio);
}

class PropertyApiService {
  final Dio _dio;

  PropertyApiService(this._dio);

  Future<List<Property>> getAll() async {
    final response = await _dio.get('/properties');
    return (response.data as List)
        .map((json) => Property.fromJson(json))
        .toList();
  }

  Future<Property> create(CreatePropertyDto dto) async {
    final response = await _dio.post('/properties', data: dto.toJson());
    return Property.fromJson(response.data);
  }
}
```

### Pilar 3: Bus de Datos/Orquestación
```dart
// lib/core/providers/event.bus.provider.dart
@riverpod
EventBus eventBus(Ref ref) {
  return EventBus();
}

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

// lib/core/models/events.model.dart
abstract class Event {
  const Event();
}

class PropertyCreatedEvent extends Event {
  final Property property;
  const PropertyCreatedEvent(this.property);
}

class UserLoggedInEvent extends Event {
  final User user;
  const UserLoggedInEvent(this.user);
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

  Future<void> createProperty(CreatePropertyDto dto) async {
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
// lib/core/providers/auth.provider.dart
@Riverpod(keepAlive: true) // Global - se mantiene vivo
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Inicialización global
    _initializeAuth();
    return AuthState.initial();
  }

  Future<void> _initializeAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth-token');

    if (token != null) {
      try {
        final user = await ref.read(authApiServiceProvider).validateToken(token);
        state = state.copyWith(user: user, isAuthenticated: true);
      } catch (e) {
        await prefs.remove('auth-token');
      }
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      final user = await ref.read(authApiServiceProvider).login(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth-token', user.token);

      state = state.copyWith(
        user: user,
        isAuthenticated: true,
        isLoading: false,
      );

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
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth-token');

    state = AuthState.initial();

    // Emitir evento global
    ref.read(eventBusProvider).emit(UserLoggedOutEvent());
  }
}

// lib/core/providers/config.provider.dart
@Riverpod(keepAlive: true) // Global
class ConfigNotifier extends _$ConfigNotifier {
  @override
  AppConfig build() {
    return const AppConfig(
      apiUrl: String.fromEnvironment('API_URL', defaultValue: 'https://api.example.com'),
      maxFileSize: 10 * 1024 * 1024, // 10MB
      supportedCurrencies: ['USD', 'EUR', 'GBP'],
      defaultPageSize: 10,
    );
  }
}
```

### Pilar 5: Protocolo de Inicialización/Finalización
```dart
// lib/features/property/providers/property.state.provider.dart
@riverpod
class PropertyStateNotifier extends _$PropertyStateNotifier {
  @override
  PropertyState build() {
    // Inicialización del feature
    _initializeFeature();
    return PropertyState.initial();
  }

  Future<void> _initializeFeature() async {
    await _loadPersistedFilters();
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
    // Cleanup automático con ref.onDispose
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

// lib/features/property/screens/property.list.screen.dart
class PropertyListScreen extends ConsumerStatefulWidget {
  const PropertyListScreen({super.key});

  @override
  ConsumerState<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends ConsumerState<PropertyListScreen> {
  @override
  void initState() {
    super.initState();

    // Inicializar feature cuando se entra a la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(propertyStateNotifierProvider.notifier).initializeIfNeeded();
    });
  }

  @override
  void dispose() {
    // Reset feature cuando se sale de la pantalla
    ref.read(propertyStateNotifierProvider.notifier).resetFeature();
    super.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Implementation
  }
}
```

### Pilar 6: Manejo Centralizado de Estado
```dart
// lib/features/property/models/property.state.dart
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

// lib/features/property/providers/property.state.provider.dart
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

## 4. Convenciones de Código

### 4.1 Imports
```dart
// ✅ Correcto - Imports organizados
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/property.model.dart';
import '../providers/property.provider.dart';
import '../widgets/property.card.widget.dart';

// ❌ Incorrecto - Imports desorganizados
import '../widgets/property.card.widget.dart';
import 'package:flutter/material.dart';
import '../models/property.model.dart';
import 'dart:convert'; // Import innecesario
```

### 4.2 Modelos con Freezed
```dart
// lib/features/property/models/property.model.dart
@freezed
class Property with _$Property {
  const factory Property({
    required String id,
    required String name,
    required double price,
    String? description,
    required String location,
    @Default('active') String status,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

// lib/features/property/models/property.filters.model.dart
@freezed
class PropertyFilters with _$PropertyFilters {
  const factory PropertyFilters({
    @Default([0, 1000000]) List<double> priceRange,
    @Default('') String location,
    @Default('all') String type,
    @Default('active') String status,
  }) = _PropertyFilters;

  factory PropertyFilters.fromJson(Map<String, dynamic> json) =>
      _$PropertyFiltersFromJson(json);
}
```

### 4.3 Providers con Riverpod
```dart
// lib/features/property/providers/property.provider.dart
@riverpod
Future<List<Property>> propertyList(Ref ref) async {
  final apiService = ref.read(propertyApiServiceProvider);
  final filters = ref.watch(propertyFiltersProvider);

  return apiService.getFiltered(filters);
}

@riverpod
class PropertyFiltersNotifier extends _$PropertyFiltersNotifier {
  @override
  PropertyFilters build() {
    return PropertyFilters.initial();
  }

  void updatePriceRange(List<double> range) {
    state = state.copyWith(priceRange: range);
  }

  void updateLocation(String location) {
    state = state.copyWith(location: location);
  }

  void reset() {
    state = PropertyFilters.initial();
  }
}
```

### 4.4 Widgets Stateless con Consumer
```dart
// lib/features/property/widgets/property.card.widget.dart
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
```

## 5. Testing Strategy
```dart
// test/features/property/providers/property.provider_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPropertyApiService extends Mock implements PropertyApiService {}

void main() {
  late MockPropertyApiService mockApiService;

  setUp(() {
    mockApiService = MockPropertyApiService();
  });

  test('PropertyNotifier loads properties correctly', () async {
    final container = ProviderContainer(
      overrides: [
        propertyApiServiceProvider.overrideWithValue(mockApiService),
      ],
    );

    when(mockApiService.getAll()).thenAnswer((_) async => [
      Property(id: '1', name: 'Test Property', price: 100000, location: 'Madrid'),
    ]);

    final notifier = container.read(propertyNotifierProvider.notifier);
    await notifier.loadProperties();

    final state = container.read(propertyNotifierProvider);
    expect(state.properties.length, 1);
    expect(state.properties.first.name, 'Test Property');
  });
}

// test/features/property/widgets/property.card.widget_test.dart
void main() {
  testWidgets('PropertyCard displays property info', (WidgetTester tester) async {
    final property = Property(
      id: '1',
      name: 'Test Property',
      price: 100000,
      location: 'Madrid',
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: PropertyCard(property: property),
          ),
        ),
      ),
    );

    expect(find.text('Test Property'), findsOneWidget);
    expect(find.text('\$100000.0'), findsOneWidget);
    expect(find.text('Madrid'), findsOneWidget);
  });
}
```

## 6. Integración con Navegación
```dart
// lib/core/router/app.router.dart
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

// lib/main.dart
void main() {
  runApp(
    ProviderScope(
      overrides: [
        // Providers globales
        configProvider.overrideWith((ref) => ConfigService()),
        authProvider.overrideWith((ref) => AuthNotifier(ref))),
        eventBusProvider.overrideWithValue(EventBus()),
      ],
      child: const MyApp(),
    ),
  );
}

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

Este plan proporciona una implementación completa y consistente de OMA en Flutter, asegurando modularidad, mantenibilidad y escalabilidad siguiendo los principios de la filosofía OMA.