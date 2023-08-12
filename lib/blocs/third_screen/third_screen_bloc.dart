import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/blocs/third_screen/third_screen_event.dart';
import 'package:untitled2/blocs/third_screen/third_screen_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreenBloc extends Bloc<ThirdScreenEvent, ThirdScreenState> {
  ThirdScreenBloc() : super(LoadingState()) {
    // Register the event handler for StartLoadingEvent
    on<StartLoadingEvent>((event, emit) async {
      emit(LoadingState()); // Emit LoadingState to show loader
      await Future.delayed(const Duration(seconds: 3));
      emit(SuccessState()); // Emit SuccessState after delay
    });
  }

  @override
  Stream<ThirdScreenState> mapEventToState(ThirdScreenEvent event) async* {
    if (event is SuccessEvent) {
      yield SuccessState();
    }
  }
}

