import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/auth/data/model/UserRegister_model.dart';
import 'package:finjan/features/auth/domain/entities/success_register_entity.dart';
import 'package:finjan/features/auth/domain/repository/register_repo.dart';

class RegisterUseCase
    implements UseCase<SuccessRegisterEntity,UserRegisterModel> {
  RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  @override
  Future<Either<Failure, SuccessRegisterEntity>> call(params) =>
      registerRepository.register(params);
}
