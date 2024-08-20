import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/products/product_cards/rounded_container.dart';
import 'package:newapp/common/widgets.login_signup/success_screen/success_screen.dart';
import 'package:newapp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:newapp/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:newapp/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:newapp/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:newapp/navigation_menu.dart';
import 'package:newapp/utils/constants/colors.dart';
import 'package:newapp/utils/constants/image_strings.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../common/widgets.login_signup/appbar/appbar.dart';
import '../../../../common/widgets.login_signup/products/cart/cupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Orden Prevista',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Items en el carrito
                const TCardItems(showAddRemoveButtons: false),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Cupon
                const TCuponCode(),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Modo de pago
                TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.md),
                  showBorder: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      ///Precio
                      TBillingAmountSection(),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      ///Divider
                      Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      ///Metodo de pago
                      TBillingPaymentSection(),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      ///Direccion
                      TBillingAddressSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: TImages.success,
                      title: 'Pago realizado',
                      subtitle: 'Tu articulo sera entregado pronto',
                      onPressed: () => Get.offAll(() => const NavigationMenu()),
                    ),
                  ),
              child: const Text('Checkout \$256.0')),
        ),
    );
  }
}
