import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("My Profile", style: getSemiBoldTextStyle()),
    );
  }
}
