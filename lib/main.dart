import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multicontrolergetx/home/home_bindings.dart';

import 'home2/home2_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: HomeBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage() ,
      home: MyHomePage2(),
    );
  }
}
