import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/rounded_container.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';
class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Metodo de Pago', buttonTitle: 'Cambiar', onPressed: (){}),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.dineroIcon), fit: BoxFit.contain),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text('Efectivo', style: Theme.of(context).textTheme.bodyLarge),

          ],
        )


      ],
    );
  }
}
