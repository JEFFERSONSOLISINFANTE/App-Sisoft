import 'package:flutter/material.dart';
import 'package:newapp/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:newapp/utils/device/device_utility.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Saltar'),
        ));
  }
}
