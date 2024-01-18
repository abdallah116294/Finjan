import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';

class SignOutUseCase {
  FirebaseRepository repository;
  SignOutUseCase({required this.repository});
  Future<void> call() async => repository.signOut();
}
