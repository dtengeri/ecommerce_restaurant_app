// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryAddressImpl _$$DeliveryAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAddressImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$DeliveryAddressImplToJson(
        _$DeliveryAddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'street': instance.street,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
