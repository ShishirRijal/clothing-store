import 'package:clothing_store/features/authentication/presentation/shared_widgets/shared_widgets.dart';
import 'package:clothing_store/features/checkout/presentation/checkout/checkout_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // fetch it from the api first
    _nameController.text = "Shishir Rijal";
    _addressController.text = "Thulipokhari, Lamachaur Chowk 16, Pokhara Nepal";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorManager.black),
            onPressed: () => Navigator.pop(context)),
        title: Text('My Account', style: getSemiBoldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // change name
              Text(
                "Name",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              // text field
              CustomTextField(
                errorText: null,
                onChange: (_) {},
                controller: _nameController,
                fillColor: ColorManager.primary.withOpacity(0.1),
                filled: true,
                enabled: false,
                style: getSemiBoldTextStyle(size: 16),
              ),

              const SizedBox(height: 20),
              //  address
              Text(
                "Delivery Address",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              const _AddressTile(
                  place: 'Thulipokhari, Sahardahar Marga',
                  city: 'Lamachaur, Pokhara'),
              const SizedBox(height: 15),
              const _AddressTile(
                  place: 'WRC campus gate', city: 'Lamachaur, Pokhara'),
              const SizedBox(height: 15),
              const _AddressTile(
                  place: 'WRC campus gate', city: 'Lamachaur, Pokhara'),

              const SizedBox(height: 20),
              //  cards
              Text(
                "Cards",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              const PaymentMethod(
                title: 'Apple Pay',
                cardNumber: '4323',
                isSelected: false,
                icon: Icons.apple,
                showSelect: false,
              ),
              const SizedBox(height: 20),
              const PaymentMethod(
                title: 'Master Card',
                cardNumber: '7484',
                icon: Icons.credit_card,
                isSelected: false,
                showSelect: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({required this.place, required this.city});
  final String place;
  final String city;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorManager.black)),
          child:
              const Icon(Icons.location_on_outlined, color: ColorManager.black),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place, maxLines: 2, style: getSemiBoldTextStyle(size: 16)),
              const SizedBox(height: 5),
              Text(city, style: getRegularTextStyle().copyWith()),
            ],
          ),
        ),
      ],
    );
  }
}
