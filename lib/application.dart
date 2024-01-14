import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_restaurant_app/features/auth/application/auth_state_listenable.dart';
import 'package:ecommerce_restaurant_app/features/basket/application/basket.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/app_environment.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:ecommerce_restaurant_app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class Application extends ConsumerStatefulWidget {
  const Application({
    super.key,
    required this.appEnvironment,
    required this.firebaseOptions,
  });

  final AppEnvironment appEnvironment;
  final FirebaseOptions firebaseOptions;

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  Future<void>? _appLoader;
  final Logger _logger = Logger('Application');

  void _initializeLogging() {
    Logger.root.level = kDebugMode ? Level.ALL : Level.OFF;
  }

  void _initializeErrorHandlers() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      _logger.severe('Application error', details.exception, details.stack);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      _logger.severe('Application error', error, stack);
      return true;
    };
  }

  Future<void> _initialize() async {
    LocaleSettings.useDeviceLocale();
    await Firebase.initializeApp(
      options: widget.firebaseOptions,
    );
    if (widget.appEnvironment == AppEnvironment.development) {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    }
    _initializeLogging();
    _initializeErrorHandlers();
    ref.watch(userBasketProvider);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLoader ??= _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _appLoader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TranslationProvider(
            child: const _InitializedApplication(),
          );
        }
        return const CupertinoApp(
          home: CupertinoPageScaffold(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class _InitializedApplication extends ConsumerWidget {
  const _InitializedApplication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final authStateListenable = ref.watch(authStateListenableProvider);
    return CupertinoApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalCupertinoLocalizations.delegates,
      routerConfig: appRouter.config(
        reevaluateListenable: authStateListenable,
      ),
    );
  }
}
