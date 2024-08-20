import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCardItem extends StatelessWidget {
  const TCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Imagen
        TRoundedImage(
            imageUrl: TImages.pc,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light),
        const SizedBox(width: TSizes.spaceBtwSections),

        ///Titulo, precio y tamaño
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: 'AMD'),
              const Flexible(
                  child: TProductTitleText(title: "Pc Amd Ryzen 5700g 16gb RAM RTX3090", maxLines: 1)),

              ///Atributos
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'EUR 38 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
