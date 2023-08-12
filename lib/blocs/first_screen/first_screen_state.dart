import 'package:equatable/equatable.dart';

abstract class FirstScreenState extends Equatable {
  const FirstScreenState();

  @override
  List<Object> get props => [];
}

class FirstScreenInitialState extends FirstScreenState {
  // ... your existing state properties
}

class FirstScreenNavigateToSecondState extends FirstScreenState {}
