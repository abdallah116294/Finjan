import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/auth/data/model/UserRegister_model.dart';
import 'package:finjan/features/auth/domain/entities/success_register_entity.dart';
import 'package:finjan/features/auth/domain/usecase/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());
  RegisterUseCase registerUseCase;
  Future<void> register(UserRegisterModel userRegisterModel) async {
    emit(ReisterIsLoading());
    try {
      Either<Failure, SuccessRegisterEntity> response =
          await registerUseCase.call(userRegisterModel);
      emit(response.fold((l) => RegisterError(error: _mapFailureToMsg(l)),
          (r) => RegisterLoaded(successRegisterEntity: r)));
    } catch (error) {
      emit(RegisterError(error: error.toString()));
    }
    
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";
      case CacheFailure:
        return "CacheFailure";

      default:
        return "unexpectedError";
    }
  }
}
