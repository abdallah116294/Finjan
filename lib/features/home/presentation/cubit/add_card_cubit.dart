import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/usecase/add_new_card_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/delete_card_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit(
      {required this.addNewCardUseCase,
      required this.getUserCurrentUidUsecase,
     })
      : super(AddCardInitial());
  AddNewCardUseCase addNewCardUseCase;
  GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  
  Future<void> addCard({required CardEntity cardEntity}) async {
    String uid = await getUserCurrentUidUsecase.call();
    emit(AddCardLoading(uuid: uid));
    try {
      await addNewCardUseCase.call(cardEntity);
      emit(AddCardSuccess());
    } on SocketException catch (e) {
      emit(AddCardError(error: e.toString()));
    } catch (e) {
      emit(AddCardError(error: e.toString()));
    }
  }
}
