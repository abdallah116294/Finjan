import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String? cardId;
  final String? cardName;
  final String? cardImage;
  final int? cardPrice;
  final String? uid;
  final String? size;
  CardEntity({
    this.cardId,
    this.cardName,
    this.cardImage,
    this.cardPrice,
    this.uid,
    this.size,
  });
  @override
  List<Object?> get props => [cardId, cardName, cardImage, uid,size];
}
