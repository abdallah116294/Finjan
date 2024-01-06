import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/auth/data/model/UserRegister_model.dart';
import 'package:finjan/features/auth/domain/entities/success_register_entity.dart';

abstract class RegisterRepository{
  Future<Either<Failure,SuccessRegisterEntity>>register(UserRegisterModel userRegisterModel);
}