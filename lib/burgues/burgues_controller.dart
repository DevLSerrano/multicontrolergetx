import 'package:get/get.dart';

class BurguesHomeController extends GetxController with StateMixin<List<int>> {
  final list = <int>[1, 2, 3, 4, 5, 6].obs;

  Future<void> getData() async {
    Future.delayed(Duration(seconds: 2), () {
      change(list, status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
