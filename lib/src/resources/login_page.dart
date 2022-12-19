import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userError = "Username invald!";
  var _passError = "Password getter 6 charater!";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 100, 98, 98)),
                child: FlutterLogo(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text("Hello\nWelcome back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 16, color: Colors.black),
                controller: _userController,
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? _userError : null,
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 95, 94, 91), fontSize: 16)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    obscureText: !_showPass,
                    controller: _passController,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _passInvalid ? _passError : null,
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 95, 94, 91),
                            fontSize: 16)),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    onSignInClick();
                  },
                  child: Text("SIGN IN",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 248, 246, 246),
                      )),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 97, 138, 150)),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "NEW USER? ",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 36, 36, 37)),
                      ),
                      Expanded(
                        //flex
                        child: Text("SIGN UP",
                            style: TextStyle(fontSize: 12, color: Colors.blue)),
                      ),
                      Text("FORGOT PASSWORD?",
                          style: TextStyle(fontSize: 12, color: Colors.blue))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClick() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      }
    });
  }
}
