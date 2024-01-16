import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/home/data/model/coffe_category.dart/cofffee_category_model.dart';
import 'package:finjan/features/test_model.dart';

abstract class GetCoffeRepository {
  Future<Either<Failure, List<CoffeeTestModel>>> getCoffe();
  Future<Either<Failure, List<CoffeCategory>>> getHotCoffe();
  Future<Either<Failure, List<CoffeCategory>>> getIcedCoffe();
}
