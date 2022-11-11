// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, invalid_use_of_protected_member, unnecessary_null_comparison, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:api_minggu10/controller.dart';
import 'package:api_minggu10/get_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myC = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data API Reqres'),
        actions: [
          IconButton(
            onPressed: () {
              myC.selectedPage.value = 1;
              myC.getRefreshData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      
      bottomSheet: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          height: Get.height * 0.06,
          width: double.infinity,
          
          color: Colors.blue,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myC.data.value.isEmpty ? 'Page : 0' : 'Page : ' + myC.data.value['page'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Total Data : ' + myC.data.value.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          myC.selectedPage.value = 1;
                          myC.getRefreshData();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: myC.selectedPage.value == 1
                                ? Colors.white
                                : Color.fromARGB(255, 204, 204, 204),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text('1'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          myC.selectedPage.value = 2;
                          myC.getRefreshData();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: myC.selectedPage.value == 2
                                ? Colors.white
                                : Color.fromARGB(255, 204, 204, 204),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text('2'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => myC.data.value == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: myC.data.value == null ? 0 : myC.data.value.length,
                itemBuilder: (context, index) {
                  var listdata = myC.data.value['data'];
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Get.to(GetDataDetailScreen(), arguments: index),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    listdata[index]["avatar"],
                                    width: 80,
                                    height: 80,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(listdata[index]["first_name"] +
                                          " " +
                                          listdata[index]["last_name"]),
                                      Text(listdata[index]["email"]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
