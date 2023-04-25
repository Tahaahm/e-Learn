// ignore_for_file: unused_field, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = "DB";
    _mainHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearar $token'
    };
  }
  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusText: e.toString(), statusCode: 1);
    }
  }
}
