import 'package:clothing_store/core/resources/asset_manager.dart';
import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:clothing_store/features/checkout/domain/entities/order.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/resources.dart';
import '../../../authentication/data/failure/failure.dart';
import '../../../checkout/presentation/checkout/checkout_view.dart';
import '../../../checkout/presentation/checkout/checkout_viewmodel.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late Future<dartz.Either<Failure, List<Order>>> fetch;

  @override
  void initState() {
    super.initState();
    fetch = context.read<CheckoutViewModel>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('My Orders ', style: getSemiBoldTextStyle()),
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
              return (r).isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: double.infinity),
                        LottieBuilder.asset(AssetManager.emptyCart, width: 300),
                        const SizedBox(height: 20),
                        Text('You have no orders yet',
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
                              return CheckoutItemCard(r[index]);
                            },
                            separatorBuilder: (context, _) =>
                                const SizedBox(height: 20),
                            itemCount: r.length,
                          ),
                        ],
                      ),
                    );
            });
          }),
    );
  }
}

class CheckoutItemCard extends StatelessWidget {
  const CheckoutItemCard(this.order, {super.key});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorManager.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        order.dateTime.toString(),
        style: getRegularTextStyle(),
      ),
      subtitle: Text(
        "Rs.${order.totalAmount}",
        style: getSemiBoldTextStyle(size: 18),
      ),
      trailing: Text(
        order.isDelivered ? 'Delivered' : 'Pending',
        style: getSemiBoldTextStyle(size: 18),
      ),
    );
  }
}
