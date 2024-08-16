import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/custom_shapes/containers/primary_header_container.dart';
import 'package:newapp/common/widgets.login_signup/list_tiles/settings_menu.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/features/personalization/screens/profile/profile.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/sizes.dart';
import '../../../../common/widgets.login_signup/list_tiles/user_profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Cuenta',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  ///Usuario
                  TUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Ajustes de la Cuenta
                  const TSectionHeading(
                      title: "Ajustes de Cuenta", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSettingMenu(
                      icon: Iconsax.safe_home,
                      title: "Mi direccion",
                      subtitle: ""),
                  const TSettingMenu(
                      icon: Iconsax.shopping_cart,
                      title: "Mi Carrito",
                      subtitle:
                          "Añadir, Eliminar articulos y Añadirlos al WhatsApp"),
                  const TSettingMenu(
                      icon: Iconsax.bag_tick,
                      title: "Mis Articulos",
                      subtitle: "Articulos comprados"),
                  const TSettingMenu(
                      icon: Iconsax.bank,
                      title: "Saldo",
                      subtitle: "Ver su saldo"),
                  const TSettingMenu(
                      icon: Iconsax.discount_shape,
                      title: "Mis Cupones",
                      subtitle: "Verificar sus Cupones"),
                  const TSettingMenu(
                      icon: Iconsax.notification,
                      title: "Notificaciones",
                      subtitle: "Ajustar sus Notificaciones"),
                  const TSettingMenu(
                      icon: Iconsax.security_card,
                      title: "Privacidad de la Cuenta",
                      subtitle: "Administrar sus datos y cuentas"),

                  ///Ajustes de la Aplicacion
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: "Ajustes de la Aplicacion",
                      showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSettingMenu(
                      icon: Iconsax.document_upload,
                      title: "Guardar Datos",
                      subtitle: "Sube tus datos a la nube de Firebase"),
                  TSettingMenu(
                      icon: Iconsax.location,
                      title: "Ubicacion",
                      subtitle: "Recomendaciones en base a su ubicacion",
                      trailing: Switch(value: true, onChanged: (value) {})),
                  TSettingMenu(
                      icon: Iconsax.security_user,
                      title: "Modo Seguro",
                      subtitle: "Busquedas para todas las edades",
                      trailing: Switch(value: false, onChanged: (value) {})),
                  TSettingMenu(
                      icon: Iconsax.image,
                      title: "Imagenes HD",
                      subtitle: "Desactivar para ahorrar datos",
                      trailing: Switch(value: false, onChanged: (value) {})),

                  ///Boton de Cerrar Sesion
                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Cerrar Sesion")),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
