import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? uid;
  final String? status;
  final String? password;
 const  UserEntity(
      {required this.name,
      required this.email,
      required this.uid,
      required this.status,
      required this.password});
  @override
  List<Object?> get props =>[
    name,
    email,
    uid,
    status,
    password,
  ];
}
