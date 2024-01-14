import 'package:ecommerce_restaurant_app/features/order/domain/order_failure.dart';

sealed class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderSaving extends OrderState {
  const OrderSaving();
}

class OrderSaved extends OrderState {
  const OrderSaved();
}

class OrderError extends OrderState {
  const OrderError({
    required this.failure,
  });

  final OrderFailure failure;
}
