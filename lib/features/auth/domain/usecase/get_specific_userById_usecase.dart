import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class GetSpecificUserByIdUsecase {
  FirebaseRepository repository;
  GetSpecificUserByIdUsecase({required this.repository});
  Future<UserEntity?> call(String uid) async =>
    repository.getSpecificUserById(uid);
}
