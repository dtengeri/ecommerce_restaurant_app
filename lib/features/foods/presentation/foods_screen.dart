import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:ecommerce_restaurant_app/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  late final CupertinoTabController _cupertinoTabController =
      CupertinoTabController();

  @override
  void dispose() {
    _cupertinoTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AutoTabsScaffold(
      routes: const [
        FoodListRoute(),
        FavouriteFoodsRoute(),
      ],
      appBarBuilder: (context, tabsRouter) => CupertinoNavigationBar(
        middle: Text(t.foods.menu),
        trailing: CupertinoButton(
          onPressed: () {
            context.router.push(const BasketRoute());
          },
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.shopping_cart),
        ),
      ),
      bottomNavigationBuilder: (context, tabsRouter) => CupertinoTabBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.list_number),
            label: t.foods.menu,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.square_favorites),
            label: t.foods.favourites,
          ),
        ],
      ),
    );
  }
}
