import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_details.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

@RoutePage()
class FoodDetailsScreen extends ConsumerWidget {
  const FoodDetailsScreen({
    super.key,
    @PathParam('foodId') required this.foodId,
  });

  final String foodId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemOption = ref.watch(foodItemProvider(foodId));
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: switch (foodItemOption) {
        Some(value: final foodItem) => _FoodItemDetails(
            foodItem: foodItem,
          ),
        None() => const _FoodItemNotFound(),
      },
    );
  }
}

class _FoodItemDetails extends ConsumerWidget {
  const _FoodItemDetails({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(isFavouriteFoodProvider(foodItem.id));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Align(
            child: Text(
              foodItem.name,
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
          Align(
            child: Text(
              foodItem.price.toString(),
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
          ),
          Text(foodItem.description),
          if (isFavourite)
            CupertinoButton(
              child: Text(Translations.of(context).foodDetails.removeFavourite),
              onPressed: () {
                ref.read(favouriteFoodListProvider.notifier).remove(foodItem);
              },
            ),
          if (!isFavourite)
            CupertinoButton(
              child: Text(Translations.of(context).foodDetails.addFavourite),
              onPressed: () {
                ref.read(favouriteFoodListProvider.notifier).add(foodItem);
              },
            ),
        ],
      ),
    );
  }
}

class _FoodItemNotFound extends StatelessWidget {
  const _FoodItemNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Translations.of(context).failedToLoad,
      ),
    );
  }
}
