import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/usecase/get_create_curren_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
      {required this.signUPUsecase, required this.getCreateCurrentUserUsecase})
      : super(SignUpInitial());
  final SignUPUsecase signUPUsecase;
  final GetCreateCurrentUserUsecase getCreateCurrentUserUsecase;
  Future<void> submitSignUp({required UserEntity userEntity}) async {
    emit(UserLoading());
    try {
      await signUPUsecase.call(userEntity);
      await getCreateCurrentUserUsecase.call(userEntity);
      emit(UserSucess());
    } on SocketException catch (error) {
      emit(UserFailure(error: error.toString()));
    } catch (error) {
      emit(UserFailure(error: error.toString()));
    }
  }
}
