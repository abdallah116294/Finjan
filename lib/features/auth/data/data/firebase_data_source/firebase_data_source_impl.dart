import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finjan/features/auth/data/data/firebase_data_source/firebase_data_source.dart';
import 'package:finjan/features/auth/data/model/user_model.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  FirebaseRemoteDataSourceImpl({required this.auth, required this.firestore});
  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity userEntity) async =>
      auth.signInWithEmailAndPassword(
          email: userEntity.email!, password: userEntity.password!);

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> signUp(UserEntity userEntity) async =>
      auth.createUserWithEmailAndPassword(
          email: userEntity.email!, password: userEntity.password!);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firestore.collection('users');
    final uid = await getCurrentUId();
    userCollectionRef.doc(uid).get().then((value) {
      final newUser = UserModel(
              name: user.name,
              email: user.email,
              uid: uid,
              status: user.status,
              password: user.password)
          .toDocument();
      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }
}
