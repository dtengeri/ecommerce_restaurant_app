import 'package:ecommerce_restaurant_app/features/auth/domain/auth_failure.dart';
import 'package:ecommerce_restaurant_app/features/auth/domain/auth_state.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> signIn();
  Stream<AuthState> watch();
}
