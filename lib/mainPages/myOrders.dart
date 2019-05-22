import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Hello, world!',
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 3,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
      body: Stepper(
        steps: _mySteps(),
        type: StepperType.horizontal,
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._mySteps().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //Logic to check if everything is completed
              print('Completed, check fields.');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text(''),
        content: Container(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text(''),
        content: Container(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text(''),
        content: Container(),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text(''),
        content: Container(),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: Text(''),
        content: Container(),
        isActive: _currentStep >= 4,
      )
    ];
    return _steps;
  }
}
