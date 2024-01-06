import 'package:equatable/equatable.dart';

class DateRegisterEntity extends Equatable {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;
  DateRegisterEntity(
      {required this.name,
      required this.email,
      required this.id,
      required this.image,
      required this.phone,
      required this.token});
  @override
  List<Object?> get props => [
    name,
    email,
    id,
    image,
    phone,
    token,
  ];
}
