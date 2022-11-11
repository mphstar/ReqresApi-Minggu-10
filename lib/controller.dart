// ignore_for_file: unnecessary_overrides, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyController extends GetxController {
  int? value = Get.arguments;

  var data = {}.obs;
  var url_api = 'https://reqres.in/api/users?page=2'.obs;

  var selectedPage = 1.obs;

  @override
  void onInit() {
    super.onInit();

    getRefreshData();
  }

  Future<void> getRefreshData() async {
    selectedPage.value == 1
        ? url_api.value = 'https://reqres.in/api/users?page=1'
        : url_api.value = 'https://reqres.in/api/users?page=2';

    getJsonData(url_api.value);
  }

  Future<void> getJsonData(String url) async {
    var uri = Uri.parse(url);

    var response = await http.get(
      uri,
      headers: {"Accept": "application/json"},
    );

    data.value = jsonDecode(response.body);
  }

  @override
  void onClose() {
    super.onClose();
    url_api.value = 'https://reqres.in/api/users';
    data.clear();
  }
}
