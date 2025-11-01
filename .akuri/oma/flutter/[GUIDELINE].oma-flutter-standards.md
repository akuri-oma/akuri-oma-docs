---
trigger: always_on
description: Guideline completo para implementar la filosofía OMA en Flutter, con reglas, patrones y ejemplos para desarrollo consistente.
status: active
use_case: [BUILD, AUDIT, REFACTOR]
---

# [GUIDELINE] OMA Flutter Standards

## 1. Propósito
Este guideline establece las reglas y patrones específicos para implementar la filosofía OMA en proyectos Flutter, asegurando consistencia, modularidad y mantenibilidad siguiendo los seis pilares fundamentales.

## 2. Reglas Generales

### 2.1 Arquitectura Modular
- **Cada feature** debe ser un conjunto independiente de providers, screens, widgets y services
- **Riverpod providers** scoped al feature cuando sea posible
- **Imports mínimos:** Solo importar lo estrictamente necesario
- **Dependencias explícitas:** Declarar todas las dependencias en providers

### 2.2 Nomenclatura Estandarizada
**Patrón de archivos:** `[feature].[description].[type].dart`

**Ejemplos válidos:**
- `property.create.screen.dart`
- `property.api.service.dart`
- `user.auth.provider.dart`

**Ejemplos inválidos:**
- `PropertyCreateScreen.dart` ❌ (PascalCase en archivo)
- `property.screen.dart` ❌ (Falta descripción específica)
- `createPropertyDTO.dart` ❌ (camelCase + abreviaturas)

## 3. Implementación por Pilar

### Pilar 1: Sistema de Nombres Estandarizado

#### Reglas de Nomenclatura
```dart
// ✅ CORRECTO
// Archivo: property.create.screen.dart
class PropertyCreateScreen extends ConsumerStatefulWidget {
  const PropertyCreateScreen({super.key});

  @override
  ConsumerState<PropertyCreateScreen> createState() => _PropertyCreateScreenState();
}

class _PropertyCreateScreenState extends ConsumerState<PropertyCreateScreen> {
  // Variables en camelCase
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Constantes con prefijo k o UPPER_SNAKE_CASE
  static const double kMaxPrice = 10000000.0;
  static const String defaultCurrency = 'USD';

  // Métodos en camelCase
  void onSubmit() {
    // Implementation
  }

  @override
  void initState() {
    super.initState();
    // Inicialización
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}

// Archivo: property.create.screen.dart (continuación)
@override
Widget build(BuildContext context, WidgetRef ref) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Create Property'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Property Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(
              labelText: 'Price',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    ),
  );
}

// ❌ INCORRECTO
// Archivo: PropertyCreateScreen.dart
class propertyCreateScreen extends StatefulWidget { // Nombres inconsistentes
  // Implementation
}
```

#### Convenciones por Tipo
- **Screens:** `[feature].[description].screen.dart` → `PropertyCreateScreen`
- **Widgets:** `[feature].[description].widget.dart` → `PropertyCardWidget`
- **Providers:** `[feature].[description].provider.dart` → `PropertyApiProvider`
- **Services:** `[feature].[description].service.dart` → `PropertyApiService`
- **Models:** `[feature].[description].model.dart` → `PropertyCreateModel`

### Pilar 2: Desacoplamiento/Modularidad

#### Estructura de Features
```dart
// lib/features/property/
├── models/
│   ├── property.model.dart
│   ├── property.create.dto.dart
│   └── property.filters.model.dart
├── providers/
│   ├── property.provider.dart          # Provider principal
│   ├── property.state.provider.dart    # Estado del feature
│   └── property.api.provider.dart      # API del feature
├── screens/
│   ├── property.list.screen.dart
│   └── property.create.screen.dart
├── widgets/
│   ├── property.card.widget.dart
│   └── property.form.widget.dart
└── services/
    └── property.api.service.dart

// ✅ CORRECTO - Providers scoped al feature
@riverpod
PropertyApiService propertyApiService(Ref ref) {
  final dio = ref.read(dioProvider);
  return PropertyApiService(dio);
}

@riverpod
class PropertyNotifier extends _$PropertyNotifier {
  @override
  PropertyState build() {
    // Estado específico del feature
    return PropertyState.initial();
  }

  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true);
    try {
      final api = ref.read(propertyApiServiceProvider);
      final properties = await api.getAll();
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

// ❌ INCORRECTO - Acoplamiento alto
@riverpod
class GlobalPropertyNotifier extends _$GlobalPropertyNotifier {
  // Provider global manejando múltiples features
  // Difícil de mantener y testear
}
```

#### Inyección de Dependencias con Riverpod
```dart
// ✅ Correcto - Dependencias explícitas
@riverpod
PropertyApiService propertyApiService(Ref ref) {
  final dio = ref.read(dioProvider);
  final config = ref.read(configProvider);

  return PropertyApiService(
    dio: dio,
    baseUrl: config.apiUrl,
  );
}

@riverpod
class PropertyNotifier extends _$PropertyNotifier {
  @override
  PropertyState build() {
    // Dependencias inyectadas automáticamente
    ref.watch(propertyApiServiceProvider);
    return PropertyState.initial();
  }
}

// ❌ Incorrecto - Dependencias implícitas
class PropertyService {
  // Singleton global - difícil de testear
  static final PropertyService _instance = PropertyService._internal();

  factory PropertyService() {
    return _instance;
  }

  PropertyService._internal();
}
```

### Pilar 3: Bus de Datos/Orquestación

#### Implementación del Event Bus
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

class PropertyUpdatedEvent extends Event {
  final Property property;
  final List<String> changes;
  const PropertyUpdatedEvent(this.property, this.changes);
}

class UserLoggedInEvent extends Event {
  final User user;
  const UserLoggedInEvent(this.user);
}

class PropertyFiltersChangedEvent extends Event {
  final PropertyFilters filters;
  const PropertyFiltersChangedEvent(this.filters);
}
```

#### Uso en Providers
```dart
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
    final api = ref.read(propertyApiServiceProvider);
    final property = await api.create(dto);

    // Emitir evento para otros features
    ref.read(eventBusProvider).emit(PropertyCreatedEvent(property));

    // Persistir en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last-created-property', jsonEncode(property.toJson()));

    state = state.copyWith(
      properties: [...state.properties, property],
    );
  }

  Future<void> updateProperty(String id, UpdatePropertyDto dto) async {
    final api = ref.read(propertyApiServiceProvider);
    final updatedProperty = await api.update(id, dto);

    // Calcular cambios para el evento
    final changes = _calculateChanges(state.properties.firstWhere((p) => p.id == id), updatedProperty);

    // Emitir evento con cambios
    ref.read(eventBusProvider).emit(PropertyUpdatedEvent(updatedProperty, changes));

    // Actualizar estado
    final updatedProperties = state.properties.map((p) =>
      p.id == id ? updatedProperty : p
    ).toList();

    state = state.copyWith(properties: updatedProperties);
  }

  List<String> _calculateChanges(Property oldProperty, Property newProperty) {
    final changes = <String>[];

    if (oldProperty.name != newProperty.name) changes.add('name');
    if (oldProperty.price != newProperty.price) changes.add('price');
    if (oldProperty.location != newProperty.location) changes.add('location');

    return changes;
  }
}
```

#### Suscripción en Widgets
```dart
class PropertyListScreen extends ConsumerStatefulWidget {
  const PropertyListScreen({super.key});

  @override
  ConsumerState<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends ConsumerState<PropertyListScreen> {
  StreamSubscription<Event>? _eventSubscription;

  @override
  void initState() {
    super.initState();
    _setupEventListeners();
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }

  void _setupEventListeners() {
    final eventBus = ref.read(eventBusProvider);

    _eventSubscription = eventBus.stream.listen((event) {
      if (event is PropertyCreatedEvent) {
        _onPropertyCreated(event.property);
      } else if (event is PropertyUpdatedEvent) {
        _onPropertyUpdated(event.property);
      }
    });
  }

  void _onPropertyCreated(Property property) {
    // Actualizar lista local
    setState(() {
      // Agregar propiedad a la lista
    });

    // Mostrar snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Property "${property.name}" created')),
    );
  }

  void _onPropertyUpdated(Property property) {
    // Actualizar propiedad en lista local
    setState(() {
      // Actualizar propiedad específica
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyNotifierProvider);

    if (propertyState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (propertyState.error != null) {
      return Center(
        child: Text('Error: ${propertyState.error}'),
      );
    }

    return ListView.builder(
      itemCount: propertyState.properties.length,
      itemBuilder: (context, index) {
        final property = propertyState.properties[index];
        return PropertyCard(property: property);
      },
    );
  }
}
```

### Pilar 4: Features Globales

#### Providers Globales Justificados
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

// lib/core/providers/dio.provider.dart
@riverpod
Dio dio(Ref ref) {
  final config = ref.read(configNotifierProvider);

  final dio = Dio(BaseOptions(
    baseUrl: config.apiUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  // Interceptors globales
  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(AuthInterceptor(ref));

  return dio;
}
```

#### Interceptors Globales
```dart
class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authState = _ref.read(authNotifierProvider);
    if (authState.user?.token != null) {
      options.headers['Authorization'] = 'Bearer ${authState.user!.token}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token expirado - logout automático
      _ref.read(authNotifierProvider.notifier).logout();
    }
    handler.next(err);
  }
}
```

### Pilar 5: Protocolo de Inicialización/Finalización

#### Lifecycle en Widgets
```dart
class PropertyCreateScreen extends ConsumerStatefulWidget {
  const PropertyCreateScreen({super.key});

  @override
  ConsumerState<PropertyCreateScreen> createState() => _PropertyCreateScreenState();
}

class _PropertyCreateScreenState extends ConsumerState<PropertyCreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  StreamSubscription<Event>? _eventSubscription;

  @override
  void initState() {
    super.initState();

    // 1. Inicializar controladores
    _initializeControllers();

    // 2. Configurar listeners de eventos
    _setupEventListeners();

    // 3. Cargar datos iniciales si es necesario
    _loadInitialData();
  }

  @override
  void dispose() {
    // 1. Cancelar subscriptions
    _eventSubscription?.cancel();

    // 2. Limpiar controladores
    _nameController.dispose();
    _priceController.dispose();

    // 3. Limpiar estado local
    _clearLocalState();

    // 4. Notificar salida del screen
    ref.read(eventBusProvider).emit(PropertyCreateScreenDisposedEvent());

    super.dispose();
  }

  void _initializeControllers() {
    // Cargar draft si existe
    final draft = ref.read(propertyStateNotifierProvider).draft;
    if (draft != null) {
      _nameController.text = draft.name ?? '';
      _priceController.text = draft.price?.toString() ?? '';
    }
  }

  void _setupEventListeners() {
    final eventBus = ref.read(eventBusProvider);

    _eventSubscription = eventBus.stream.listen((event) {
      if (event is GlobalResetEvent) {
        _resetScreen();
      }
    });
  }

  Future<void> _loadInitialData() async {
    // Cargar configuraciones necesarias
    final config = ref.read(configNotifierProvider);
    // ...
  }

  void _clearLocalState() {
    // Limpiar variables locales
  }

  void _resetScreen() {
    _nameController.clear();
    _priceController.clear();
    setState(() {
      // Reset state local
    });
  }

  void _onSubmit() {
    final name = _nameController.text.trim();
    final price = double.tryParse(_priceController.text);

    if (name.isEmpty || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
      return;
    }

    final dto = CreatePropertyDto(
      name: name,
      price: price,
      location: 'Default Location', // O pedir al usuario
    );

    ref.read(propertyNotifierProvider.notifier).createProperty(dto);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Property'),
        actions: [
          if (propertyState.isLoading)
            const CircularProgressIndicator()
          else
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _onSubmit,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Property Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Providers con Lifecycle
```dart
@riverpod
class PropertyStateNotifier extends _$PropertyStateNotifier {
  StreamSubscription<Event>? _eventSubscription;

  @override
  PropertyState build() {
    // Inicialización del feature
    _initializeFeature();

    // Cleanup automático
    ref.onDispose(() {
      _eventSubscription?.cancel();
      _persistState();
    });

    return PropertyState.initial();
  }

  Future<void> _initializeFeature() async {
    await _loadPersistedState();
    _setupEventListeners();
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

  void _setupEventListeners() {
    final eventBus = ref.read(eventBusProvider);

    _eventSubscription = eventBus.stream.listen((event) {
      if (event is UserLoggedInEvent) {
        // Reset filters cuando cambia el usuario
        state = state.copyWith(filters: PropertyFilters.initial());
      }
    });
  }

  Future<void> _persistState() async {
    final prefs = await SharedPreferences.getInstance();

    // Persistir filtros
    await prefs.setString('property-filters', jsonEncode(state.filters.toJson()));

    // Persistir propiedad seleccionada
    if (state.selectedProperty != null) {
      await prefs.setString('selected-property', jsonEncode(state.selectedProperty!.toJson()));
    }
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
```

### Pilar 6: Manejo Centralizado de Estado

#### Patrón de Estado con Freezed
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
    @Default(null) PartialProperty? draft,
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
      final api = ref.read(propertyApiServiceProvider);
      final properties = await api.getAll();
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

  void updateDraft(PartialProperty draft) {
    state = state.copyWith(draft: draft);
  }

  Property? saveDraft() {
    if (state.draft != null) {
      final property = Property.fromPartial(state.draft!);
      state = state.copyWith(draft: null);
      return property;
    }
    return null;
  }

  void clearDraft() {
    state = state.copyWith(draft: null);
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

#### Integración con Widgets
```dart
class PropertyListScreen extends ConsumerWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Estado reactivo
    final propertyState = ref.watch(propertyStateNotifierProvider);
    final propertyNotifier = ref.watch(propertyStateNotifierProvider.notifier);

    // Escuchar cambios en filtros
    ref.listen<PropertyState>(
      propertyStateNotifierProvider,
      (previous, next) {
        if (next.error != null && previous?.error == null) {
          // Mostrar error cuando aparece
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${next.error!}')),
          );
        }
      },
    );

    // Escuchar eventos globales
    ref.listen<EventBus>(
      eventBusProvider,
      (previous, next) {
        // Manejar eventos globales si es necesario
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => propertyNotifier.loadProperties(),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/properties/create'),
          ),
        ],
      ),
      body: propertyState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : propertyState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${propertyState.error!}'),
                      ElevatedButton(
                        onPressed: () => propertyNotifier.loadProperties(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: propertyState.properties.length,
                  itemBuilder: (context, index) {
                    final property = propertyState.properties[index];
                    return PropertyCard(property: property);
                  },
                ),
    );
  }
}
```

## 4. Patrones de Testing OMA

### Testing de Providers
```dart
// test/features/property/providers/property.provider_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPropertyApiService extends Mock implements PropertyApiService {}

void main() {
  late ProviderContainer container;
  late MockPropertyApiService mockApiService;

  setUp(() {
    mockApiService = MockPropertyApiService();

    container = ProviderContainer(
      overrides: [
        propertyApiServiceProvider.overrideWithValue(mockApiService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('PropertyNotifier loads properties correctly', () async {
    when(mockApiService.getAll()).thenAnswer((_) async => [
      Property(id: '1', name: 'Test Property', price: 100000, location: 'Madrid'),
    ]);

    final notifier = container.read(propertyNotifierProvider.notifier);
    await notifier.loadProperties();

    final state = container.read(propertyNotifierProvider);
    expect(state.properties.length, 1);
    expect(state.properties.first.name, 'Test Property');
    expect(state.isLoading, false);
  });

  test('PropertyNotifier handles errors', () async {
    when(mockApiService.getAll()).thenThrow(Exception('Network error'));

    final notifier = container.read(propertyNotifierProvider.notifier);
    await notifier.loadProperties();

    final state = container.read(propertyNotifierProvider);
    expect(state.error, 'Exception: Network error');
    expect(state.isLoading, false);
  });
}
```

### Testing de Widgets
```dart
// test/features/property/widgets/property.card.widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('PropertyCard displays property info', (WidgetTester tester) async {
    final property = Property(
      id: '1',
      name: 'Beautiful Apartment',
      price: 250000,
      location: 'Madrid, Spain',
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

    expect(find.text('Beautiful Apartment'), findsOneWidget);
    expect(find.text('\$250000.0'), findsOneWidget);
    expect(find.text('Madrid, Spain'), findsOneWidget);
  });

  testWidgets('PropertyCard navigates on tap', (WidgetTester tester) async {
    final property = Property(
      id: '1',
      name: 'Test Property',
      price: 100000,
      location: 'Test Location',
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Mock navigation si es necesario
        ],
        child: MaterialApp(
          home: Scaffold(
            body: PropertyCard(property: property),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(PropertyCard));
    await tester.pumpAndSettle();

    // Verificar navegación
    // expect(find.byType(PropertyDetailScreen), findsOneWidget);
  });
}
```

### Testing de Screens
```dart
// test/features/property/screens/property.create.screen_test.dart
void main() {
  testWidgets('PropertyCreateScreen creates property', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Mocks necesarios
        ],
        child: MaterialApp(
          home: PropertyCreateScreen(),
        ),
      ),
    );

    // Llenar formulario
    await tester.enterText(find.byType(TextField).first, 'Test Property');
    await tester.enterText(find.byType(TextField).last, '100000');

    // Presionar submit
    await tester.tap(find.byIcon(Icons.save));
    await tester.pump();

    // Verificar que se llamó al provider
    // verify(mockPropertyNotifier.createProperty(any)).called(1);
  });
}
```

## 5. Checklist de Auditoría OMA

### Checklist por Pilar
- **Pilar 1:** ¿Todos los archivos siguen patrón `[feature].[description].[type].dart`?
- **Pilar 2:** ¿Los providers están scoped apropiadamente (feature vs global)?
- **Pilar 3:** ¿Se usa EventBus con streams para comunicación entre features?
- **Pilar 4:** ¿Los providers globales están justificados con @Riverpod(keepAlive: true)?
- **Pilar 5:** ¿Se implementan initState/dispose con cleanup adecuado?
- **Pilar 6:** ¿El estado está centralizado con mutaciones controladas via notifiers?

### Checklist de Code Review
- [ ] Nombres de archivos consistentes con patrón OMA
- [ ] Providers usando @riverpod correctamente
- [ ] Estado inmutable con freezed
- [ ] EventBus usado para comunicación cross-feature
- [ ] Lifecycle hooks implementados en StatefulWidgets
- [ ] Streams cancelados en dispose
- [ ] Tests cubren providers, widgets y screens
- [ ] Null safety aplicado consistentemente
- [ ] Imports organizados y sin masivos

## 6. Scripts de Validación

### Validador de Nombres
```bash
#!/bin/bash
# validate-oma-flutter.sh

echo "🔍 Validando nomenclatura OMA para Flutter..."

find lib -name "*.dart" | while read file; do
  filename=$(basename "$file")
  name_without_ext="${filename%.*}"

  if [[ $name_without_ext =~ ^[a-z]+(\.[a-z]+)*\.[a-z]+$ ]]; then
    echo "✅ $file"
  else
    echo "❌ $file (patrón incorrecto)"
  fi
done
```

### Verificador de Providers
```bash
#!/bin/bash
# check-flutter-providers.sh

echo "🔍 Verificando providers en Flutter..."

# Buscar providers globales injustificados
grep -r "@Riverpod(keepAlive: true)" lib/ | grep -v "auth\|config\|event-bus\|logger" | while read line; do
  echo "⚠️  Provider global potencialmente injustificado: $line"
done
```

## 7. Referencias
- Ver `oma-philosophy.md` para fundamentos
- Ver `akuri.01-global-rules.md` para reglas generales
- Ver `akuri-workflow.master.md` para integración con workflows