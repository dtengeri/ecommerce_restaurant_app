// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodListHash() => r'008081ede5f1d815e83348b937f637ac602b03c3';

/// See also [foodList].
@ProviderFor(foodList)
final foodListProvider = StreamProvider<List<FoodItem>>.internal(
  foodList,
  name: r'foodListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$foodListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FoodListRef = StreamProviderRef<List<FoodItem>>;
String _$visibleFoodListHash() => r'dcabf5f344d65444f8fd416103c9af7355826657';

/// See also [visibleFoodList].
@ProviderFor(visibleFoodList)
final visibleFoodListProvider =
    AutoDisposeProvider<AsyncValue<List<FoodItem>>>.internal(
  visibleFoodList,
  name: r'visibleFoodListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$visibleFoodListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VisibleFoodListRef = AutoDisposeProviderRef<AsyncValue<List<FoodItem>>>;
String _$favouriteFoodItemIdsHash() =>
    r'92fd368851c975de24a8ac28404d5b02ba940915';

/// See also [favouriteFoodItemIds].
@ProviderFor(favouriteFoodItemIds)
final favouriteFoodItemIdsProvider =
    AutoDisposeStreamProvider<List<String>>.internal(
  favouriteFoodItemIds,
  name: r'favouriteFoodItemIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favouriteFoodItemIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavouriteFoodItemIdsRef = AutoDisposeStreamProviderRef<List<String>>;
String _$visibleFavouriteFoodListHash() =>
    r'7fb8de9814002a01a159d99f906a5ca6798e4879';

/// See also [visibleFavouriteFoodList].
@ProviderFor(visibleFavouriteFoodList)
final visibleFavouriteFoodListProvider =
    AutoDisposeProvider<AsyncValue<List<FoodItem>>>.internal(
  visibleFavouriteFoodList,
  name: r'visibleFavouriteFoodListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$visibleFavouriteFoodListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VisibleFavouriteFoodListRef
    = AutoDisposeProviderRef<AsyncValue<List<FoodItem>>>;
String _$favouriteFoodListHash() => r'6cde7ba213ab89d32aab5ea6b5e4816290d541d4';

/// See also [FavouriteFoodList].
@ProviderFor(FavouriteFoodList)
final favouriteFoodListProvider = AutoDisposeNotifierProvider<FavouriteFoodList,
    AsyncValue<List<FoodItem>>>.internal(
  FavouriteFoodList.new,
  name: r'favouriteFoodListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favouriteFoodListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavouriteFoodList = AutoDisposeNotifier<AsyncValue<List<FoodItem>>>;
String _$foodItemSearchTermHash() =>
    r'066f61b8a63c3ac8292e515d088e968b7bae7ce0';

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

abstract class _$FoodItemSearchTerm
    extends BuildlessAutoDisposeNotifier<String> {
  late final SearchType searchType;

  String build(
    SearchType searchType,
  );
}

/// See also [FoodItemSearchTerm].
@ProviderFor(FoodItemSearchTerm)
const foodItemSearchTermProvider = FoodItemSearchTermFamily();

/// See also [FoodItemSearchTerm].
class FoodItemSearchTermFamily extends Family<String> {
  /// See also [FoodItemSearchTerm].
  const FoodItemSearchTermFamily();

  /// See also [FoodItemSearchTerm].
  FoodItemSearchTermProvider call(
    SearchType searchType,
  ) {
    return FoodItemSearchTermProvider(
      searchType,
    );
  }

  @override
  FoodItemSearchTermProvider getProviderOverride(
    covariant FoodItemSearchTermProvider provider,
  ) {
    return call(
      provider.searchType,
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
  String? get name => r'foodItemSearchTermProvider';
}

/// See also [FoodItemSearchTerm].
class FoodItemSearchTermProvider
    extends AutoDisposeNotifierProviderImpl<FoodItemSearchTerm, String> {
  /// See also [FoodItemSearchTerm].
  FoodItemSearchTermProvider(
    SearchType searchType,
  ) : this._internal(
          () => FoodItemSearchTerm()..searchType = searchType,
          from: foodItemSearchTermProvider,
          name: r'foodItemSearchTermProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodItemSearchTermHash,
          dependencies: FoodItemSearchTermFamily._dependencies,
          allTransitiveDependencies:
              FoodItemSearchTermFamily._allTransitiveDependencies,
          searchType: searchType,
        );

  FoodItemSearchTermProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchType,
  }) : super.internal();

  final SearchType searchType;

  @override
  String runNotifierBuild(
    covariant FoodItemSearchTerm notifier,
  ) {
    return notifier.build(
      searchType,
    );
  }

  @override
  Override overrideWith(FoodItemSearchTerm Function() create) {
    return ProviderOverride(
      origin: this,
      override: FoodItemSearchTermProvider._internal(
        () => create()..searchType = searchType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchType: searchType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FoodItemSearchTerm, String>
      createElement() {
    return _FoodItemSearchTermProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodItemSearchTermProvider &&
        other.searchType == searchType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FoodItemSearchTermRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `searchType` of this provider.
  SearchType get searchType;
}

class _FoodItemSearchTermProviderElement
    extends AutoDisposeNotifierProviderElement<FoodItemSearchTerm, String>
    with FoodItemSearchTermRef {
  _FoodItemSearchTermProviderElement(super.provider);

  @override
  SearchType get searchType =>
      (origin as FoodItemSearchTermProvider).searchType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
