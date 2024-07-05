import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/custom_shapes/curved_edges/curved_edges.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/product_card_vertical.dart';
import 'package:newapp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:newapp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:newapp/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/device/device_utility.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../common/widgets.login_signup/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets.login_signup/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets.login_signup/images/rounded_image.dart';

import '../../../../common/widgets.login_signup/texts/section_heading.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Barra Principal
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Barra de Busqueda
                  TSearchContainer(text: 'Buscar'),
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
                            textColor: TColors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///Categorias
                        THomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///Cuerpo del home
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [TImages.banner1, TImages.banner2, TImages.banner3],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  GridView.builder(
                    itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      mainAxisSpacing: TSizes.gridViewSpacing,
                      crossAxisSpacing: TSizes.gridViewSpacing,
                      mainAxisExtent: 288,
                      ),
                      itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
