import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/features/personalization/screens/settings/settings.dart';
import 'package:newapp/features/shop/screens/home/home.dart';
import 'package:newapp/features/shop/screens/wishlist/wishlist.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import 'features/shop/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Inicio'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Tienda'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Favoritos'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Perfil'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
}
