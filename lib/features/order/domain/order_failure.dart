import 'package:ecommerce_restaurant_app/features/core/domain/failure.dart';

sealed class OrderFailure extends Failure {
  const OrderFailure();
}

class FailedToSaveOrder extends OrderFailure {
  const FailedToSaveOrder();
}

class IncompleteDataForOrder extends OrderFailure {
  const IncompleteDataForOrder();
}
