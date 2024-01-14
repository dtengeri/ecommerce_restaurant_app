import 'dart:async';

import 'package:ecommerce_restaurant_app/features/auth/domain/auth_state.dart';
import 'package:ecommerce_restaurant_app/features/auth/infrastructure/providers.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  StreamSubscription<AuthState>? _authStateChangesSubscription;

  @override
  AuthState build() {
    ref.onDispose(() {
      _authStateChangesSubscription?.cancel();
    });
    _signIn();
    return const Unknown();
  }

  Future<void> _signIn() async {
    final successOrFailure = await ref.watch(authRepositoryProvider).signIn();
    successOrFailure.fold(
      (failure) {
        state = const Unknown();
      },
      (_) {},
    );
  }

  void watch() {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        ref.watch(authRepositoryProvider).watch().listen(
      (authState) {
        state = authState;
      },
    );
  }
}

@Riverpod(keepAlive: true)
Option<User> currentUser(CurrentUserRef ref) {
  final authState = ref.watch(authControllerProvider);
  return switch (authState) {
    Authenticated(:final user) => some(user),
    _ => none(),
  };
}
