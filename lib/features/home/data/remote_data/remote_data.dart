import 'dart:convert';

import 'package:finjan/core/api/api_consumer.dart';
import 'package:finjan/core/api/api_endpoints.dart';
import 'package:finjan/core/api/api_get.dart';
import 'package:finjan/features/home/data/model/coffe_model.dart';
import 'package:finjan/features/test_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RemoteData {
  Future<List<CoffeeTestModel>> getCoffe();
}

class RemoteDataImpl implements RemoteData {
  ApiConsumer apiConsumer;
  DioHelper dioHelper;
  RemoteDataImpl({required this.apiConsumer, required this.dioHelper});
  @override
  Future<List<CoffeeTestModel>> getCoffe() async {
    try {
      //  final response = await dioHelper.getProductsData();
      final response = await apiConsumer.get(APIEndPoints.getCoffeUrl);
      List<CoffeeTestModel> coffeeList = (response as List<dynamic>)
          .map<CoffeeTestModel>(
              (dynamic item) => CoffeeTestModel.fromJson(item))
          .toList();
      debugPrint(coffeeList.toString());
      return coffeeList;
    } catch (e) {
      debugPrint("Error Fetching coffe Data:$e");
      throw Exception("Failde to Load Coffe Data ");
    }
    // //final response = await apiConsumer.get(APIEndPoints.getCoffeUrl);
    // final response = await dioHelper.getProductsData();
    // List<dynamic> coffeListJson = jsonDecode(response as String);
    // List<CoffeeModel> coffeeList = List<CoffeeModel>.from(
    //     coffeListJson.map<CoffeeModel>((dynamic i) => CoffeeModel.fromJson(i)));
    // debugPrint(coffeeList.toString());
    // return coffeeList;
    // // List<CoffeeModel> coffeList = (json.decode(response as String) as List)
    // //     .map((data) => CoffeeModel.fromJson(data))
    // //     .toList();
    // // return coffeList;
  }
}
