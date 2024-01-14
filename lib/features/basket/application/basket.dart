import 'package:collection/collection.dart';
import 'package:ecommerce_restaurant_app/features/auth/application/auth_controller.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_item.dart';
import 'package:ecommerce_restaurant_app/features/basket/infrastructure/providers.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basket.g.dart';

@Riverpod(keepAlive: true)
class UserBasket extends _$UserBasket {
  @override
  Stream<Basket> build() {
    final currentUserOption = ref.watch(currentUserProvider);
    if (currentUserOption case Some(value: final user)) {
      return ref.watch(basketRepositoryProvider).watch(user: user).map(
            (basketOrFailure) => basketOrFailure.fold(
              (_) => const Basket(items: []),
              (basket) => basket,
            ),
          );
    }
    return const Stream.empty();
  }

  Option<FoodItem> getFoodItem(BasketItem basketItem) {
    final foodListAsyncValue = ref.read(foodListProvider);
    if (foodListAsyncValue case AsyncData(value: final foodList)) {
      final foodItem = foodList.firstWhereOrNull(
        (foodItem) => foodItem.id == basketItem.foodItemId,
      );
      return optionOf(foodItem);
    }
    return none();
  }

  void addFoodItem({
    required FoodItem foodItem,
  }) {
    final currentUserOption = ref.read(currentUserProvider);
    if (currentUserOption case Some(value: final user)) {
      if (state case AsyncData(value: final basket)) {
        final basketItem = basket.items.firstWhereOrNull(
            (basketIem) => basketIem.foodItemId == foodItem.id);
        ref.read(basketRepositoryProvider).add(
              user: user,
              foodItem: foodItem,
              amount: (basketItem?.amount ?? 0) + 1,
            );
      }
    }
  }

  void removeFoodItem({
    required FoodItem foodItem,
  }) {
    final currentUserOption = ref.read(currentUserProvider);
    if (currentUserOption case Some(value: final user)) {
      ref.read(basketRepositoryProvider).remove(
            user: user,
            foodItem: foodItem,
          );
    }
  }
}

@Riverpod(keepAlive: true)
double basketTotalAmount(BasketTotalAmountRef ref) {
  final basketAsyncValue = ref.watch(userBasketProvider);
  final userBasket = ref.watch(userBasketProvider.notifier);

  if (basketAsyncValue case AsyncData(value: final basket)) {
    return basket.items.fold<double>(
      0,
      (previousValue, basketItem) {
        final foodItemOption = userBasket.getFoodItem(basketItem);
        return foodItemOption.fold(
          () => previousValue,
          (foodItem) => previousValue + foodItem.price * basketItem.amount,
        );
      },
    );
  }
  return 0;
}
