part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class ReisterIsLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  SuccessRegisterEntity successRegisterEntity;
  RegisterLoaded({required this.successRegisterEntity});
}

final class RegisterError extends RegisterState {
  final String error;
const  RegisterError({required this.error});
}
