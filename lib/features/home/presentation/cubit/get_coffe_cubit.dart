import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/domain/usecase/get_coffe_usecase.dart';
import 'package:finjan/features/test_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'get_coffe_state.dart';

class GetCoffeCubit extends Cubit<GetCoffeState> {
  GetCoffeCubit({required this.usecase, required this.getUserCurrentUidUsecase})
      : super(GetCoffeInitial());
  GetCoffeUsecase usecase;
  GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  Future<void> getHotCoffe() async {
    emit(GetHotCoffeIsloading());
    try {
      Either<Failure, List<CoffeeTestModel>> response =
          await usecase.call(NoParmas());
      final uuid = await getUserCurrentUidUsecase.call();
      emit(response.fold(
          (l) => GetHotCoffeError(error: _mapFailureToMsg(l)),
          (r) => GetHotCoffeLoaded(
              hotCoffe: r, uuid: uuid)));
    } catch (error) {
      emit(GetHotCoffeError(error: ''));
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
