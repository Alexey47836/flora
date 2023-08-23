import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choice_event.dart';
part 'choice_state.dart';

class ChoiceBloc extends Bloc<ChoiceEvent, ChoiceState> {
  String valueFromChoice = '';
  String valueFromDateOfBirth = '';

  ChoiceBloc() : super(ChoiceInitialState()) {
    on<ChoiceEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(ChoiceEvent event, Emitter<ChoiceState> emit) async {
    if (event is ChoiceInitialEvent) {
      emit(ChoiceLoadedState());
    } else if (event is ChoicePressedButtonEvent) {
      valueFromChoice = event.value;
      emit(ChoiceSelectedChoiceSuccessfullyState());
    } else if (event is ChoiceDateSelectionEvent) {
      valueFromDateOfBirth = event.value;
      emit(ChoiceSelectedDateSuccessfullyState(
          valueFromChoice: valueFromChoice,
          valueFromDateOfBirth: valueFromDateOfBirth));
    }
  }
}
