// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:ecommerce_restaurant_app/features/basket/presentation/basket_screen.dart'
    as _i1;
import 'package:ecommerce_restaurant_app/features/foods/presentation/favourite_foods_screen.dart'
    as _i3;
import 'package:ecommerce_restaurant_app/features/foods/presentation/food_details_screen.dart'
    as _i4;
import 'package:ecommerce_restaurant_app/features/foods/presentation/food_list_screen.dart'
    as _i5;
import 'package:ecommerce_restaurant_app/features/foods/presentation/foods_screen.dart'
    as _i6;
import 'package:ecommerce_restaurant_app/features/order/presentation/checkout_screen.dart'
    as _i2;
import 'package:ecommerce_restaurant_app/features/splash/presentation/splash_screen.dart'
    as _i7;
import 'package:flutter/cupertino.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BasketRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BasketScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CheckoutScreen(),
      );
    },
    FavouriteFoodsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavouriteFoodsScreen(),
      );
    },
    FoodDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FoodDetailsRouteArgs>(
          orElse: () =>
              FoodDetailsRouteArgs(foodId: pathParams.getString('foodId')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FoodDetailsScreen(
          key: args.key,
          foodId: args.foodId,
        ),
      );
    },
    FoodListRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FoodListScreen(),
      );
    },
    FoodsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FoodsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasketScreen]
class BasketRoute extends _i8.PageRouteInfo<void> {
  const BasketRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CheckoutScreen]
class CheckoutRoute extends _i8.PageRouteInfo<void> {
  const CheckoutRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FavouriteFoodsScreen]
class FavouriteFoodsRoute extends _i8.PageRouteInfo<void> {
  const FavouriteFoodsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FavouriteFoodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteFoodsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FoodDetailsScreen]
class FoodDetailsRoute extends _i8.PageRouteInfo<FoodDetailsRouteArgs> {
  FoodDetailsRoute({
    _i9.Key? key,
    required String foodId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          FoodDetailsRoute.name,
          args: FoodDetailsRouteArgs(
            key: key,
            foodId: foodId,
          ),
          rawPathParams: {'foodId': foodId},
          initialChildren: children,
        );

  static const String name = 'FoodDetailsRoute';

  static const _i8.PageInfo<FoodDetailsRouteArgs> page =
      _i8.PageInfo<FoodDetailsRouteArgs>(name);
}

class FoodDetailsRouteArgs {
  const FoodDetailsRouteArgs({
    this.key,
    required this.foodId,
  });

  final _i9.Key? key;

  final String foodId;

  @override
  String toString() {
    return 'FoodDetailsRouteArgs{key: $key, foodId: $foodId}';
  }
}

/// generated route for
/// [_i5.FoodListScreen]
class FoodListRoute extends _i8.PageRouteInfo<void> {
  const FoodListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FoodListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodListRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FoodsScreen]
class FoodsRoute extends _i8.PageRouteInfo<void> {
  const FoodsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FoodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
