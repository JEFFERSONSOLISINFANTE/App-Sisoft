import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/loaders/loaders.dart';
import 'package:newapp/features/authentication/screens/signup.widgets/verify_email.dart';
import 'package:newapp/utils/constants/image_strings.dart';

import '../../../../common/widgets.login_signup/connection/network_manager.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/popups/fullscreen_loader.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Sign UP
  Future<void> signup() async {
    try {
      ///Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Estamos procesando tu informacion', TImages.waiting);

      /// Check Internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Acepta los terminos y condiciones',
          message:
              'Para crear la cuenta debes leer y aceptas los terminos y condiciones',
        );
        return;
      }

      /// Register user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// Save Authenticate
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      ///Stop the loading
      TFullScreenLoader.stopLoading();

      /// Show Success Mesage
      TLoaders.successSnackBar(
          title: 'Felicidades',
          message:
              'Tu cuenta ha sido creada, verifica tu correo para continuar');

      /// Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      ///Show Some generic Error to the user
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
