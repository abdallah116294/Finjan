part of 'add_card_cubit.dart';

sealed class AddCardState extends Equatable {
  const AddCardState();

  @override
  List<Object> get props => [];
}

final class AddCardInitial extends AddCardState {}

final class AddCardLoading extends AddCardState {
  String uuid;
  AddCardLoading({required this.uuid});
}

final class AddCardSuccess extends AddCardState {}

final class AddCardError extends AddCardState {
  String error;
  AddCardError({required this.error});
}
