import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finjan/features/auth/data/data/firebase_data_source/firebase_data_source.dart';
import 'package:finjan/features/auth/data/model/user_model.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/home/data/model/card_model.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
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
              password: user.password,
              phonenumber: user.phonenumber)
          .toDocument();
      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<void> addCard(CardEntity cardEntity) async {
    final cardCollectionRef =
        firestore.collection("users").doc(cardEntity.uid).collection('cards');
    final cardId = cardCollectionRef.doc().id;
    cardCollectionRef.doc(cardId).get().then((value) {
      final newCard = CardModel(
              cardId: cardId,
              uid: cardEntity.uid,
              cardImage: cardEntity.cardImage,
              cardName: cardEntity.cardName,
              cardPrice: cardEntity.cardPrice)
          .toDocumnet();
      if (!value.exists) {
        cardCollectionRef.doc(cardId).set(newCard);
      }
      return;
    });
  }

  @override
  Stream<List<CardEntity>> getCards(String uid) {
    final cardCollectionRef =
        firestore.collection('users').doc(uid).collection('cards');
    return cardCollectionRef.snapshots().map((event) {
      return event.docs.map((e) => CardModel.fromSnapShot(e)).toList();
    });
  }

  @override
  Future<void> deleteCard(CardEntity cardEntity, String uid) async {
    final carddCollectionRef =
        firestore.collection('users').doc(uid).collection("cards");
    carddCollectionRef.doc(cardEntity.cardId).get().then((value) {
      if (value.exists) {
        carddCollectionRef.doc(cardEntity.cardId).delete();
      }
      return;
    });
  }

  @override
  Future<UserEntity?> getSpecificUserById(String uid) async {
    try {
      final userCollectionRe = firestore.collection("users");
      DocumentSnapshot userDoc = await userCollectionRe.doc(uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        // return UserEntity
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
