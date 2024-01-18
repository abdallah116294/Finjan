import 'package:finjan/features/auth/data/data/firebase_data_source/firebase_data_source.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

class FirebaseRepositoryImp implements FirebaseRepository {
  FirebaseRemoteDataSource remoteDataSource;
  FirebaseRepositoryImp({required this.remoteDataSource});
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> addNewCard(CardEntity cardEntity) async =>
      remoteDataSource.addCard(cardEntity);

  @override
  Future<String> getCurrentUId() async => remoteDataSource.getCurrentUId();

  @override
  Stream<List<CardEntity>> getCards(String uid) =>
      remoteDataSource.getCards(uid);

  @override
  Future<void> deleteCard(CardEntity cardEntity, String uid) async =>
      remoteDataSource.deleteCard(cardEntity, uid);

  @override
  Future<UserEntity?> getSpecificUserById(String uid) async =>
      remoteDataSource.getSpecificUserById(uid);
}
