import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/delivery_address.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/order_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class OrderRepository {
  Future<Either<FailedToSaveOrder, Unit>> order({
    required User user,
    required DeliveryAddress deliveryAddress,
    required Basket basket,
    required List<FoodItem> availableFoodItems,
  });
}
