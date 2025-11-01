---
trigger: pattern
description: Patrón funcional para gestión de estado en Flutter usando Provider.
---

# PATTERN: State Management (Flutter)

## Descripción
Patrón para manejar estado en Flutter con Provider, notificando cambios a widgets.

## Cuándo Usar
- Para apps con estado compartido (usuario, datos globales).
- Cuando se requiere reactividad sin complejidad de BLoC.

## Snippet de Código
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  String _userName = '';

  String get userName => _userName;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        home: Consumer<AppState>(
          builder: (context, state, child) {
            return Text('User: ${state.userName}');
          },
        ),
      ),
    );
  }
}
```

## Parámetros
- `AppState`: Clase que extiende ChangeNotifier.
- Métodos para actualizar estado y llamar notifyListeners().

## Ejemplo de Uso
Para estado de productos: `ProductState` con lista de productos.

## Caveats
- Para apps grandes, considerar Riverpod o BLoC.
- Evitar over-notify para performance.