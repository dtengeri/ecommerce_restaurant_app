import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_restaurant_app/features/core/domain/user.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_failure.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_repository.dart';
import 'package:fpdart/fpdart.dart';

class FirestoreFoodRepository extends FoodRepository {
  late final _db = FirebaseFirestore.instance;

  @override
  Stream<Either<FoodFailure, List<FoodItem>>> watchAll() {
    return _db
        .collection('food_items')
        .withConverter<FoodItem>(
            fromFirestore: (snapshot, options) =>
                FoodItem.fromJson(snapshot.data() ?? {}),
            toFirestore: (foodItem, options) => foodItem.toJson())
        .snapshots()
        .transform<Either<FoodFailure, List<FoodItem>>>(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) {
              sink.add(
                right(data.docs.map((doc) => doc.data()).toList()),
              );
            },
            handleError: (error, stack, sink) => sink.add(
              left(const FoodItemLoadFailure()),
            ),
          ),
        );
  }

  @override
  Stream<Either<FoodFailure, List<String>>> watchFavouriteFoodItemIds({
    required User user,
  }) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('favourite_foods')
        .snapshots()
        .transform<Either<FoodFailure, List<String>>>(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(
              right(data.docs
                  .map((doc) => doc.data()['foodItemId'].toString())
                  .toList()),
            ),
            handleError: (error, stack, sink) => sink.add(
              left(const FavouriteFoodItemIdsLoadFailure()),
            ),
          ),
        );
  }

  @override
  Future<Either<FoodFailure, Unit>> markAsFavourite({
    required User user,
    required FoodItem foodItem,
  }) async {
    await _db
        .collection('users')
        .doc(user.uid)
        .collection('favourite_foods')
        .doc(foodItem.id)
        .set(
      {
        'foodItemId': foodItem.id,
      },
    );
    return right(unit);
  }

  @override
  Future<Either<FoodFailure, Unit>> markAsNotFavourite(
      {required User user, required FoodItem foodItem}) async {
    await _db
        .collection('users')
        .doc(user.uid)
        .collection('favourite_foods')
        .doc(foodItem.id)
        .delete();
    return right(unit);
  }
}
