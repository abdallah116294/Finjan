import 'package:finjan/features/auth/domain/repository/firebase_repository.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

class GetCardsUsecase {
  FirebaseRepository repository;
  GetCardsUsecase({required this.repository});
  Stream<List<CardEntity>> call(String uid) {
    return repository.getCards(uid);
  }
}
