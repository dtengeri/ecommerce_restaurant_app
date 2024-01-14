import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/basket/application/basket.dart';
import 'package:ecommerce_restaurant_app/features/basket/domain/basket_item.dart';
import 'package:ecommerce_restaurant_app/features/foods/domain/food_item.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:ecommerce_restaurant_app/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(Translations.of(context).basket.title),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Expanded(child: _BasketContent()),
            CupertinoButton.filled(
              onPressed: () {
                context.router.push(const CheckoutRoute());
              },
              child: Text(Translations.of(context).basket.checkout),
            ),
          ],
        ),
      ),
    );
  }
}

class _BasketContent extends ConsumerWidget {
  const _BasketContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basketAsyncValue = ref.watch(userBasketProvider);
    return switch (basketAsyncValue) {
      AsyncData(value: final basket) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: basket.items.length,
                itemBuilder: (context, index) => _BasketItem(
                  key: ValueKey(basket.items[index].id),
                  basketItem: basket.items[index],
                ),
              ),
            ),
            const _Total(),
          ],
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

class _BasketItem extends ConsumerWidget {
  const _BasketItem({
    super.key,
    required this.basketItem,
  });

  final BasketItem basketItem;

  Future<void> _confirmRemove(
      BuildContext context, WidgetRef ref, FoodItem foodItem) async {
    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(Translations.of(context).basket.confirmRemove),
        actions: [
          CupertinoDialogAction(
            child: Text(Translations.of(context).cancel),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          CupertinoDialogAction(
            child: Text(Translations.of(context).remove),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
    if (result == true) {
      ref.read(userBasketProvider.notifier).removeFoodItem(foodItem: foodItem);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemOption =
        ref.watch(userBasketProvider.notifier).getFoodItem(basketItem);

    return switch (foodItemOption) {
      Some(value: final foodItem) => CupertinoListTile.notched(
          onTap: () {
            context.router.push(
              FoodDetailsRoute(foodId: foodItem.id),
            );
          },
          title: Text(foodItem.name),
          subtitle: Text(
            '${foodItem.price} x ${basketItem.amount}',
          ),
          additionalInfo: Text(
            (foodItem.price * basketItem.amount).toString(),
          ),
          trailing: CupertinoButton(
            child: const Icon(CupertinoIcons.delete),
            onPressed: () {
              _confirmRemove(context, ref, foodItem);
            },
          ),
        ),
      None() => const SizedBox(),
    };
  }
}

class _Total extends ConsumerWidget {
  const _Total({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmount = ref.watch(basketTotalAmountProvider);
    return Row(
      children: [
        Expanded(
          child: Text(
            Translations.of(context).basket.total,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          totalAmount.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
