import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/features/shop/screens/cart/cart.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon(
      {super.key,
      required this.onPressed,
      this.iconColor,
      this.counterBgColor,
      this.counterTextColor});

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? TColors.black : Colors.white,
                      fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
