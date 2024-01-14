import 'package:ecommerce_restaurant_app/features/core/domain/failure.dart';

sealed class FoodFailure extends Failure {
  const FoodFailure();
}

class FoodItemLoadFailure extends FoodFailure {
  const FoodItemLoadFailure();
}

class FavouriteFoodItemIdsLoadFailure extends FoodFailure {
  const FavouriteFoodItemIdsLoadFailure();
}
