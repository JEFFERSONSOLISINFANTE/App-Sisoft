import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/common/widgets.login_signup/custom_shapes/containers/search_container.dart';
import 'package:newapp/common/widgets.login_signup/layouts/grid_layout.dart';
import 'package:newapp/common/widgets.login_signup/products/cart/cart_menu_icon.dart';
import 'package:newapp/common/widgets.login_signup/texts/section_heading.dart';
import 'package:newapp/common/widgets.login_signup/brands/brand_card.dart';
import 'package:newapp/features/shop/screens/brand/all_brands.dart';
import 'package:newapp/features/shop/screens/store/widgets/category_tab.dart';
import 'package:newapp/utils/constants/sizes.dart';
import 'package:newapp/utils/helpers/helper_functions.dart';
import '../../../../common/widgets.login_signup/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../models/category_model.dart';

// Define your categories here
final List<CategoryModel> categories = [
  CategoryModel(
    id: '1',
    name: 'Computadoras',
    image: 'assets/icons/categories/electronics.png',
    isFeatured: true,
  ),
  CategoryModel(
    id: '2',
    name: 'Laptops',
    image: 'assets/icons/categories/furniture.png',
    isFeatured: true,
  ),
  CategoryModel(
    id: '3',
    name: 'Camaras',
    image: 'assets/icons/categories/clothing.png',
    isFeatured: true,
  ),
  CategoryModel(
    id: '4',
    name: 'Impresoras',
    image: 'assets/icons/categories/accessories.png',
    isFeatured: true,
  ),CategoryModel(
    id: '5',
    name: 'Tintas',
    image: 'assets/icons/categories/accessories.png',
    isFeatured: true,
  ),CategoryModel(
    id: '6',
    name: 'Mantenimiento',
    image: 'assets/icons/categories/accessories.png',
    isFeatured: true,
  ),
];

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
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
                          text: '',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// Marcas Populares
                      TSectionHeading(
                          title: 'Marcas Populares',
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
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
                bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
