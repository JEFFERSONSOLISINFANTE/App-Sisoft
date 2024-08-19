import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newapp/features/personalization/controllers/user_controller.dart';

import '../../../../common/widgets.login_signup/connection/network_manager.dart';
import '../../../../common/widgets.login_signup/loaders/loaders.dart';
import '../../../../data/repositories.authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/fullscreen_loader.dart';

class LoginController extends GetxController {
  ///Variables

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read ('REMEMBERME_ME_EMAIL') ?? '';
    password.text = localStorage.read ('REMEMBERME_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///-- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Cargando
      TFullScreenLoader.openLoadingDialog(
          'Iniciando Sesion', TImages.verifyIllustration);

      /// Verificando conexion a internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Validando
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      ///Guardar datos si Recuerdame esta seleccionado
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      ///Iniciando sesion si esta autenticado
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ///Quitar carga
      TFullScreenLoader.stopLoading();


      ///Redirigiendo
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  ///-- Google Sign In
  Future<void> googleSignIn() async{
    try{
      ///Iniciando
      TFullScreenLoader.openLoadingDialog('Iniciando Sesion...', TImages.verifyIllustration);

      ///Verificar conexion a internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Google Auth
      final userCredentials = await AuthenticationRepository.instance.sigInWithGoogle();

      ///Guardar datos
      await userController.saveUserRecord(userCredentials);

      ///Quitar carga
      TFullScreenLoader.stopLoading();

      ///redirigir a pantalla
      AuthenticationRepository.instance.screenRedirect();


    }catch(e){
      ///Quitar carga
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Atención', message: e.toString());
    }
  }
}
