import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_failure.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_item.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_repository.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:fpdart/fpdart.dart';

class FirestoreBasketRepository extends BasketRepository {
  late final _db = FirebaseFirestore.instance;

  @override
  Stream<Either<BasketLoadFailure, Basket>> watch({
    required User user,
  }) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('basket_items')
        .withConverter<BasketItem>(
          fromFirestore: _basketItemFromFirestore,
          toFirestore: _basketItemToFirestore,
        )
        .snapshots()
        .transform<Either<BasketLoadFailure, Basket>>(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(
              right(
                Basket(
                  items: data.docs.map((doc) => doc.data()).toList(),
                ),
              ),
            ),
            handleError: (error, stack, sink) => sink.add(
              left(const BasketLoadFailure()),
            ),
          ),
        );
  }

  @override
  Future<Either<BasketFailure, Unit>> add({
    required User user,
    required FoodItem foodItem,
    required int amount,
  }) async {
    await _db
        .collection('users')
        .doc(user.uid)
        .collection('basket_items')
        .withConverter<BasketItem>(
          fromFirestore: _basketItemFromFirestore,
          toFirestore: _basketItemToFirestore,
        )
        .doc(foodItem.id)
        .set(
          BasketItem(
            id: foodItem.id,
            foodItemId: foodItem.id,
            amount: amount,
          ),
        );
    return right(unit);
  }

  @override
  Future<Either<BasketFailure, Unit>> remove(
      {required User user, required FoodItem foodItem}) async {
    await _db
        .collection('users')
        .doc(user.uid)
        .collection('basket_items')
        .doc(foodItem.id)
        .delete();
    return right(unit);
  }
}

BasketItem _basketItemFromFirestore(
        DocumentSnapshot<Map<String, dynamic>> snapshot,
        SnapshotOptions? options) =>
    BasketItem.fromJson(snapshot.data() ?? {});

Map<String, dynamic> _basketItemToFirestore(
        BasketItem basketItem, SetOptions? options) =>
    basketItem.toJson();
