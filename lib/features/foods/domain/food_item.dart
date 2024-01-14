import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    required String description,
    required double price,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}
