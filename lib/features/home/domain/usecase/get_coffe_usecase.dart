import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/home/domain/entity/coffe_entity.dart';
import 'package:finjan/features/home/domain/repository/get_coffe_Repository.dart';
import 'package:finjan/features/test_model.dart';

class GetCoffeUsecase implements UseCase<List<CoffeeTestModel>, NoParmas> {
  GetCoffeRepository repository;
  GetCoffeUsecase({required this.repository});
  @override
  Future<Either<Failure,List< CoffeeTestModel>>> call(params) {
    return repository.getCoffe();
  }
}
