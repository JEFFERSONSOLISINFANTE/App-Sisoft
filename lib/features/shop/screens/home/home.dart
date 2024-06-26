import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/common/widgets.login_signup/custom_shapes/curved_edges/curved_edges.dart';
import 'package:newapp/utils/constants/colors.dart';

import '../../../../common/widgets.login_signup/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets.login_signup/custom_shapes/curved_edges/curved_edges_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Container()
            ),
          ],
        ),
      ),
    );
  }
}


