import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/resources/dialog/loading_dialog.dart';
import 'package:taxi_app/src/resources/dialog/msg_dialog.dart';
import 'package:taxi_app/src/resources/home_page.dart';
import 'package:taxi_app/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  AuthBloc _authBloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Image.asset('ic_car_green.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              Text(
                "Login to continue using iCar",
                style: TextStyle(color: Color(0xff606470), fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
                child: StreamBuilder(
                  stream: _authBloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: "Email",
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset("ic_mail.png"),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffCED0D2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                  stream: _authBloc.passStream,
                  builder: (context, snapshot) => TextField(
                        controller: _passController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelText: "Password",
                          prefixIcon: Container(
                            width: 50,
                            child: Image.asset("ic_lock.png"),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffCED0D2),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),
                        ),
                      )),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 40)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _onClickLogin,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                    text: "New user? ",
                    style: TextStyle(
                      color: Color(0xff606470),
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        text: "Sign up for a new account",
                        style: TextStyle(
                          color: Color(0xff3277D8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickLogin() {
    String email = _emailController.text;
    String pass = _passController.text;

    LoadingDialog.showLoadingDialog(context, "Loading...");
    _authBloc.signIn(email, pass, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Login Failed", msg);
    });
  }
}
