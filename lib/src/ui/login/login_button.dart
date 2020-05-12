import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final _onPressed;

  LoginButton({Key key, onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: _onPressed,
      child: Text('Login'),
    );
  }
}
