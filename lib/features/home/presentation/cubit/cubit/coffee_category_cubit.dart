import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/data/model/coffe_category.dart/cofffee_category_model.dart';
import 'package:finjan/features/home/domain/usecase/hot_coffe_category_usecase.dart';
import 'package:finjan/features/home/domain/usecase/iced_coffe_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'coffee_category_state.dart';

class CoffeeCategoryCubit extends Cubit<CoffeeCategoryState> {
  CoffeeCategoryCubit({required this.hotCoffeCategoryUsecase,required this.icedCoffeCategoryUsecase,required this.getuserUid })
      : super(CoffeeCategoryInitial());
  HotCoffeCategoryUsecase hotCoffeCategoryUsecase;
  IcedCoffeCategoryUsecase icedCoffeCategoryUsecase;
  GetUserCurrentUidUsecase getuserUid;
  Future<void> getHotCoffee() async {
    emit(CoffeeCategoryLoading());
    try {
      Either<Failure, List<CoffeCategory>> response =
          await hotCoffeCategoryUsecase.call(NoParmas());
      final uid =await getuserUid.call();    
      emit(response.fold((l) => CoffeeCategoryError(),
          (r) => CoffeeCategorySucces(coffeCategory: r, uid: uid,)));
    } catch (error) {
      emit(CoffeeCategoryError());
    }
  }
   Future<void> getIcdedCoffee() async {
    emit(CoffeeCategoryLoading());
    try {
      Either<Failure, List<CoffeCategory>> response =
          await icedCoffeCategoryUsecase.call(NoParmas());
          final uid =await getuserUid.call();
      emit(response.fold((l) => CoffeeCategoryError(),
          (r) => CoffeeCategorySucces(coffeCategory: r, uid: uid)));
    } catch (error) {
      emit(CoffeeCategoryError());
    }
  }
  
}
