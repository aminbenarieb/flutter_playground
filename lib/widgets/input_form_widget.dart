import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InputFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // theme: ThemeData(brightness: Brightness.dark),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Input Form'),
      ),
      child: SafeArea(child: InputForm()),
      //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  // Create a text controller and use it to retrieve the current value.
  // of the TextField!
  final myController = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    // Clean up the controller when disposing of the Widget.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoTextField(
                controller: myController,
                placeholder: "This is a hint",
                onSubmitted: (String text) {
                  setState(() {
                    if (!isEmail(text)) {
                      _errorText = 'Error: This is not an email';
                    } else {
                      _errorText = null;
                    }
                  });
                },
              )),
          CupertinoButton(
            child: Text("Show dialog"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    actions: [
                      CupertinoDialogAction(
                          child: Text("OK"),
                          isDefaultAction: true,
                          onPressed: () {})
                    ],
                    content: Text(myController.text),
                  );
                },
              );
            },
          ),
          _getErrorTextWidget()
        ])));
    ;
  }

  Text _getErrorTextWidget() {
    return Text(_errorText ?? "");
  }

  bool isEmail(String emailString) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailRegexp);

    return regExp.hasMatch(emailString);
  }
}
