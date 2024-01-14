import 'package:collection/collection.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_details.g.dart';

@riverpod
Option<FoodItem> foodItem(FoodItemRef ref, String foodItemId) {
  final foodListAsyncValue = ref.watch(foodListProvider);
  if (foodListAsyncValue case AsyncData(value: final foodList)) {
    final foodItem = foodList.firstWhereOrNull(
      (foodItem) => foodItem.id == foodItemId,
    );
    return optionOf(foodItem);
  }
  return none();
}

@riverpod
bool isFavouriteFood(IsFavouriteFoodRef ref, String foodItemId) {
  final favouriteFoodListAsyncValue = ref.watch(favouriteFoodListProvider);
  if (favouriteFoodListAsyncValue
      case AsyncData(value: final favouriteFoodList)) {
    return favouriteFoodList.any(
      (foodItem) => foodItem.id == foodItemId,
    );
  }
  return false;
}
