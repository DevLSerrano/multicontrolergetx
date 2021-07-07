import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:multicontrolergetx/home/home_controller.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            tabs: [
              Tab(
                text: 'Burgues',
              ),
              Tab(
                text: 'Sobremesa',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            controller.burgues.obx(
              (state) => Obx(
                () => controller.isGrid.value
                    ? //!Aqui no grid pode usar seu componente diferente e passar apenar a lista.
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            controller.sobremesa.obx(
              (state) => Obx(
                () => controller.isGrid.value
                    ? //!Aqui no grid pode usar seu componente diferente e passar apenar a lista.
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            )
          ],
        ),
      ),
    );
  }
}
