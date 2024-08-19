import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/features/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:newapp/features/authentication/screens/login/login.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Imagen
              Image(
                image: const AssetImage(TImages.verifyIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Titulo
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              Text(TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Botones
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(TTexts.done))),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
