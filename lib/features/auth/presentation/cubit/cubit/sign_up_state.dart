part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class UserLoading extends SignUpState {}

final class UserSucess extends SignUpState {
  final String uid;
  final UserEntity userEntity;
  const UserSucess({required this.uid, required this.userEntity});
}

final class UserRegisterSucces extends SignUpState {
  final String uid;
  const UserRegisterSucces({required this.uid});
}

final class UserFailure extends SignUpState {
  final String error;
  const UserFailure({required this.error});
}
