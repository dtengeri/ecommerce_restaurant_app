// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodItemHash() => r'87c33c554120108bff036c1f944f1408f9558d03';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [foodItem].
@ProviderFor(foodItem)
const foodItemProvider = FoodItemFamily();

/// See also [foodItem].
class FoodItemFamily extends Family<Option<FoodItem>> {
  /// See also [foodItem].
  const FoodItemFamily();

  /// See also [foodItem].
  FoodItemProvider call(
    String foodItemId,
  ) {
    return FoodItemProvider(
      foodItemId,
    );
  }

  @override
  FoodItemProvider getProviderOverride(
    covariant FoodItemProvider provider,
  ) {
    return call(
      provider.foodItemId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'foodItemProvider';
}

/// See also [foodItem].
class FoodItemProvider extends AutoDisposeProvider<Option<FoodItem>> {
  /// See also [foodItem].
  FoodItemProvider(
    String foodItemId,
  ) : this._internal(
          (ref) => foodItem(
            ref as FoodItemRef,
            foodItemId,
          ),
          from: foodItemProvider,
          name: r'foodItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodItemHash,
          dependencies: FoodItemFamily._dependencies,
          allTransitiveDependencies: FoodItemFamily._allTransitiveDependencies,
          foodItemId: foodItemId,
        );

  FoodItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.foodItemId,
  }) : super.internal();

  final String foodItemId;

  @override
  Override overrideWith(
    Option<FoodItem> Function(FoodItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodItemProvider._internal(
        (ref) => create(ref as FoodItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        foodItemId: foodItemId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Option<FoodItem>> createElement() {
    return _FoodItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodItemProvider && other.foodItemId == foodItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, foodItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FoodItemRef on AutoDisposeProviderRef<Option<FoodItem>> {
  /// The parameter `foodItemId` of this provider.
  String get foodItemId;
}

class _FoodItemProviderElement
    extends AutoDisposeProviderElement<Option<FoodItem>> with FoodItemRef {
  _FoodItemProviderElement(super.provider);

  @override
  String get foodItemId => (origin as FoodItemProvider).foodItemId;
}

String _$isFavouriteFoodHash() => r'f0d53bc27ad1efb55d0004d6f7982952fd766d4e';

/// See also [isFavouriteFood].
@ProviderFor(isFavouriteFood)
const isFavouriteFoodProvider = IsFavouriteFoodFamily();

/// See also [isFavouriteFood].
class IsFavouriteFoodFamily extends Family<bool> {
  /// See also [isFavouriteFood].
  const IsFavouriteFoodFamily();

  /// See also [isFavouriteFood].
  IsFavouriteFoodProvider call(
    String foodItemId,
  ) {
    return IsFavouriteFoodProvider(
      foodItemId,
    );
  }

  @override
  IsFavouriteFoodProvider getProviderOverride(
    covariant IsFavouriteFoodProvider provider,
  ) {
    return call(
      provider.foodItemId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFavouriteFoodProvider';
}

/// See also [isFavouriteFood].
class IsFavouriteFoodProvider extends AutoDisposeProvider<bool> {
  /// See also [isFavouriteFood].
  IsFavouriteFoodProvider(
    String foodItemId,
  ) : this._internal(
          (ref) => isFavouriteFood(
            ref as IsFavouriteFoodRef,
            foodItemId,
          ),
          from: isFavouriteFoodProvider,
          name: r'isFavouriteFoodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavouriteFoodHash,
          dependencies: IsFavouriteFoodFamily._dependencies,
          allTransitiveDependencies:
              IsFavouriteFoodFamily._allTransitiveDependencies,
          foodItemId: foodItemId,
        );

  IsFavouriteFoodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.foodItemId,
  }) : super.internal();

  final String foodItemId;

  @override
  Override overrideWith(
    bool Function(IsFavouriteFoodRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavouriteFoodProvider._internal(
        (ref) => create(ref as IsFavouriteFoodRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        foodItemId: foodItemId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavouriteFoodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavouriteFoodProvider && other.foodItemId == foodItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, foodItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFavouriteFoodRef on AutoDisposeProviderRef<bool> {
  /// The parameter `foodItemId` of this provider.
  String get foodItemId;
}

class _IsFavouriteFoodProviderElement extends AutoDisposeProviderElement<bool>
    with IsFavouriteFoodRef {
  _IsFavouriteFoodProviderElement(super.provider);

  @override
  String get foodItemId => (origin as IsFavouriteFoodProvider).foodItemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
