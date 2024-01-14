import 'package:ecommerce_restaurant_app/features/core/domain/failure.dart';

sealed class BasketFailure extends Failure {
  const BasketFailure();
}

class BasketLoadFailure extends BasketFailure {
  const BasketLoadFailure();
}
