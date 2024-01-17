import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finjan/core/api/api_endpoints.dart';
import 'package:flutter/material.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);
  Future<dynamic> get({required String endpoint}) async {
    try {
      var response = await _dio.get(
        APIEndPoints.coffeBasUrl + endpoint,
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        if (response.data is List<dynamic>) {
          debugPrint(response.data.toString());
          return response.data;
        } else {
          var jsonData = json.decode(response.data);
          return jsonData;
        }
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
