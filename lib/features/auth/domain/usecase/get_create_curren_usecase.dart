import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class GetCreateCurrentUserUsecase {
  final FirebaseRepository repository;
  GetCreateCurrentUserUsecase({required this.repository});
  Future<void> call(UserEntity userEntity) async {
    return repository.getCreateCurrentUser(userEntity);
  }
}
