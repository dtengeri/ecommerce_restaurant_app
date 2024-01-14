import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/delivery_address.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/order_failure.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/order_repository.dart';
import 'package:fpdart/fpdart.dart';

class FirestoreOrderRepository extends OrderRepository {
  late final _db = FirebaseFirestore.instance;

  @override
  Future<Either<FailedToSaveOrder, Unit>> order({
    required User user,
    required DeliveryAddress deliveryAddress,
    required Basket basket,
    required List<FoodItem> availableFoodItems,
  }) async {
    final orderRef = _db
        .collection('orders')
        .doc(user.uid)
        .collection('order_details')
        .doc();
    final basketItemRefs = basket.items
        .map((basketItem) => _db
            .collection('users')
            .doc(user.uid)
            .collection('basket_items')
            .doc(basketItem.id))
        .toList();
    try {
      final items = {};
      for (var basketItem in basket.items) {
        items[basketItem.id] = basketItem.amount;
      }
      await _db.runTransaction((transaction) async {
        transaction.set(orderRef, {
          'deliveryAddress': deliveryAddress.toJson(),
          'foodItems': items,
          'totalPrice': basket.calculateTotalPrice(availableFoodItems),
          'orderedAt': DateTime.now().toUtc(),
        });
        for (final basketItemRef in basketItemRefs) {
          transaction.delete(basketItemRef);
        }
      });
      return right(unit);
    } catch (e) {
      return left(const FailedToSaveOrder());
    }
  }
}
