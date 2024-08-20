import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/images/t_circular_image.dart';
import 'package:newapp/common/widgets.login_signup/layouts/product_price_text.dart';
import 'package:newapp/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:newapp/common/widgets.login_signup/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:newapp/utils/constants/enums.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets.login_signup/products/product_cards/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductData extends StatelessWidget {
  const TProductData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Precio y descuento
        Row(
          children: [
            ///Descuento
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Precio
            Text('\$250 ', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        ///Titulo
        const TProductTitleText(title: 'Pc Amd Ryzen 5700g 16gb RAM RTX3090'),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        ///Stock
        Row(
          children: [
            const TProductTitleText(title: 'Estado: '),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('Disponible', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        ///Marca
        Row(
          children: [
            TCircularImage(image: TImages.amd,
            width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.dark,
            ),
            const TBrandTitleTextWithVerifiedIcon(title: '', brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
