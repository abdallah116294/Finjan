part of 'get_coffe_cubit.dart';

sealed class GetCoffeState extends Equatable {
  const GetCoffeState();

  @override
  List<Object> get props => [];
}

final class GetCoffeInitial extends GetCoffeState {}

final class GetHotCoffeIsloading extends GetCoffeState {}

final class GetHotCoffeLoaded extends GetCoffeState {
  List<CoffeeTestModel>? hotCoffe;
  String uuid;
  GetHotCoffeLoaded({required this.hotCoffe,required this.uuid});
}

final class GetHotCoffeError extends GetCoffeState {
  String error;
  GetHotCoffeError({required this.error});
}
