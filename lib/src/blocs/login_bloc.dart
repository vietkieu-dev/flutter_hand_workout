import 'dart:async';
import 'package:flutter7_form_login/src/validators/validations.dart';

class LoginBloc {
  StreamController _userControler = new StreamController();
  StreamController _passControler = new StreamController();

  Stream get userStream => _userControler.stream;
  Stream get passStream => _passControler.stream;

  bool isValidInfo(String username, String pass) {
    if (!Validation.isValidUer(username)) {
      _userControler.sink.addError("Invalid username!");
    }
    if (!Validation.isValidPass(pass)) {
      _passControler.sink.addError("Password getter 6 charater!");
    }

    _userControler.sink.add("Ok");
    _passControler.sink.add("Ok");

    return true;
  }

  void dispose() {
    _userControler.close();
    _passControler.close();
  }
}
