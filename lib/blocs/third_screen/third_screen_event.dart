import 'package:equatable/equatable.dart';

abstract class ThirdScreenEvent extends Equatable {
  const ThirdScreenEvent();

  @override
  List<Object> get props => [];
}

class StartLoadingEvent extends ThirdScreenEvent {}

class SuccessEvent extends ThirdScreenEvent {}
