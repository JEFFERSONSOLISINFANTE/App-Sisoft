import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/features/personalization/screens/address/address.dart';
import 'package:newapp/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Direccion de Envio',
            buttonTitle: 'Cambiar',
            onPressed: () => Get.to(() => const UserAddressScreen())),
        Text('Jefferson Solis', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('(+51) 977 745 079',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('C. Cutervo 207 Manzanilla, Ica, Peru',
                style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}
