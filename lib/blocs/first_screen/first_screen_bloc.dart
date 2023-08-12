import 'package:flutter_bloc/flutter_bloc.dart';
import 'first_screen_event.dart';
import 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  FirstScreenBloc() : super(FirstScreenInitialState()) {
    on<ProceedToPayEvent>((event, emit) {
      emit(FirstScreenNavigateToSecondState());
    });
  }
}
