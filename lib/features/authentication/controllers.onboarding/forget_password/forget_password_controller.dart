import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets.login_signup/connection/network_manager.dart';
import '../../../../common/widgets.login_signup/loaders/loaders.dart';
import '../../../../data/repositories.authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/fullscreen_loader.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Enviar link de resetear contraseña
  sendPasswordResetEmail() async {
    try {
      ///Iniciando
      TFullScreenLoader.openLoadingDialog(
          'Procesando tu solicitud...', TImages.verifyIllustration);

      ///Verificando conexion
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Validando los datos
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Enviando correo para resetear contraseña
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      ///Quitar carga
      TFullScreenLoader.stopLoading();

      ///Validando el exito
      TLoaders.successSnackBar(
          title: 'Correo enviado',
          message: 'Se envio el correo para cambiar la contraseña'.tr);

      ///Redirigiendo
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: '¡Atención!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      ///Iniciando
      TFullScreenLoader.openLoadingDialog(
          'Procesando tu solicitud...', TImages.verifyIllustration);

      ///Verificando conexion
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Enviando correo para resetear contraseña
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      ///Quitar carga
      TFullScreenLoader.stopLoading();

      ///Validando el exito
      TLoaders.successSnackBar(
          title: 'Correo enviado',
          message: 'Se envio el correo para cambiar la contraseña'.tr);


    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: '¡Atención!', message: e.toString());
    }
  }
}
