import 'package:get/get.dart';
import 'package:multicontrolergetx/burgues/burgues_controller.dart';
import 'package:multicontrolergetx/home2/home2_controller.dart';
import 'package:multicontrolergetx/sobremesa/sobremesa_controller.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController2>(() => HomeController2());
    Get.lazyPut<BurguesHomeController>(() => BurguesHomeController());
    Get.lazyPut<SobremesaHomeController>(() => SobremesaHomeController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
