import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/home/domain/entity/coffe_entity.dart';
import 'package:finjan/features/home/domain/usecase/get_coffe_usecase.dart';
import 'package:finjan/features/test_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_coffe_state.dart';

class GetCoffeCubit extends Cubit<GetCoffeState> {
  GetCoffeCubit({required this.usecase}) : super(GetCoffeInitial());
  GetCoffeUsecase usecase;
  Future<void> getHotCoffe() async {
    emit(GetHotCoffeIsloading());
    try {
      Either<Failure, List<CoffeeTestModel>> response =
          await usecase.call(NoParmas());
      emit(response.fold(
          (l) => GetHotCoffeError(error: _mapFailureToMsg(l)), (r) => GetHotCoffeLoaded(hotCoffe: r)));
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
