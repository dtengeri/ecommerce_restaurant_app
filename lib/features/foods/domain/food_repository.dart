import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_failure.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:fpdart/fpdart.dart';

abstract class FoodRepository {
  Stream<Either<FoodFailure, List<FoodItem>>> watchAll();
  Stream<Either<FoodFailure, List<String>>> watchFavouriteFoodItemIds({
    required User user,
  });
  Future<Either<FoodFailure, Unit>> markAsFavourite({
    required User user,
    required FoodItem foodItem,
  });
  Future<Either<FoodFailure, Unit>> markAsNotFavourite({
    required User user,
    required FoodItem foodItem,
  });
}
