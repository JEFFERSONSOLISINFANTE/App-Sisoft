import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/custom_shapes/containers/search_container.dart';
import 'package:newapp/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:newapp/common/widgets.login_signup/products/cart/cart_menu_icon.dart';

import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/common/widgets.login_signup/brands/brand_card.dart';
import 'package:newapp/features/shop/screens/store/widgets/category_tab.dart';

import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';

import '../../../../common/widgets.login_signup/appbar/tabbar.dart';
import '../../../../common/widgets.login_signup/brands/brand_show_case.dart';
import '../../../../common/widgets.login_signup/images/t_circular_image.dart';
import '../../../../common/widgets.login_signup/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Tienda', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///Barra de Busqueda
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Buscar en la tienda',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// Marcas Populares
                      TSectionHeading(
                          title: 'Marcas Populares', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(showBorder: true);
                          })
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Computadoras')),
                    Tab(child: Text('Laptos')),
                    Tab(child: Text('Camaras')),
                    Tab(child: Text('Impresoras')),
                    Tab(child: Text('Tintas')),
                    Tab(child: Text('Mantenimiento')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}



