// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$basketTotalAmountHash() => r'7acbdb6730639a2c08990108fbcc4585bc3105a3';

/// See also [basketTotalAmount].
@ProviderFor(basketTotalAmount)
final basketTotalAmountProvider = Provider<double>.internal(
  basketTotalAmount,
  name: r'basketTotalAmountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$basketTotalAmountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BasketTotalAmountRef = ProviderRef<double>;
String _$userBasketHash() => r'7404ba57d281aa643a755dd85b3bfea7dd75cd93';

/// See also [UserBasket].
@ProviderFor(UserBasket)
final userBasketProvider = StreamNotifierProvider<UserBasket, Basket>.internal(
  UserBasket.new,
  name: r'userBasketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userBasketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserBasket = StreamNotifier<Basket>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
