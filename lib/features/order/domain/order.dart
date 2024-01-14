import 'package:ecommerce_restaurant_app/features/basket/domain/basket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String userId,
    required Basket basket,
  }) = _Order;
}
