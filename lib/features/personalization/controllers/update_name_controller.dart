import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/loaders/loaders.dart';
import 'package:newapp/features/personalization/controllers/user_controller.dart';
import 'package:newapp/features/personalization/screens/profile/profile.dart';

import '../../../common/widgets.login_signup/connection/network_manager.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Estamos actualizando tu información...', TImages.waiting);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'Nombres': firstName.text.trim(),
        'Apellidos': lastName.text.trim()
      };

      // Actualizar el nombre en el repositorio
      await userRepository.updateSingleField(name);

      // Actualizar el modelo del usuario en el controlador
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Notificar a los observadores sobre el cambio
      userController.user.refresh();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Felicidades', message: 'Tu nombre y apellidos han sido actualizados');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: '¡Atención!', message: e.toString());
    }
  }
}
