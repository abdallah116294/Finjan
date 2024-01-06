import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/exception.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/auth/data/data/remote_data.dart';
import 'package:finjan/features/auth/data/model/UserRegister_model.dart';
import 'package:finjan/features/auth/domain/entities/success_register_entity.dart';
import 'package:finjan/features/auth/domain/repository/register_repo.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RemoteDataSource remoteDataSource;
  RegisterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, SuccessRegisterEntity>> register(
      UserRegisterModel userRegisterModel) async {
    try {
      final responseRegister =
          await remoteDataSource.register(userRegisterModel);
      return Right(responseRegister);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
