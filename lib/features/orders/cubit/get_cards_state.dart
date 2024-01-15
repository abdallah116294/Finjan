part of 'get_cards_cubit.dart';

sealed class GetCardsState extends Equatable {
  const GetCardsState();

  @override
  List<Object> get props => [];
}

final class GetCardsInitial extends GetCardsState {}

final class GetCardsLoading extends GetCardsState {}

final class GetCardsSucess extends GetCardsState {
  List<CardEntity> cards;
  String uid;
  GetCardsSucess({required this.cards,required this.uid});
}

final class GetCardsError extends GetCardsState {}
