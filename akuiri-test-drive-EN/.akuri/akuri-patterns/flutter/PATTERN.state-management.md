---
trigger: pattern
description: Functional pattern for state management in Flutter using Provider.
---

# PATTERN: State Management (Flutter)

## Description
Pattern to handle state in Flutter with Provider, notifying changes to widgets.

## When to Use
- For apps with shared state (user, global data).
- When reactivity is required without BLoC complexity.

## Code Snippet
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

## Parameters
- `AppState`: Class that extends ChangeNotifier.
- Methods to update state and call notifyListeners().

## Usage Example
For product state: `ProductState` with product list.

## Caveats
- For large apps, consider Riverpod or BLoC.
- Avoid over-notify for performance.