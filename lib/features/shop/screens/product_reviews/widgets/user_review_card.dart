import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/rounded_container.dart';
import 'package:newapp/common/widgets.login_signup/products/ratings/rating_indicator.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.perfil)),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Reseña
        Row(
          children: [
            const TRatingBarIndicator(rating: 3.5),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Jul, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'Excelente producto lo recomiendo a todo el mundo que tenga la disposicion de comprarlo.',
          trimLines: 1,
          trimExpandedText: "Ver menos",
          trimCollapsedText: "Ver más",
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Respuesta de la empresa
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sisoft',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('01 Jul, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'Gracias por tus comentarias, estamos en busqueda un constante crecimiento y saber tus opiniones es importante para nosotros.',
                  trimLines: 1,
                  trimExpandedText: "Ver menos.",
                  trimCollapsedText: "Ver más.",
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
