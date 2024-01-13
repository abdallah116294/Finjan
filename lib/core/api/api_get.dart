import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finjan/core/api/api_endpoints.dart';
import 'package:flutter/material.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);
  Future<Map<String, dynamic>> getProductsData() async {
    try {
      var response = await _dio.get(
        APIEndPoints.coffeUrl + APIEndPoints.getCoffeUrl,
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        //Map<String, dynamic> responseData = json.decode(response.data);
        debugPrint(response.data.toString());
        return response.data;
      } else {
        debugPrint('Error ${response.statusCode}');
        throw Exception("Error Exception ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("$error");
      throw Exception("Error $error");
    }
  }
}
