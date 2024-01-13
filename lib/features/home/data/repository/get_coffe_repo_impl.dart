import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/home/data/remote_data/remote_data.dart';
import 'package:finjan/features/home/domain/entity/coffe_entity.dart';
import 'package:finjan/features/home/domain/repository/get_coffe_Repository.dart';
import 'package:finjan/features/test_model.dart';

class GetCoffeRepositoryImpl implements GetCoffeRepository {
  RemoteData remoteData;
  GetCoffeRepositoryImpl({required this.remoteData});
  @override
  Future<Either<Failure,List< CoffeeTestModel>>> getCoffe() async {
    try {
      var response = await remoteData.getCoffe();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
