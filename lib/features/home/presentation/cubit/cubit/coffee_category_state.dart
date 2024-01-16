part of 'coffee_category_cubit.dart';

sealed class CoffeeCategoryState extends Equatable {
  const CoffeeCategoryState();

  @override
  List<Object> get props => [];
}

final class CoffeeCategoryInitial extends CoffeeCategoryState {}

final class CoffeeCategoryLoading extends CoffeeCategoryState {}

final class CoffeeCategorySucces extends CoffeeCategoryState {
  List<CoffeCategory> coffeCategory;
  CoffeeCategorySucces({required this.coffeCategory});
}

final class CoffeeCategoryError extends CoffeeCategoryState {}
