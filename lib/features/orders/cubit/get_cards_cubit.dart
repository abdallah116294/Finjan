import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/usecase/delete_card_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_cards.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  GetCardsCubit(
      {required this.getCardsUsecase,
      required this.getUserCurrentUidUsecase,
      required this.deleteCardUsecase})
      : super(GetCardsInitial());
  GetCardsUsecase getCardsUsecase;
  GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  DeleteCardUsecase deleteCardUsecase;
  Future<void> getCards({required String uid}) async {
    emit(GetCardsLoading());
    final uid = await getUserCurrentUidUsecase.call();
    try {
      getCardsUsecase.call(uid).listen((event) {
        emit(GetCardsSucess(cards: event, uid: uid));
      });
    } catch (eror) {
      emit(GetCardsError());
    }
  }

  Future<void> deleteCard({required CardEntity cardEntity,required String uid}) async {
    try {
     // final uid = await getUserCurrentUidUsecase.call();
      await deleteCardUsecase.call(cardEntity,uid);
      // emit(GetCardsSucess(cards: []));
    } catch (e) {
      debugPrint("can't delete ");
    }
  }
}
