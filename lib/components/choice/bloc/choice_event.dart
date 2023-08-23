part of 'choice_bloc.dart';

abstract class ChoiceEvent extends Equatable {
  const ChoiceEvent();

  @override
  List<Object?> get props => [];
}

class ChoiceInitialEvent extends ChoiceEvent {}

class ChoicePressedButtonEvent extends ChoiceEvent {
  final String value;

  const ChoicePressedButtonEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChoiceDateSelectionEvent extends ChoiceEvent {
  final String value;

  const ChoiceDateSelectionEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
