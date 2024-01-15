import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/usecase/get_cards.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  GetCardsCubit({required this.getCardsUsecase,required this.getUserCurrentUidUsecase}) : super(GetCardsInitial());
  GetCardsUsecase getCardsUsecase;
  GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  Future<void> getCards({required String uid}) async {
    emit(GetCardsLoading());
    final uid=await getUserCurrentUidUsecase.call();
    try {
      getCardsUsecase.call(uid).listen((event) {
        emit(GetCardsSucess(cards: event, uid:uid ));
      });
    } catch (eror) {
      emit(GetCardsError());
    }
  }
}
