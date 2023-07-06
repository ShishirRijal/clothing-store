import 'package:clothing_store/core/resources/asset_manager.dart';
import 'package:clothing_store/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(children: [
          // back button along with Profile as header at center
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 24)),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  AssetManager.profile,
                  width: 150,
                  height: 150,
                ),
              ),
              // camera icon to update the profile picture
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: ColorManager.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Shishir Rijal',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          // menus
          const CustomProfileMenuItem(
            icon: Icons.person,
            title: 'My Account',
          ),
          const SizedBox(height: 20),
          const CustomProfileMenuItem(
            icon: Icons.notifications,
            title: 'Notifications',
          ),
          const SizedBox(height: 20),
          const CustomProfileMenuItem(
            icon: Icons.settings,
            title: 'Settings',
          ),
          const SizedBox(height: 20),
          const CustomProfileMenuItem(
            icon: Icons.help_rounded,
            title: 'Help Center',
          ),
          const SizedBox(height: 20),
          const CustomProfileMenuItem(
            icon: Icons.logout,
            title: 'Logout',
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class CustomProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  const CustomProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      tileColor: ColorManager.lightGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: ColorManager.primary, size: 28),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
      ),
      trailing: const Icon(Icons.navigate_next_sharp,
          size: 28, color: ColorManager.primary),
    );
  }
}
