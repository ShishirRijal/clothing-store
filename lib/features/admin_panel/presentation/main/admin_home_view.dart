import 'package:clothing_store/core/resources/asset_manager.dart';
import 'package:flutter/material.dart';

import '../../data/models/report.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Header
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final report = reports[index];
              return ReportTile(
                title: report.name,
                iconAddress: report.iconAddress,
                value: report.value,
              );
            })
      ],
    );
  }
}

class ReportTile extends StatelessWidget {
  const ReportTile(
      {required this.title,
      required this.iconAddress,
      required this.value,
      super.key});
  final String title;
  final String iconAddress;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      // height: 250,
      // width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconAddress, height: 100, width: 100),
          const SizedBox(height: 20),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          Text(value, style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
