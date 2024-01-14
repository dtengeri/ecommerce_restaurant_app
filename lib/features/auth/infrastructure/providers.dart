import 'package:ecommerce_restaurant_app/features/auth/domain/auth_repository.dart';
import 'package:ecommerce_restaurant_app/features/auth/infrastructure/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    FirebaseAuthRepository();
