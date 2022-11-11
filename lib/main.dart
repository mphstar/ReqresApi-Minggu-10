// ignore_for_file: use_key_in_widget_constructors

import 'package:api_minggu10/get_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get API',
      debugShowCheckedModeBanner: false,
      home: GetDataScreen(),
    );
  }
}