import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets.login_signup/connection/network_manager.dart';
class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
