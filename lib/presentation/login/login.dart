import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoAlarm/application/login/login_bloc.dart';
import 'package:geoAlarm/presentation/home/home.dart';
import 'package:geoAlarm/presentation/login/login_form/login_form.dart';
import 'package:geoAlarm/presentation/login/signup_form/signup_form.dart';
import '../splash/splash.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _LoginState() {}

  changeForm(BuildContext context) {
    print("rodou");
    var loginBloc = context.bloc<LoginBloc>();
    loginBloc.add(ChangeScreenPressEvent());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is InitialLoginState) {
          return LoginForm(signChange: () {
            changeForm(context);
          });
        }
        if (state is LoginLoadingState) {
          return Spinner();
        }
        if (state is SignUpLoginState) {
          return SignUpForm(signChange: () {
            changeForm(context);
          });
        }
        if (state is LoginSuccessfulState) {
          return Home();
        }
        return LoginForm(signChange: () {
          changeForm(context);
        });
      },
    );
  }
}
