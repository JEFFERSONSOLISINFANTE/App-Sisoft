import 'package:flutter/material.dart';

import '../../../../../common/widgets.login_signup/layouts/product_price_text.dart';
import '../../../../../common/widgets.login_signup/products/cart/add_remove_button.dart';
import '../../../../../common/widgets.login_signup/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';

class TCardItems extends StatelessWidget {
  const TCardItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          const TCardItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    TProductAdder(),
                  ],
                ),

                ///Botones para añadir y quitar

                TProductPriceText(price: '256')
              ],
            ),
        ],
      ),
    );
  }
}
