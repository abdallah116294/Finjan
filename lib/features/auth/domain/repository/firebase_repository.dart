import 'package:finjan/features/auth/domain/entities/user_entity.dart';

abstract class FirebaseRepository{
    Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
}