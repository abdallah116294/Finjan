import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class SignInUsecase {
  final FirebaseRepository repository;
  SignInUsecase({required this.repository});
  Future<void> call(UserEntity userEntity) async{
    return repository.signIn(userEntity);
  }
}
