import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/features/shop/screens/product_reviews/widgets/progress_indicator_rating.dart';
import 'package:newapp/features/shop/screens/product_reviews/widgets/ratingprogress_indicator.dart';
import 'package:newapp/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/device/device_utility.dart';

import '../../../../common/widgets.login_signup/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppBar(title: Text('Reseñas y Puntuaciones'), showBackArrow: true),

      ///Cuerpo

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Las reseñas y puntuaciones son verificadas y provienen de personas que usan tu mismo dispositivo"),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Overlay del rating
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.8),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Lista de reseñas
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



