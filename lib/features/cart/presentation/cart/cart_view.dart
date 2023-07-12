import 'package:clothing_store/core/resources/asset_manager.dart';
import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/resources.dart';
import '../../../authentication/data/failure/failure.dart';
import '../../../checkout/presentation/checkout/checkout_view.dart';
import '../../../checkout/presentation/checkout/checkout_viewmodel.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/cart.dart';
import 'cart_viewmodel.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late Future<dartz.Either<Failure, List<CartItem>>> fetch;

  @override
  void initState() {
    super.initState();

    fetch = context.read<CartViewModel>().fetchCartItems(context);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('My Cart', style: getSemiBoldTextStyle()),
      ),
      body: FutureBuilder(
          future: fetch,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                      color: ColorManager.primary, strokeWidth: 3));
            }
            if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: Text('An error occurred',
                    style: getSemiBoldTextStyle(
                        size: 20, color: ColorManager.error)),
              );
            }
            return snapshot.data!.fold(
                (l) => Center(
                      child: Text('An error occurred',
                          style: getSemiBoldTextStyle(
                              size: 20, color: ColorManager.error)),
                    ), (r) {
              double total = 0;
              for (var i in r) {
                total += i.totalPrice;
              }
              context.read<Cart>().subTotal = total;
              return (r).isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: double.infinity),
                        LottieBuilder.asset(AssetManager.emptyCart, width: 300),
                        const SizedBox(height: 20),
                        Text('Your cart is empty',
                            style: getSemiBoldTextStyle(size: 20)),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          // * Cart Items
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomCartItem(r[index]);
                            },
                            separatorBuilder: (context, _) =>
                                const SizedBox(height: 20),
                            itemCount: r.length,
                          ),

                          // * Promo Code
                          const SizedBox(height: 40),
                          const PromoCode(),
                          const SizedBox(height: 20),
                          // * Checkout
                          const Checkout(),
                        ],
                      ),
                    );
            });
          }),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<Cart>();

    return Column(
      children: [
        // * Total
        _Price(title: 'Sub-total', price: cart.productPrice),
        const SizedBox(height: 10),
        _Price(title: 'Discount', price: cart.discount),
        const SizedBox(height: 10),
        _Price(title: 'Delivery', price: cart.deliveryCharge),
        const SizedBox(height: 10),
        // dot dot line
        const Divider(thickness: 0.5, color: ColorManager.grey),
        const SizedBox(height: 10),
        _Price(title: 'Total', price: cart.totalPrice),
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
        Text("Rs. ${price.toStringAsFixed(2)}",
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
    return Dismissible(
      key: ValueKey(widget.cartItem.product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<CartViewModel>().delete(widget.cartItem);
      },
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.error,
        ),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
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
                      Text(
                          "Size: ${widget.cartItem.sizes.map((e) => e).toList()}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorManager.grey,
                                  )),
                      const SizedBox(width: 10),
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
      ),
    );
  }
}
