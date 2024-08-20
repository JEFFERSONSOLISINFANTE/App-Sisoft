import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/product_card_vertical.dart';
import 'package:newapp/features/shop/screens/all_products/all_products.dart';
import 'package:newapp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:newapp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:newapp/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/containers/search_container.dart';

import '../../../../common/widgets.login_signup/layouts/grid_layout.dart';
import '../../../../common/widgets.login_signup/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Barra Principal
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Barra de Busqueda
                  TSearchContainer(text: ''),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Categorias
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Titulo
                        TSectionHeading(
                          title: 'Categorias Populares',
                          showActionButton: false,
                          textColor: TColors.white,),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///Categorias
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections)
                ],
              ),
            ),

            ///Cuerpo del home
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.banner1,
                      TImages.banner2,
                      TImages.banner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Productos Populares', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
