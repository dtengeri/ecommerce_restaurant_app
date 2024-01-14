import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_failure.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:fpdart/fpdart.dart';

abstract class BasketRepository {
  Stream<Either<BasketLoadFailure, Basket>> watch({
    required User user,
  });

  Future<Either<BasketFailure, Unit>> add({
    required User user,
    required FoodItem foodItem,
    required int amount,
  });

  Future<Either<BasketFailure, Unit>> remove({
    required User user,
    required FoodItem foodItem,
  });
}
