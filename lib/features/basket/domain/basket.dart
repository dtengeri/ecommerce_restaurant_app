import 'package:collection/collection.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_item.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket.freezed.dart';

@freezed
class Basket with _$Basket {
  const Basket._();
  const factory Basket({
    required List<BasketItem> items,
  }) = _Basket;

  double calculateTotalPrice(List<FoodItem> availableFoodItems) {
    return items.fold<double>(
      0,
      (previousValue, basketItem) {
        final foodItem = availableFoodItems.firstWhereOrNull(
          (foodItem) => foodItem.id == basketItem.foodItemId,
        );
        return previousValue + (foodItem?.price ?? 0) * basketItem.amount;
      },
    );
  }
}
