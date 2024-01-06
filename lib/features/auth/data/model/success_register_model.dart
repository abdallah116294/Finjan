import 'package:finjan/features/auth/data/model/data_model.dart';
import 'package:finjan/features/auth/domain/entities/success_register_entity.dart';

class SuccessRegister extends SuccessRegisterEntity {
  SuccessRegister(
      {required super.status, required super.message, required super.data});
  factory SuccessRegister.fromJson(Map<String, dynamic> json) {
    return SuccessRegister(
        status: json['status'],
        message: json['message'],
        data: DataModel.fromJson(json['data']));
  }
}
