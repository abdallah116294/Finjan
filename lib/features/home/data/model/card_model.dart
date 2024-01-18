import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';

class CardModel extends CardEntity {
  CardModel({
    final String? cardId,
    final String? cardName,
    final String? cardImage,
    final int? cardPrice,
    final String? uid,
    final String? size,
  }) : super(
            cardId: cardId,
            cardName: cardName,
            cardImage: cardImage,
            cardPrice: cardPrice,
            uid: uid,
            size: size
            );
  factory CardModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return CardModel(
        cardId: documentSnapshot.get('cardId'),
        cardName: documentSnapshot.get('cardName'),
        cardImage: documentSnapshot.get('cardImage'),
        cardPrice: documentSnapshot.get('cardPrice'),
        uid: documentSnapshot.get('uid'),
        size: documentSnapshot.get("size")
        );
  }
  Map<String, dynamic> toDocumnet() {
    return {
      "uid": uid,
      "cardName":cardName,
      "cardId":cardId,
      "cardImage":cardImage,
      "cardPrice":cardPrice,
      'size':size
    };
  }
}
