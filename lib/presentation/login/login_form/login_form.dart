import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoAlarm/application/login/login_bloc.dart';
import 'package:geoAlarm/domain/models/login_model/login_model.dart';
import 'package:geoAlarm/domain/core/validator/validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, this.signChange}) : super(key: key);
  final Function signChange;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey = GlobalKey<FormState>();
  LoginModel loginFormValues = LoginModel();

  _LoginFormState();

  signInGoogleAccHandler() {
    var loginBloc = context.bloc<LoginBloc>();
    loginBloc.add(SignInGooglePressEvent());
  }

  signInEmailPasswordHandler() {
    var loginBloc = context.bloc<LoginBloc>();
    loginBloc.add(SignInEmailPasswordPressEvent(
        userEmail: loginFormValues.email,
        userPassword: loginFormValues.password));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 4),
                right: 20,
                left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: Validator.emailValidator,
                      onSaved: (String value) {
                        loginFormValues.email = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: Validator.passwordValidator,
                      obscureText: true,
                      onSaved: (String value) {
                        loginFormValues.password = value;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();
                            signInEmailPasswordHandler();
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonMinWidth: 120,
                  buttonHeight: 50,
                  children: [
                    RaisedButton(
                        onPressed: this.signInGoogleAccHandler,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FaIcon(FontAwesomeIcons.google),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Google"),
                            )
                          ],
                        )),
                    RaisedButton(
                        onPressed: widget.signChange,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FaIcon(FontAwesomeIcons.pen),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Sign Up"),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
