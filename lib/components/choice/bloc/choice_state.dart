part of 'choice_bloc.dart';

abstract class ChoiceState extends Equatable {
  const ChoiceState();
  @override
  List<Object> get props => [];
}

class ChoiceInitialState extends ChoiceState {}

class ChoiceLoadedState extends ChoiceState {}

class ChoiceSelectedChoiceSuccessfullyState extends ChoiceState {}

class ChoiceSelectedDateSuccessfullyState extends ChoiceState {
  final String valueFromChoice;
  final String valueFromDateOfBirth;

  const ChoiceSelectedDateSuccessfullyState({
    required this.valueFromChoice,
    required this.valueFromDateOfBirth,
  });
}
