import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController2 extends GetxController
    with StateMixin<List<int>>, SingleGetTickerProviderMixin {
  final loadingPage = true
      .obs; // StateMixin Controla apenas a lista neste exemplo ... necessario para espera a lista de catalgos chegar e nao dar erro na view
  final isGrid = false.obs;
  late TabController tabController;
  final listCatalog = <String>[].obs;
  final catSelected = ''.obs;

  Future<void> getCatalog() async {
    await Future.delayed(Duration(seconds: 2), () {
      listCatalog.addAll([
        'agua',
        'sopa',
        'refri',
        'gelados',
        'massa',
        'fruta',
        'manteiga',
        'quentes',
        'outros'
      ]);
    });
  }

  Future<void> getItem() async {
    change(null, status: RxStatus.loading());
    print('Buscando itens para o catalogo ${catSelected.value}');

    await Future.delayed(Duration(seconds: 2), () {
      change(
        [1, 2, 3, 4, 5, 6, 7, 8, 9],
        status: RxStatus.success(),
      );
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    await getCatalog().then((value) {
      getItem();
    });
    tabController = TabController(length: listCatalog.length, vsync: this);
    loadingPage.value = false;
    super.onInit();
  }
}
