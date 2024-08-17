import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
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
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Descripcion
                  const TSectionHeading(title: 'Descripcion', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'ADAWFAWFAWFAWFAawfawfawgagawgawgawgaggggggggggggggggggggggggggggggggggggggggaaaaaaaaaaaaaaaaacaca',
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
