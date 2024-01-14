import 'package:ecommerce_restaurant_app/application.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/app_environment.dart';
import 'package:ecommerce_restaurant_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: Application(
        appEnvironment: AppEnvironment.production,
        firebaseOptions: DefaultFirebaseOptions.currentPlatform,
      ),
    ),
  );
}
