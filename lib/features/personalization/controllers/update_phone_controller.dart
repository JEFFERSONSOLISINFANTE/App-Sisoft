import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/features/personalization/controllers/user_controller.dart';
import '../../../common/widgets.login_signup/connection/network_manager.dart';
import '../../../common/widgets.login_signup/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/fullscreen_loader.dart';
import '../screens/profile/profile.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();
  final phoneNumber = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePhoneNumberFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializePhoneNumber();
    super.onInit();
  }

  /// Initialize user phone number
  Future<void> initializePhoneNumber() async {
    final user = UserController.instance.user.value;
    phoneNumber.text = user.phoneNumber;
  }

  Future<void> updatePhoneNumber() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Estamos actualizando tu número de teléfono...', TImages.waiting);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updatePhoneNumberFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> phone = {
        'Telefono': phoneNumber.text.trim(),
      };
      await userRepository.updateSingleField(phone);

      UserController.instance.user.value.phoneNumber = phoneNumber.text.trim();
      UserController.instance.user.refresh();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Felicidades', message: 'Tu numero de telefono ha sido actualizado');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: '¡Atención!', message: e.toString());
    }
  }
}
