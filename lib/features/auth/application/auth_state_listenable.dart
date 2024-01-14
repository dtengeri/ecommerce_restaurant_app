import 'package:ecommerce_restaurant_app/features/auth/application/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_listenable.g.dart';

class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable();

  void authStateChanged() {
    notifyListeners();
  }
}

@riverpod
Listenable authStateListenable(AuthStateListenableRef ref) {
  final listenable = _AuthStateListenable();
  ref.listen(authControllerProvider, (previous, next) {
    listenable.authStateChanged();
  });
  return listenable;
}
