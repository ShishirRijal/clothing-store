import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/resources.dart';
import '../../../checkout/presentation/checkout/checkout_view.dart';
import '../../../checkout/presentation/checkout/checkout_viewmodel.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('My Cart', style: getSemiBoldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // * Cart Items
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomCartItem(cart.cartItems[index]);
                },
                separatorBuilder: (context, _) => const SizedBox(height: 20),
                itemCount: cart.cartItems.length,
              ),

              // * Promo Code
              const SizedBox(height: 40),
              const PromoCode(),
              const SizedBox(height: 20),
              // * Checkout
              const Checkout(),
            ],
          ),
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Total
        const _Price(title: 'Sub-total', price: 5000),
        const SizedBox(height: 10),
        const _Price(title: 'Discount', price: 1100),
        const SizedBox(height: 10),
        const _Price(title: 'Delivery', price: 220),
        const SizedBox(height: 10),
        // dot dot line
        const Divider(thickness: 0.5, color: ColorManager.grey),
        const SizedBox(height: 10),
        const _Price(title: 'Total', price: 3670),
        const SizedBox(height: 20),
        // * Checkout
        CustomButton(
          title: 'Checkout',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Provider(
                        create: (_) => CheckoutViewModel(),
                        child: const CheckoutView())));
          },
        ),
      ],
    );
  }
}

class PromoCode extends StatelessWidget {
  const PromoCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: ColorManager.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              onChange: (_) {
                //
              },
              hintText: 'Enter Promo Code',
              errorText: null,
            ),
          ),
          const SizedBox(width: 10),
          CustomButton(
            title: 'Apply',
            width: 120,
            onPressed: () {
              //
            },
          ),
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({
    required this.title,
    required this.price,
  });
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: getSemiBoldTextStyle(color: ColorManager.grey, size: 18)),
        const Spacer(),
        Text("Rs. ${price.toStringAsFixed(0)}",
            style: getSemiBoldTextStyle(size: 18)),
      ],
    );
  }
}

class CustomCartItem extends StatefulWidget {
  final CartItem cartItem;
  const CustomCartItem(
    this.cartItem, {
    super.key,
  });

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      height: 170,
      decoration: BoxDecoration(
        color: ColorManager.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(widget.cartItem.product.image),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.cartItem.product.name,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18)),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 20,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    // size , color
                    Text("Size: ${widget.cartItem.size.map((e) => e).toList()}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorManager.grey,
                            )),
                    const SizedBox(width: 10),
                    const Icon(Icons.circle,
                        size: 10, color: ColorManager.grey),
                    const SizedBox(width: 10),
                    Text(
                        "Color: ${widget.cartItem.color.map((e) => e).toList()}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorManager.grey,
                            )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text("Quantity: ${widget.cartItem.quantity}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.grey,
                      )),
              const SizedBox(height: 10),
              FittedBox(
                child: Text('Rs. ${widget.cartItem.totalPrice}',
                    style: getSemiBoldTextStyle(size: 18)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
