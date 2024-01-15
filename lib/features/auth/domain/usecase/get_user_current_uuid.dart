import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class GetUserCurrentUidUsecase {
  FirebaseRepository repository;
  GetUserCurrentUidUsecase({required this.repository});
  Future<String> call()async  {
    return repository.getCurrentUId();
  }
}
