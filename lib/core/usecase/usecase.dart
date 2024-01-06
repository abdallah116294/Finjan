import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finjan/core/error/failure.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Failure,Type>>call(Params params);
}
class NoParmas extends Equatable{
  @override
  List<Object?> get props => [];

}