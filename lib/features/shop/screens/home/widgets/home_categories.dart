import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/features/shop/screens/sub_categories/sub_categories.dart';
import '../../../../../common/widgets.login_signup/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Lista de imágenes y títulos propios
    final List<Map<String, String>> categories = [
      {'image': 'assets/icons/categories/pc.png', 'title': 'Computadoras'},
      {'image': 'assets/icons/categories/laptop.png', 'title': 'Laptops'},
      {'image': 'assets/icons/categories/camara.png', 'title': 'Cámaras'},
      {'image': 'assets/icons/categories/impresora.png', 'title': 'Impresoras'},
      {'image': 'assets/icons/categories/tinta.png', 'title': 'Tintas'},
      {'image': 'assets/icons/categories/mantenimiento.png', 'title': 'Mantenimiento'},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            image: category['image']!,
            title: category['title']!,
            isNetworkImage: false, // Indicar que no es una imagen de red
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
