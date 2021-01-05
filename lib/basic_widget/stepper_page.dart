import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Stepper(
      steps: <Step>[
        Step(
          title: Text('2021-1-5'),
          subtitle: Text('Harry0'),
          content: Text('今天是2021-1-5'),
          state: StepState.complete,
        ),
        Step(
          title: Text('2021-1-4'),
          subtitle: Text('Harry1'),
          content: Text('今天是2021-1-4'),
          state: StepState.error,
        ),
        Step(
          title: Text('2021-1-3'),
          subtitle: Text('Harry2'),
          content: Text('今天是2021-1-3'),
          state: StepState.editing,
        ),
        Step(
          title: Text('2021-1-2'),
          subtitle: Text('Harry3'),
          content: Text('今天是2021-1-2'),
          state: StepState.indexed,
        ),
      ],
      onStepTapped: (value) {
        setState(() {
          _currentStep = value;
        });
      },
      currentStep: _currentStep,
      onStepContinue: () {
        print('onStepcontinue');
      },
      onStepCancel: () {
        print('onStepCancel');
      },
      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: onStepContinue,
              child: Text('确定'),
            ),
            RaisedButton(
              onPressed: onStepCancel,
              child: Text('取消'),
            ),
          ],
        );
      },
    );
  }
}
