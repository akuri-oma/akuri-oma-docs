---
trigger: pattern
description: Patron fonctionnel pour gestion d'état en Flutter utilisant Provider.
---

# PATTERN : State Management (Flutter)

## Description
Patron pour gérer état en Flutter avec Provider, notifiant changements aux widgets.

## Quand Utiliser
- Pour apps avec état partagé (utilisateur, données globales).
- Quand réactivité sans complexité de BLoC est requise.

## Snippet de Code
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

## Paramètres
- `AppState` : Classe qui étend ChangeNotifier.
- Méthodes pour mettre à jour état et appeler notifyListeners().

## Exemple d'Usage
Pour état de produits : `ProductState` avec liste de produits.

## Caveats
- Pour apps grandes, considérer Riverpod ou BLoC.
- Éviter over-notify pour performance.