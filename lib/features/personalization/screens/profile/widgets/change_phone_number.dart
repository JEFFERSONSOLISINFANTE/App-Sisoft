import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/utils/validators/validation.dart';

import '../../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/update_phone_controller.dart';

class TChangePhoneNumber extends StatelessWidget {
  const TChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());

    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cambiar Número de Teléfono',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Asegúrate de ingresar tu número de teléfono correcto.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Form(
              key: controller.updatePhoneNumberFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) =>
                        TValidator.validatePhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: TTexts.phoneNo,
                      prefixIcon:  Icon(Iconsax.call),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePhoneNumber(),
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
