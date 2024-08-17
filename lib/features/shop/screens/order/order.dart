import 'package:flutter/material.dart';
import 'package:newapp/common/widgets.login_signup/appbar/appbar.dart';
import 'package:newapp/features/shop/screens/order/widgets/order_list.dart';
import 'package:newapp/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text('Mis ordenes',
              style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
        ///Ordenes
        child: TOrderListItems(),
      ),


    );
  }
}
