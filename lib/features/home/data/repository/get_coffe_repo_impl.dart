import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/home/data/model/coffe_category.dart/cofffee_category_model.dart';
import 'package:finjan/features/home/data/remote_data/remote_data.dart';
import 'package:finjan/features/home/domain/repository/get_coffe_Repository.dart';
import 'package:finjan/features/test_model.dart';

class GetCoffeRepositoryImpl implements GetCoffeRepository {
  RemoteData remoteData;
  GetCoffeRepositoryImpl({required this.remoteData});
  @override
  Future<Either<Failure, List<CoffeeTestModel>>> getCoffe() async {
    try {
      var response = await remoteData.getCoffe();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CoffeCategory>>> getHotCoffe() async {
    try {
      var response = await remoteData.getHotCoffee();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<CoffeCategory>>> getIcedCoffe() async{
       try {
      var response = await remoteData.getIcedCoffee();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
