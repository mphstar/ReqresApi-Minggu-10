// ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_null_comparison, unnecessary_brace_in_string_interps

import 'package:api_minggu10/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDataDetailScreen extends StatelessWidget {
  const GetDataDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myC = Get.find<MyController>();
    var listdata = myC.data.value['data'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data API Reqres'),
      ),
      body: Obx(
        () => Container(
          child: myC.data.value == null
              ? Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Loading',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: ListTile(
                    leading: Image.network(listdata[Get.arguments]["avatar"]),
                    title: Text(
                        listdata[Get.arguments]["first_name"] + " " + listdata[Get.arguments]["last_name"]),
                    subtitle: Text(listdata[Get.arguments]["email"]),
                  ),
                ),
        ),
      ),
    );
  }
}
