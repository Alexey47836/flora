import 'package:flora/components/choice/choice_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora/components/choice/bloc/choice_bloc.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) =>
            ChoiceBloc()..add(ChoiceInitialEvent()),
        child: const ChoiceComponent(),
      ),
    );
  }
}
