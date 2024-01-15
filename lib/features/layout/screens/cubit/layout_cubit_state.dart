part of 'layout_cubit_cubit.dart';

sealed class LayoutCubitState extends Equatable {
  const LayoutCubitState();

  @override
  List<Object> get props => [];
}

final class LayoutCubitInitial extends LayoutCubitState {}
final class ChangeScreen extends LayoutCubitState{}