import 'package:get/get.dart';
import 'package:multicontrolergetx/burgues/burgues_controller.dart';
import 'package:multicontrolergetx/sobremesa/sobremesa_controller.dart';

class HomeController extends GetxController {
  final isGrid = false.obs;

  final burgues = Get.find<BurguesHomeController>();
  final sobremesa = Get.find<SobremesaHomeController>();
}
