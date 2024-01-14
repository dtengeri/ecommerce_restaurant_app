import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:ecommerce_restaurant_app/features/foods/presentation/food_list_item.dart';
import 'package:ecommerce_restaurant_app/features/foods/presentation/food_search_field.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            FoodSearchField(searchType: SearchType.all),
            Expanded(child: _FoodList()),
          ],
        ),
      ),
    );
  }
}

class _FoodList extends ConsumerWidget {
  const _FoodList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodListAsyncValue = ref.watch(visibleFoodListProvider);
    return switch (foodListAsyncValue) {
      AsyncData(value: final foodList) => ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) => FoodListItem(
            key: ValueKey(foodList[index].id),
            foodItem: foodList[index],
          ),
        ),
      AsyncError() => Center(
          child: Text(Translations.of(context).failedToLoad),
        ),
      _ => const Center(
          child: CupertinoActivityIndicator(),
        ),
    };
  }
}
