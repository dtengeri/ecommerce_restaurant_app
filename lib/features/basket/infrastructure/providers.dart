import 'package:ecommerce_restaurant_app/features/basket/domain/basket_repository.dart';
import 'package:ecommerce_restaurant_app/features/basket/infrastructure/firestore_basket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
BasketRepository basketRepository(BasketRepositoryRef ref) {
  return FirestoreBasketRepository();
}
