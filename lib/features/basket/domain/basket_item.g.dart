// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketItemImpl _$$BasketItemImplFromJson(Map<String, dynamic> json) =>
    _$BasketItemImpl(
      id: json['id'] as String,
      foodItemId: json['foodItemId'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$BasketItemImplToJson(_$BasketItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodItemId': instance.foodItemId,
      'amount': instance.amount,
    };
