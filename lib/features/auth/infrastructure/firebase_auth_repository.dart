import 'dart:async';

import 'package:ecommerce_restaurant_app/features/auth/domain/auth_failure.dart';
import 'package:ecommerce_restaurant_app/features/auth/domain/auth_repository.dart';
import 'package:ecommerce_restaurant_app/features/auth/domain/auth_state.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart'
    as core;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepository extends AuthRepository {
  @override
  Future<Either<AuthFailure, Unit>> signIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        return left(const LoginFailed());
      } else {
        return left(const UnknownAuthFailure());
      }
    }
  }

  @override
  Stream<AuthState> watch() {
    return FirebaseAuth.instance.userChanges().map((user) {
      if (user == null) {
        return const Unauthenticated();
      } else {
        return Authenticated(
          user: core.User(
            uid: user.uid,
          ),
        );
      }
    });
  }
}
