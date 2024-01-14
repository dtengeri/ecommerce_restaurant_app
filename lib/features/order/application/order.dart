import 'package:ecommerce_restaurant_app/features/auth/application/auth_controller.dart';
import 'package:ecommerce_restaurant_app/features/basket/application/basket.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:ecommerce_restaurant_app/features/order/application/order_state.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/delivery_address.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/order_failure.dart';
import 'package:ecommerce_restaurant_app/features/order/infrastructure/providers.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  OrderState build() {
    return const OrderInitial();
  }

  Future<void> order(DeliveryAddress deliveryAddress) async {
    state = const OrderSaving();
    final currentUserOption = ref.read(currentUserProvider);
    final basketAsyncValue = ref.read(userBasketProvider);
    final foodListAsyncValue = ref.read(foodListProvider);
    if (currentUserOption case Some(value: final user)) {
      if (basketAsyncValue case AsyncData(value: final basket)) {
        if (foodListAsyncValue case AsyncData(value: final foodList)) {
          final successOrFailure =
              await ref.read(orderRepositoryProvider).order(
                    user: user,
                    basket: basket,
                    deliveryAddress: deliveryAddress,
                    availableFoodItems: foodList,
                  );
          successOrFailure.fold(
            (failure) {
              state = OrderError(failure: failure);
            },
            (_) {
              state = const OrderSaved();
            },
          );
          return;
        }
      }
    }
    state = const OrderError(failure: IncompleteDataForOrder());
  }
}
