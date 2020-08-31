import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoAlarm/application/login/login_bloc.dart';
import 'package:geoAlarm/domain/models/login_model/Signup_model.dart';
import 'package:geoAlarm/domain/core/validator/validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key, this.signChange}) : super(key: key);
  final signChange;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formkey = GlobalKey<FormState>();
  SignupModel signupFormValues = SignupModel();
  _SignUpFormState();

  signInGoogleAccHandler() {
    var loginBloc = context.bloc<LoginBloc>();
    loginBloc.add(SignInGooglePressEvent());
  }

  signUpEmailPasswordHandler(SignupModel formValues) {
    var loginBloc = context.bloc<LoginBloc>();
    loginBloc.add(
      SignUpEmailPasswordPressEvent(
          userEmail: formValues.email,
          userPassword: formValues.password,
          userFullName: formValues.username),
    );
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
                        labelText: 'Full Name',
                      ),
                      validator: Validator.nameValidator,
                      onSaved: (String value) {
                        signupFormValues.username = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: Validator.emailValidator,
                      onSaved: (String value) {
                        signupFormValues.email = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: Validator.passwordValidator,
                      obscureText: true,
                      onSaved: (String value) {
                        signupFormValues.password = value;
                      },
                    ),
                    Column(children: [
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();
                            signUpEmailPasswordHandler(this.signupFormValues);
                          }
                        },
                        child: Text("Login"),
                      ),
                      OutlineButton(
                        onPressed: widget.signChange,
                        child: Text(
                          "Already have an account",
                          style: TextStyle(
                              fontSize: 8, color: Colors.blueGrey[300]),
                        ),
                      )
                    ]),
                  ],
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: this.signInGoogleAccHandler,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
