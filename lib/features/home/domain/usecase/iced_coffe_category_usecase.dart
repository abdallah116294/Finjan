import 'package:dartz/dartz.dart';
import 'package:finjan/core/error/failure.dart';
import 'package:finjan/core/usecase/usecase.dart';
import 'package:finjan/features/home/data/model/coffe_category.dart/cofffee_category_model.dart';
import 'package:finjan/features/home/domain/repository/get_coffe_Repository.dart';

class IcedCoffeCategoryUsecase
    implements UseCase<List<CoffeCategory>, NoParmas> {
  GetCoffeRepository getCoffeRepository;
  IcedCoffeCategoryUsecase({required this.getCoffeRepository});
  @override
  Future<Either<Failure, List<CoffeCategory>>> call(params) async =>
      getCoffeRepository.getIcedCoffe();
}
