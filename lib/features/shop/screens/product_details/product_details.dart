import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/features/shop/screens/checkout/checkout.dart';
import 'package:newapp/features/shop/screens/product_details/widgets/bottom_add_wsp.dart';
import 'package:newapp/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:newapp/features/shop/screens/product_details/widgets/product_data.dart';
import 'package:newapp/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:newapp/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:newapp/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToWSP(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Imagenes de Productos
            const TProductImageSlider(),

            ///Detalles
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Puntuacion
                  const TRatingAndShare(),

                  ///Precio, Titulo, Marca & Stock
                  const TProductData(),

                  ///Atributos
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),


                  ///CheckOut
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Pagar'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Descripcion
                  const TSectionHeading(title: 'Descripcion', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    '¡Experimenta el poder de la tecnología de última generación con nuestra PC equipada con un procesador AMD Ryzen 5700G y una tarjeta gráfica NVIDIA RTX 3090! Diseñada para ofrecer un rendimiento excepcional en cualquier tarea, desde juegos intensivos hasta aplicaciones profesionales, esta PC es tu solución ideal para una experiencia informática sin igual.\n\n'
                        'Características Principales:\n\n'
                        '- Procesador AMD Ryzen 5700G: Con 8 núcleos y 16 hilos, el Ryzen 5700G proporciona un rendimiento ultrarrápido y eficiente para cualquier carga de trabajo. Ideal para gaming, edición de video y multitarea intensiva.\n\n'
                        '- 16 GB de RAM: Con memoria RAM de alta velocidad, disfrutarás de un rendimiento fluido y una capacidad de respuesta rápida, incluso con múltiples aplicaciones abiertas simultáneamente.\n\n'
                        '- Tarjeta Gráfica NVIDIA RTX 3090: La RTX 3090 ofrece un rendimiento gráfico inigualable, con soporte para ray tracing y una capacidad de memoria de 24 GB. Perfecta para juegos en 4K, modelado 3D y tareas de renderizado complejas.\n\n'
                        '- Almacenamiento: Equipado con un SSD rápido para tiempos de carga reducidos y una experiencia general más ágil. La opción de expansión te permite personalizar tu almacenamiento según tus necesidades.\n\n'
                        '- Diseño y Construcción: Un chasis elegante y bien ventilado asegura una refrigeración eficiente, mientras que el diseño compacto se adapta perfectamente a cualquier espacio de trabajo.\n\n'
                        '- Conectividad y Puertos: Incluye una variedad de puertos para conectar todos tus dispositivos y accesorios, incluyendo USB-C, HDMI, y más.\n\n'
                        '¿Por qué Elegir Esta PC?\n\n',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Ver más',
                    trimExpandedText: 'Ver menos',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///Reseñas
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reseñas(19)',showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()) , icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
