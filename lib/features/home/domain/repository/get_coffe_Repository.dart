// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/features/test_model.dart';

abstract class GetCoffeRepository {
  Future<Either<Failure, List<CoffeeTestModel>>> getCoffe();
}
