import 'package:ecommerce_restaurant_app/features/foods/application/food_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodSearchField extends ConsumerWidget {
  const FoodSearchField({
    super.key,
    required this.searchType,
  });

  final SearchType searchType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoSearchTextField(
      onChanged: (searchTerm) {
        ref
            .read(foodItemSearchTermProvider(searchType).notifier)
            .updateSearchTerm(searchTerm);
      },
    );
  }
}
