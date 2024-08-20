import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/images/t_circular_image.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:newapp/features/personalization/screens/profile/widgets/change_phone_number.dart';
import 'package:newapp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/theme/custom_themes/shimmer.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Perfil')),

      ///Cuerpo
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Foto de Perfil
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      (){
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.perfil;
                        return controller.imageUploading.value ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                        : TCircularImage(
                            image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                      }
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text("Cambiar foto de perfil")),
                  ],
                ),
              ),

              ///Detalles
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Informacion del Perfil
              const TSectionHeading(
                  title: "Informacion del Perfil", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                  title: "Nombres y Apellidos",
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const TChangeName())),
              TProfileMenu(
                  title: "Usuario",
                  value: controller.user.value.username,
                  icon: Iconsax.copy,
                  onPressed: () {
                    // Copia el ID al portapapeles
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.id));
                    // Muestra un mensaje de confirmación
                    Get.snackbar(
                      "Copiado",
                      "Usuario copiado al portapapeles",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Informacion Personal
              const TSectionHeading(
                  title: "Informacion Personal", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                  title: "ID",
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {
                    // Copia el ID al portapapeles
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.id));
                    // Muestra un mensaje de confirmación
                    Get.snackbar(
                      "Copiado",
                      "ID copiado al portapapeles",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }),
              TProfileMenu(
                  title: "Correo Electronico",
                  value: controller.user.value.email,
                  onPressed: () {}),
              TProfileMenu(
                  title: "Numero de Telefono",
                  value: controller.user.value.phoneNumber,
                  onPressed: () => Get.to(() => const TChangePhoneNumber())),
              TProfileMenu(
                  title: "Genero", value: "Masculino", onPressed: () {}),
              TProfileMenu(
                  title: "Fecha de Nacimiento",
                  value: "05 Julio, 2003",
                  onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text("Borrar Cuenta",
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
