import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../../common/widgets.login_signup/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets.login_signup/icons/circular_icon.dart';
import '../../../../../common/widgets.login_signup/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            ///Imagen Principal
            const SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(TImages.pc))),
                )),

            /// Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (_, index) => TRoundedImage(
                      width: 80,
                      backgroundColor:
                      dark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imageUrl: TImages.laptop),
                ),
              ),
            ),

            /// Iconos
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
