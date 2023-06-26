import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorManager.black),
            onPressed: () => Navigator.pop(context)),
        title: Text('My Cart', style: getSemiBoldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomCartItem(),
          ],
        ),
      ),
    );
  }
}

class CustomCartItem extends StatefulWidget {
  const CustomCartItem({
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
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
              'https://shaposh.pk/34438-large_default/formal-2187-af-nt.jpg'),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Traditional Blue Kurthi',
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18)),
              const SizedBox(height: 5),
              Row(
                children: [
                  // size , color
                  Text("Size: XL",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorManager.grey,
                          )),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, size: 10, color: ColorManager.grey),
                  const SizedBox(width: 10),
                  Text("Color: Blue",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorManager.grey,
                          )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text('Rs. 2,500', style: getSemiBoldTextStyle(size: 18)),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.grey),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity--;
                            });
                          },
                          child: const Icon(Icons.remove,
                              size: 25, color: ColorManager.primary),
                        ),
                        const SizedBox(width: 5),
                        Text(quantity.toString(), style: getBoldTextStyle()),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: const Icon(Icons.add,
                              size: 25, color: ColorManager.primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
