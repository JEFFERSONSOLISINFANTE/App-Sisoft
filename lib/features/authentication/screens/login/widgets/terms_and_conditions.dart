import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers.onboarding/signup/signup_controller.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Ajusta la alineación vertical si es necesario
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
              !controller.privacyPolicy.value)),
        ),
        const SizedBox(width: TSizes.spaceBtwInputFields), // Usa width en lugar de height para el espacio horizontal
        Expanded(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )),
              TextSpan(
                  text: ' ${TTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}