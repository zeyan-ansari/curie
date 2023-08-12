import 'package:flutter_bloc/flutter_bloc.dart';
import 'second_screen_event.dart';
import 'second_screen_state.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  final int pinLength;

  SecondScreenBloc(this.pinLength) : super(SecondScreenInitialState(''));

  @override
  Stream<SecondScreenState> mapEventToState(SecondScreenEvent event) async* {
    if (event is DigitEnteredEvent) {
      if (state is SecondScreenInitialState) {
        final newPin = (state as SecondScreenInitialState).pin + event.digit;
        yield SecondScreenInitialState(newPin);
      }
    } else if (event is DeleteDigitEvent) {
      if (state is SecondScreenInitialState) {
        final currentPin = (state as SecondScreenInitialState).pin;
        if (currentPin.isNotEmpty) {
          final newPin = currentPin.substring(0, currentPin.length - 1);
          yield SecondScreenInitialState(newPin);
        }
      }
    } else if (event is ProceedToThirdScreenEvent) {
      if (state is SecondScreenInitialState) {
        yield SecondScreenInitialState(''); // Reset pin
      }
    }
  }
}
