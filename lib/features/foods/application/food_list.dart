import 'package:ecommerce_restaurant_app/features/auth/application/auth_controller.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/features/foods/infrastruture/providers.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_list.g.dart';

@Riverpod(keepAlive: true)
Stream<List<FoodItem>> foodList(FoodListRef ref) {
  return ref.watch(foodRepositoryProvider).watchAll().map(
        (foodItemsOrFailure) => foodItemsOrFailure.fold(
          (_) => <FoodItem>[],
          (foodItems) {
            return foodItems;
          },
        ),
      );
}

@riverpod
AsyncValue<List<FoodItem>> visibleFoodList(VisibleFoodListRef ref) {
  final searchTerm = ref.watch(foodItemSearchTermProvider(SearchType.all));
  final foodListAsyncValue = ref.watch(foodListProvider);
  switch (foodListAsyncValue) {
    case AsyncData(value: final foodList):
      if (searchTerm.isEmpty) {
        return AsyncValue.data(foodList);
      }
      return AsyncValue.data(
        foodList
            .where(
              (foodItem) => foodItem.name.toLowerCase().contains(
                    searchTerm.toLowerCase(),
                  ),
            )
            .toList(),
      );
    case _:
      return foodListAsyncValue;
  }
}

@riverpod
Stream<List<String>> favouriteFoodItemIds(FavouriteFoodItemIdsRef ref) {
  final currentUserOption = ref.watch(currentUserProvider);
  if (currentUserOption case Some(value: final user)) {
    return ref
        .watch(foodRepositoryProvider)
        .watchFavouriteFoodItemIds(
          user: user,
        )
        .map((foodItemIdsOrFailure) => foodItemIdsOrFailure.fold(
              (_) => [],
              (foodItemIds) => foodItemIds,
            ));
  }
  return const Stream.empty();
}

@riverpod
class FavouriteFoodList extends _$FavouriteFoodList {
  @override
  AsyncValue<List<FoodItem>> build() {
    final allFoodItemsAsyncValue = ref.watch(foodListProvider);
    final favouriteFoodItemIdsAsyncValue =
        ref.watch(favouriteFoodItemIdsProvider);

    if (allFoodItemsAsyncValue is AsyncLoading ||
        favouriteFoodItemIdsAsyncValue is AsyncLoading) {
      return const AsyncValue.loading();
    }
    if (allFoodItemsAsyncValue is AsyncError ||
        favouriteFoodItemIdsAsyncValue is AsyncError) {
      return AsyncValue.error(
        allFoodItemsAsyncValue.error ??
            favouriteFoodItemIdsAsyncValue.error ??
            '',
        StackTrace.current,
      );
    }
    if (allFoodItemsAsyncValue case AsyncData(value: final allFoodItems)) {
      if (favouriteFoodItemIdsAsyncValue
          case AsyncData(value: final favouriteFoodItemIds)) {
        return AsyncValue.data(allFoodItems
            .where(
              (foodItem) => favouriteFoodItemIds.contains(foodItem.id),
            )
            .toList());
      }
    }
    return const AsyncValue.data([]);
  }

  void add(FoodItem foodItem) {
    final currentUserOption = ref.read(currentUserProvider);
    if (currentUserOption case Some(value: final user)) {
      ref.read(foodRepositoryProvider).markAsFavourite(
            user: user,
            foodItem: foodItem,
          );
    }
  }

  void remove(FoodItem foodItem) {
    final currentUserOption = ref.read(currentUserProvider);
    if (currentUserOption case Some(value: final user)) {
      ref.read(foodRepositoryProvider).markAsNotFavourite(
            user: user,
            foodItem: foodItem,
          );
    }
  }
}

@riverpod
AsyncValue<List<FoodItem>> visibleFavouriteFoodList(VisibleFoodListRef ref) {
  final searchTerm =
      ref.watch(foodItemSearchTermProvider(SearchType.favourite));
  final favouriteFoodListAsyncValue = ref.watch(favouriteFoodListProvider);
  switch (favouriteFoodListAsyncValue) {
    case AsyncData(value: final foodList):
      if (searchTerm.isEmpty) {
        return AsyncValue.data(foodList);
      }
      return AsyncValue.data(
        foodList
            .where(
              (foodItem) => foodItem.name.toLowerCase().contains(
                    searchTerm.toLowerCase(),
                  ),
            )
            .toList(),
      );
    case _:
      return favouriteFoodListAsyncValue;
  }
}

enum SearchType {
  all,
  favourite,
}

@riverpod
class FoodItemSearchTerm extends _$FoodItemSearchTerm {
  @override
  String build(SearchType searchType) {
    return '';
  }

  void updateSearchTerm(String searchTerm) {
    state = searchTerm;
  }
}
