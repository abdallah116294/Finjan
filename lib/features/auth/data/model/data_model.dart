import 'dart:convert';

import 'package:finjan/features/auth/domain/entities/data_register_data.dart';

class DataModel extends DateRegisterEntity {
  DataModel(
      {required super.name,
      required super.email,
      required super.id,
      required super.image,
      required super.phone,
      required super.token});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        email: json['email'],
        id: json['id'],
        image: json['image'],
        phone: json['phone'],
        token: json['token']);
  }
}
