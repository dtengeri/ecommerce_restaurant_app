import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_item.freezed.dart';
part 'basket_item.g.dart';

@freezed
class BasketItem with _$BasketItem {
  const factory BasketItem({
    required String id,
    required String foodItemId,
    required int amount,
  }) = _BasketItem;

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);
}
