import 'package:ecommerce_restaurant_app/features/core/domain/failure.dart';

sealed class AuthFailure extends Failure {
  const AuthFailure();
}

class LoginFailed extends AuthFailure {
  const LoginFailed();
}

class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure();
}
