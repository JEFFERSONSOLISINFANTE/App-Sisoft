import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/layouts/product_price_text.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/rounded_container.dart';
import 'package:newapp/common/widgets.login_signup/texts/product_title_text.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/sizes.dart';

import '../../../../../common/widgets.login_signup/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Detalles
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              ///Titulo, Precio y Stock
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variacion', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Precio : ', smallSize: true),

                          ///Precio actual
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          ///Precio de Venta
                          const TProductPriceText(price: '20'),
                        ],
                      ),

                      ///Stock
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('Disponible',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///Descripcion
              const TProductTitleText(
                  title: 'Pc de ultima generacion en oferta por inicio de clases',
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Atributos



      ],
    );
  }
}

