import 'package:equatable/equatable.dart';

abstract class ThirdScreenState extends Equatable {
  const ThirdScreenState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ThirdScreenState {}

class SuccessState extends ThirdScreenState {}
