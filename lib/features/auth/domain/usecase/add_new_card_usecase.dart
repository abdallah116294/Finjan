import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

class AddNewCardUseCase {
  FirebaseRepository repository;
  AddNewCardUseCase({required this.repository});
  Future<void> call(CardEntity cardEntity) async =>
      repository.addNewCard(cardEntity);
}
