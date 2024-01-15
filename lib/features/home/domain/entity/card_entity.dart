import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String? cardId;
  final String? cardName;
  final String? cardImage;
  final int? cardPrice;
  final String? uid;
  CardEntity({
    this.cardId,
    this.cardName,
    this.cardImage,
    this.cardPrice,
    this.uid,
  });
  @override
  List<Object?> get props => [
     cardId,
     cardName,
     cardImage,
     uid
  ];
}
