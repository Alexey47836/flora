import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora/components/choice/bloc/choice_bloc.dart';
import 'package:flora/components/chunks/custom_button.dart';

class ChoiceComponent extends StatefulWidget {
  const ChoiceComponent({Key? key}) : super(key: key);

  @override
  State<ChoiceComponent> createState() => _ChoiceComponentState();
}

class _ChoiceComponentState extends State<ChoiceComponent> {
  late FixedExtentScrollController _scrollController;
  int _selectedYear = 0;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scrollController =
        FixedExtentScrollController(initialItem: _selectedYear - 1900);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceBloc, ChoiceState>(
      builder: (context, state) {
        if (state is ChoiceLoadedState) {
          return choiceWidgets(context);
        } else if (state is ChoiceSelectedChoiceSuccessfullyState) {
          return dateOfBirthWidgets(context);
        } else if (state is ChoiceSelectedDateSuccessfullyState) {
          return resultWidgets(context, state);
        }
        return const LinearProgressIndicator();
      },
    );
  }

  Widget resultWidgets(context, state) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFEFEF),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 300,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.valueFromChoice,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(
              state.valueFromDateOfBirth,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateOfBirthWidgets(context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Log in your date of birth',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          SizedBox(
            height: 500.0,
            width: MediaQuery.sizeOf(context).width - 70.0,
            child: CupertinoPicker(
              scrollController: _scrollController,
              itemExtent: 62,
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedYear = index + 1900;
                });
              },
              children: List<Widget>.generate(
                123,
                (int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          (1900 + index).toString(),
                          style: const TextStyle(
                              fontSize: 34.0, fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
            width: MediaQuery.sizeOf(context).width / 2,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<ChoiceBloc>(context).add(
                    ChoiceDateSelectionEvent(value: _selectedYear.toString()));
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shadowColor: Colors.transparent,
                backgroundColor: const Color(0xFF454581),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'images/Vector.png',
                    fit: BoxFit.contain,
                    width: 30.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget choiceWidgets(context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(() {
            BlocProvider.of<ChoiceBloc>(context)
                .add(const ChoicePressedButtonEvent(value: 'Track my period'));
          }, title: 'Track my period', desc: 'contraception and wellbeing'),
          const SizedBox(height: 73.0),
          customButton(() {
            BlocProvider.of<ChoiceBloc>(context)
                .add(const ChoicePressedButtonEvent(value: 'Get pregnant'));
          }, title: 'Get pregnant', desc: 'learn about reproductive health'),
        ],
      ),
    );
  }
}
