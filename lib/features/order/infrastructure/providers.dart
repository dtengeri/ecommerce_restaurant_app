import 'package:ecommerce_restaurant_app/features/order/domain/order_repository.dart';
import 'package:ecommerce_restaurant_app/features/order/infrastructure/firestore_order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  return FirestoreOrderRepository();
}
