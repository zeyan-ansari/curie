abstract class SecondScreenEvent {}

class DigitEnteredEvent extends SecondScreenEvent {
  final String digit;

  DigitEnteredEvent(this.digit);
}

class DeleteDigitEvent extends SecondScreenEvent {}

class ProceedToThirdScreenEvent extends SecondScreenEvent {}
