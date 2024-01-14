import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/auth/application/auth_controller.dart';
import 'package:ecommerce_restaurant_app/features/auth/domain/auth_state.dart';
import 'package:ecommerce_restaurant_app/routes/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter implements AutoRouteGuard {
  AppRouter({
    super.navigatorKey,
    required this.ref,
  });

  final Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authState = ref.read(authControllerProvider);
    if (authState is Unknown) {
      if (resolver.routeName == SplashRoute.name) {
        resolver.next();
        return;
      }
      resolver.redirect(const SplashRoute());
      return;
    }
    if (authState is Authenticated) {
      if (resolver.routeName == SplashRoute.name) {
        resolver.redirect(const FoodsRoute());
        return;
      }
      resolver.next();
    } else {
      if (resolver.routeName == SplashRoute.name) {
        resolver.next();
        return;
      }
      resolver.redirect(const SplashRoute());
    }
  }

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: SplashRoute.page,
        initial: true,
      ),
      AutoRoute(
        page: FoodsRoute.page,
        path: '/',
        children: [
          AutoRoute(
            path: 'foods',
            page: FoodListRoute.page,
          ),
          AutoRoute(
            path: 'favorites',
            page: FavouriteFoodsRoute.page,
          ),
        ],
      ),
      AutoRoute(
        path: '/food/:foodId',
        page: FoodDetailsRoute.page,
      ),
      AutoRoute(
        path: '/basket',
        page: BasketRoute.page,
      ),
      AutoRoute(
        path: '/checkout',
        page: CheckoutRoute.page,
      ),
    ];
  }
}

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) => AppRouter(
      ref: ref,
    );
