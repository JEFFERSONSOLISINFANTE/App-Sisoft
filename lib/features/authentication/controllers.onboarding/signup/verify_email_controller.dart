import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/loaders/loaders.dart';
import 'package:newapp/common/widgets.login_signup/success_screen/success_screen.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/text_strings.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';


class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Enviar correo y añadiendo tiempo de espera
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///enviar link de verificacion
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Correo Enviado',
          message: 'Verifica tu correo electronico para validar tu cuenta');
    } catch (e) {
      TLoaders.errorSnackBar(title: '!Atención!', message: e.toString());
    }
  }

  ///tiempo de espera
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: TImages.success,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  ///revisar manual si esta verificado del correo
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: TImages.verifyIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
