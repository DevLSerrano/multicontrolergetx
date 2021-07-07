import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'home2_controller.dart';

class MyHomePage2 extends GetView<HomeController2> {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loadingPage.value
          ? CupertinoActivityIndicator()
          : Scaffold(
              appBar: AppBar(
                actions: [
                  Obx(() => IconButton(
                        onPressed: () {
                          controller.isGrid.value = !controller.isGrid.value;
                        },
                        icon: controller.isGrid.value
                            ? Icon(Icons.grid_view)
                            : Icon(
                                Icons.list,
                              ),
                      ))
                ],
                bottom: TabBar(
                  isScrollable: true,
                  controller: controller.tabController,
                  onTap: (value) async {
                    controller.catSelected.value =
                        controller.listCatalog[value];
                    await controller.getItem();
                  },
                  tabs: controller.listCatalog
                      .map((element) => Tab(
                            text: element,
                          ))
                      .toList(),
                ),
              ),
              body: controller.obx(
                (state) => Obx(
                  () => controller.isGrid.value
                      ? //!Aqui no grid pode usar seu componente diferente e passar apenar a lista.
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: state!.length,
                          itemBuilder: (context, index) => Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Text(state[index].toString()),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state!.length,
                          itemBuilder: (context, index) => Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Text(state[index].toString()),
                            ),
                          ),
                        ),
                ),
              ),
            ),
    );
  }
}
