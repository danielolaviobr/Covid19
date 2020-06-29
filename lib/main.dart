import 'package:covid19/models/api_data.dart';
import 'package:covid19/screens/page_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ApiData apiData = Get.put(ApiData());

void main() {
  runApp(Covid19());
}

class Covid19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTemplate(),
    );
  }
}
