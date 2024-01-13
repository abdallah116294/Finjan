import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class SignUPUsecase {
  final FirebaseRepository repository;
  SignUPUsecase({required this.repository});
  Future<void> call(UserEntity userEntity) async {
    return repository.signUp(userEntity);
  }
}
