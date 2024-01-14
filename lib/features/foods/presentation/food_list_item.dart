import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/basket/application/basket.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:ecommerce_restaurant_app/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodListItem extends ConsumerWidget {
  const FoodListItem({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListTile.notched(
      onTap: () {
        context.router.push(
          FoodDetailsRoute(foodId: foodItem.id),
        );
      },
      title: Text(foodItem.name),
      subtitle: Text(
        foodItem.price.toString(),
      ),
      trailing: CupertinoButton.filled(
        child: Text(Translations.of(context).foods.buy),
        onPressed: () {
          ref.read(userBasketProvider.notifier).addFoodItem(foodItem: foodItem);
        },
      ),
    );
  }
}
