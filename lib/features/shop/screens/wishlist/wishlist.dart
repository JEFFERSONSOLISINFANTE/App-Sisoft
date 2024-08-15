import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/icons/circular_icon.dart';
import 'package:newapp/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/product_card_vertical.dart';
import 'package:newapp/features/shop/screens/home/home.dart';
import 'package:newapp/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Favoritos',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [TGridLayout(itemCount: 12, itemBuilder: (_, index) => const TProductCardVertical())],
          ),
        ),
      ),
    );
  }
}
