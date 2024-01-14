import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_restaurant_app/features/order/application/order.dart';
import 'package:ecommerce_restaurant_app/features/order/application/order_state.dart';
import 'package:ecommerce_restaurant_app/features/order/domain/delivery_address.dart';
import 'package:ecommerce_restaurant_app/i18n/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(orderControllerProvider.notifier).order(
            DeliveryAddress(
              name: _nameController.text,
              phoneNumber: _phoneNumberController.text,
              street: _streetController.text,
              city: _cityController.text,
              postalCode: _postalCodeController.text,
            ),
          );
    }
  }

  void _handleOrderResult(OrderState? previousState, OrderState state) {
    final t = Translations.of(context);
    switch (state) {
      case OrderSaved():
        context.router.pop();
      case OrderError():
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(Translations.of(context).checkout.title),
            content: Text(t.checkout.error),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(Translations.of(context).ok),
              ),
            ],
          ),
        );
      default:
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isOrderSaving = ref.watch(orderControllerProvider) is OrderSaving;
    ref.listen<OrderState>(orderControllerProvider, _handleOrderResult);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(t.checkout.title),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _Textfield(
                  controller: _nameController,
                  placeholder: t.checkout.deliveryAddress.name,
                  validationMessage: t.checkout.deliveryAddress.nameIsRequired,
                ),
                _Textfield(
                  controller: _phoneNumberController,
                  placeholder: t.checkout.deliveryAddress.phoneNumber,
                  validationMessage:
                      t.checkout.deliveryAddress.phoneNumberIsRequired,
                ),
                _Textfield(
                  controller: _streetController,
                  placeholder: t.checkout.deliveryAddress.street,
                  validationMessage:
                      t.checkout.deliveryAddress.streetIsRequired,
                ),
                _Textfield(
                  controller: _cityController,
                  placeholder: t.checkout.deliveryAddress.city,
                  validationMessage: t.checkout.deliveryAddress.cityIsRequired,
                ),
                _Textfield(
                  controller: _postalCodeController,
                  placeholder: t.checkout.deliveryAddress.postalCode,
                  validationMessage:
                      t.checkout.deliveryAddress.postalCodeIsRequired,
                ),
                const Spacer(),
                CupertinoButton.filled(
                  onPressed: isOrderSaving ? null : _submit,
                  child: Text(t.checkout.title),
                ),
              ],
            ),
          ),
        )));
  }
}

class _Textfield extends StatelessWidget {
  const _Textfield({
    super.key,
    required this.placeholder,
    required this.validationMessage,
    required this.controller,
  });

  final String placeholder;
  final String validationMessage;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: controller,
      placeholder: placeholder,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }
}
