import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

abstract class FirebaseRemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity userEntity);
  Future<void> signUp(UserEntity userEntity);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> addCard(CardEntity cardEntity);
  Stream<List<CardEntity>> getCards(String uid);
}
