import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name,
      required super.email,
      required super.phonenumber,
      required super.uid,
      required super.status,
      required super.password});
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
       phonenumber:documentSnapshot.get('phone'),
        name: documentSnapshot.get('name'),
        email: documentSnapshot.get('email'),
        uid: documentSnapshot.get('uid'),
        status: documentSnapshot.get('status'),
        password: documentSnapshot.get('password'));
  }
  Map<String, dynamic> toDocument() {
    return {
      "status":status,
      "uid":uid,
      "email":email,
      "name":name,
      "phone":phonenumber
    };
  }
}
