import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:clothing_store/features/cart/domain/entities/cart_item.dart';
import 'package:clothing_store/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/resources.dart';
import '../../../cart/presentation/providers/cart.dart';
import '../../../shop/presentation/main/main_view.dart';
import 'checkout_viewmodel.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView(this.cartItems, {super.key});
  final List<CartItem> cartItems;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final cart = context.read<Cart>();
    final checkout = context.watch<CheckoutViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorManager.black),
            onPressed: () => Navigator.pop(context)),
        title: Text('Checkout', style: getSemiBoldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Address

              Text('Delivery Address', style: getSemiBoldTextStyle()),
              const SizedBox(height: 20),
              const DeliveryAddress(),
              const SizedBox(height: 30),
              //* Payment Method
              Text('Payment Method', style: getSemiBoldTextStyle()),
              const SizedBox(height: 20),
              // payment method widget
              for (var paymentGateway in checkout.paymentGateways) ...[
                PaymentMethod(
                  title: paymentGateway.name,
                  cardNumber: paymentGateway.number.toString(),
                  icon: paymentGateway.icon,
                  isSelected: checkout.selectedPaymentMethod ==
                      paymentGateway, // if selected
                  onPressed: () {
                    setState(() {
                      checkout.selectedPaymentMethod = paymentGateway;
                    });
                  },
                ),
                const SizedBox(height: 20)
              ],

              // * My Cart
              const SizedBox(height: 30),
              // Text('My Cart', style: getSemiBoldTextStyle()),
              // const SizedBox(height: 20),
              // list view builder of checkout cart item
              // SizedBox(
              //   height: 90,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: cart.cartItems.length,
              //       itemBuilder: (context, index) {
              //         return _CheckoutCartItem(cart.cartItems[index]);
              //       }),
              // ),
              // total
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: getSemiBoldTextStyle()),
                  Text('Rs. ${cart.totalPrice}', style: getSemiBoldTextStyle()),
                ],
              ),
              // checkout button
              const SizedBox(height: 40),
              // pay now
              CustomButton(
                title: 'Pay Now',
                onPressed: () async {
                  if (checkout.validate(context)) {
                    (await checkout.addOrder(widget.cartItems)).fold(
                        (l) => ScaffoldMessenger.of(context).showSnackBar(
                            getErrorSnackbar(
                                'An error occurred. ${l.message}', context)),
                        (r) => {
                              getSuccessFlushbar('Order placed!', context),
                              // clear cart
                              cart.clearCart(),
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainView()),
                                    (route) => true);
                              })
                            }
                        // navigate to main view
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckoutCartItem extends StatelessWidget {
  const _CheckoutCartItem(this.cartItem);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              cartItem.product.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 100,
              child: Text(cartItem.product.name,
                  maxLines: 2,
                  style: getMediumTextStyle(
                    size: 16,
                  )),
            ),
            const SizedBox(height: 10),
            Text('Rs. ${cartItem.product.price.toStringAsFixed(2)}',
                style: getMediumTextStyle(size: 16, color: ColorManager.grey)),
          ],
        ),
      ],
    );
  }
}

// paymentmethod with apple pay, master card with logos
class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    required this.title,
    required this.cardNumber,
    this.isSelected = false,
    required this.icon,
    this.onPressed,
    this.showSelect = true,
    super.key,
  });
  final IconData icon;
  final String title;
  final String cardNumber;
  final bool isSelected;
  final VoidCallback? onPressed;
  final bool showSelect;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.black)),
          child: Icon(icon, color: ColorManager.black, size: 40),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, maxLines: 2, style: getSemiBoldTextStyle()),
            const SizedBox(height: 5),
            Text('**** **** **** $cardNumber', style: getRegularTextStyle()),
          ],
        ),
        const Spacer(),
        if (showSelect)
          Checkbox(
              // padding

              value: isSelected,
              onChanged: (_) {
                onPressed!();
              },
              shape: const CircleBorder(),
              activeColor: ColorManager.accent),
      ],
    );
  }
}

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkout = context.read<CheckoutViewModel>();
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.black)),
          child:
              const Icon(Icons.location_on_outlined, color: ColorManager.black),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(checkout.deliveryAddress.address,
                maxLines: 2, style: getSemiBoldTextStyle()),
            const SizedBox(height: 5),
            Text(checkout.deliveryAddress.city,
                style: getRegularTextStyle().copyWith()),
          ],
        ),
      ],
    );
  }
}
