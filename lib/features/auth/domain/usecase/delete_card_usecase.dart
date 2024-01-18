import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

class DeleteCardUsecase {
  FirebaseRepository firebaseRepository;
  DeleteCardUsecase({required this.firebaseRepository});
  Future<void> call(CardEntity cardEntity,String uid) async =>
      firebaseRepository.deleteCard(cardEntity,uid);
}
