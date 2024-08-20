import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/product_card_vertical.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';

import '../../../../../common/widgets.login_signup/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
      Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///-- Marcas
            const TBrandShowCase(images: [TImages.laptop, TImages.pc]),
            const SizedBox(height: TSizes.spaceBtwItems),
      
      
            ///-- Productos
            TSectionHeading(title: 'Tal vez te guste', onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
      
            TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
      ]
    );
  }
}
