import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/domain/usecase/get_Specific_UserById_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_create_curren_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:finjan/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.signUPUsecase,
    required this.getCreateCurrentUserUsecase,
    required this.signInUsecase,
    required this.getUserCurrentUidUsecase,
    required this.getSpecificUserByIdUsecase,
  }) : super(SignUpInitial());
  final SignUPUsecase signUPUsecase;
  final SignInUsecase signInUsecase;
  final GetCreateCurrentUserUsecase getCreateCurrentUserUsecase;
  final GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  final GetSpecificUserByIdUsecase getSpecificUserByIdUsecase;
  Future<void> submitSignIn({required UserEntity userEntity}) async {
    emit(UserLoading());
    try {
      await signInUsecase.call(userEntity);
      final uuid = await getUserCurrentUidUsecase.call();
      final user = await getSpecificUserByIdUsecase.call(uuid);
      emit(UserSucess(uid: uuid, userEntity: user!));
    } on SocketException catch (_) {
    } catch (error) {
      emit(UserFailure(error: error.toString()));
    }
  }

  Future<void> submitSignUp({required UserEntity userEntity}) async {
    emit(UserLoading());
    try {
      await signUPUsecase.call(userEntity);
      await getCreateCurrentUserUsecase.call(userEntity);
      // var user;
      final uuid = await getUserCurrentUidUsecase.call();
      // Future.delayed(const Duration(seconds: 5), () async {
      //    user = await getSpecificUserByIdUsecase.call(uuid);
      // });
      emit(UserRegisterSucces(uid: uuid));
      // emit(UserSucess(uid: uuid, userEntity: user!));
    } on SocketException catch (error) {
      emit(UserFailure(error: error.toString()));
    } catch (error) {
      emit(UserFailure(error: error.toString()));
    }
  }
}
