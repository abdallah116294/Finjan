import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

abstract class FirebaseRepository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> addNewCard(CardEntity cardEntity);
  Stream<List<CardEntity>> getCards(String uid);
  Future<void> deleteCard(CardEntity cardEntity, String uid);
  Future<UserEntity?> getSpecificUserById(String uid);
}
