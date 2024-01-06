import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/entities/data_register_data.dart';

class SuccessRegisterEntity extends Equatable {
  bool? status;
  String? message;
  DateRegisterEntity data;
  SuccessRegisterEntity(
      {required this.status, required this.message, required this.data});
  @override
  
  List<Object?> get props => [
    status,
    message,
    data
  ];
}
