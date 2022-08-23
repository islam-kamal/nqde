import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/pages/home_screen.dart';

class EmployeeNumberWidget extends StatefulWidget {
  @override
  _EmployeeNumberWidget createState() => new _EmployeeNumberWidget();
}

class _EmployeeNumberWidget extends State<EmployeeNumberWidget>
    with SingleTickerProviderStateMixin {
  // Constants
  var otp_code;
  // Variables
  int? _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;

  // Overridden methods
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
            child: new Container(
          width: MediaQuery.of(context).size.width,
          child: _getInputPart,
        )));
  }

  // Returns "Otp custom text field"
  Widget _otpTextField(var digit) {
    return new Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.width * 0.15,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
          color: digit != null ? Colors.blue.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: digit != null ? Colors.black : Colors.transparent,
            width: 2.0,
          )),
    );
  }

  // Returns "Otp keyboard input Button"
  Widget _otpKeyboardInputButton({String? label, VoidCallback? onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
          onTap: onPressed,
          borderRadius: new BorderRadius.circular(40.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: new Container(
              height: MediaQuery.of(context).size.width * 0.13,
              width: MediaQuery.of(context).size.width * 0.13,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.indigo.shade700,
                        width: 7.0,
                        style: BorderStyle.solid),
                  )),
              child: new Center(
                child: new Text(
                  label!,
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )),
    );
  }

  // Returns "Otp keyboard action Button"
  _otpKeyboardActionButton({Widget? label, VoidCallback? onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          // Your Image
          child: new Container(
            height: MediaQuery.of(context).size.width * 0.13,
            width: MediaQuery.of(context).size.width * 0.13,
            decoration: new BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                      color: Colors.indigo.shade700,
                      width: 7.0,
                      style: BorderStyle.solid),
                )),
            child: new Center(
              child: label,
            ),
          )),
    );
  }

  // Current digit
  void _setCurrentDigit(int i) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null) {
        _firstDigit = _currentDigit;
      } else if (_secondDigit == null) {
        _secondDigit = _currentDigit;
      } else if (_thirdDigit == null) {
        _thirdDigit = _currentDigit;
      } else if (_fourthDigit == null) {
        _fourthDigit = _currentDigit;

        otp_code = _firstDigit.toString() +
            _secondDigit.toString() +
            _thirdDigit.toString() +
            _fourthDigit.toString();
// Verify your otp by here. API call
      }
    });
  }

  void clearOtp() {
    _fourthDigit = null;
    _thirdDigit = null;
    _secondDigit = null;
    _firstDigit = null;
    setState(() {});
  }

  // Return "OTP" input field
  get _getInputField {
    return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _otpTextField(_firstDigit),
            _otpTextField(_secondDigit),
            _otpTextField(_thirdDigit),
            _otpTextField(_fourthDigit),
          ],
        ));
  }

  // Returns "OTP" input part
  get _getInputPart {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getInputField,
        _getOtpKeyboard,
      ],
    );
  }

  // Returns "Otp" keyboard
  get _getOtpKeyboard {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          child: Column(
            children: [
              new Container(
                  height: MediaQuery.of(context).size.width - 80,
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpKeyboardInputButton(
                                label: "1",
                                onPressed: () {
                                  _setCurrentDigit(1);
                                }),
                            _otpKeyboardInputButton(
                                label: "2",
                                onPressed: () {
                                  _setCurrentDigit(2);
                                }),
                            _otpKeyboardInputButton(
                                label: "3",
                                onPressed: () {
                                  _setCurrentDigit(3);
                                }),
                          ],
                        ),
                      ),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpKeyboardInputButton(
                                label: "4",
                                onPressed: () {
                                  _setCurrentDigit(4);
                                }),
                            _otpKeyboardInputButton(
                                label: "5",
                                onPressed: () {
                                  _setCurrentDigit(5);
                                }),
                            _otpKeyboardInputButton(
                                label: "6",
                                onPressed: () {
                                  _setCurrentDigit(6);
                                }),
                          ],
                        ),
                      ),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpKeyboardInputButton(
                                label: "7",
                                onPressed: () {
                                  _setCurrentDigit(7);
                                }),
                            _otpKeyboardInputButton(
                                label: "8",
                                onPressed: () {
                                  _setCurrentDigit(8);
                                }),
                            _otpKeyboardInputButton(
                                label: "9",
                                onPressed: () {
                                  _setCurrentDigit(9);
                                }),
                          ],
                        ),
                      ),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpKeyboardActionButton(
                                label: new Icon(
                                  Icons.outbound_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }),
                            _otpKeyboardInputButton(
                                label: "0",
                                onPressed: () {
                                  _setCurrentDigit(0);
                                }),
                            _otpKeyboardActionButton(
                                label: new Icon(
                                  Icons.cancel,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_fourthDigit != null) {
                                      _fourthDigit = null;
                                    } else if (_thirdDigit != null) {
                                      _thirdDigit = null;
                                    } else if (_secondDigit != null) {
                                      _secondDigit = null;
                                    } else if (_firstDigit != null) {
                                      _firstDigit = null;
                                    }
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          //      height: isLandscape(context) ? 2 * height(context) * .49 : height(context) * .49,
          width: MediaQuery.of(context).size.width,
        ));
  }
}
