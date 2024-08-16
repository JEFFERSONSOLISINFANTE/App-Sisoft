import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/images/t_circular_image.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TCircularImage(image: TImages.pcIcon, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text("Cambiar foto de perfil")),

                  ],
                ),
              ),
              ///Detalles
              const SizedBox(width: TSizes.spaceBtwItems /2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              ///Informacion del Perfil
              const TSectionHeading(title: "Informacion del Perfil", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: "Nombres y Apellidos", value: "Jefferson Solis Infante", onPressed: () {}),
              TProfileMenu(title: "Usuario", value: "Jefferson", onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Informacion Personal
              const TSectionHeading(title: "Informacion Personal", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: "DNI", value: "74064932", icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: "Correo Electronico", value: "Sisoft@senati.pe", onPressed: () {}),
              TProfileMenu(title: "Genero", value: "Masculino", onPressed: () {}),
              TProfileMenu(title: "Fecha de Nacimiento", value: "05 Julio, 2003", onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text("Borrar Cuenta", style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


