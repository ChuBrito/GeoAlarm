import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:geoAlarm/domain/repositories/dataMocks/userRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({LoginState initialState}) : super(initialState) {
    initialState = InitialLoginState();
    userRepository = UserRepository();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInEmailPasswordPressEvent) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInEmailPassword(
            username: event.userEmail, userPassword: event.userPassword);
        yield LoginSuccessfulState(currentUser: user);
      } catch (error) {
        LoginFailureState(message: error.toString());
      }
    }
    if (event is SignInGooglePressEvent) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInGoogleAcc();
        yield LoginSuccessfulState(currentUser: user);
      } catch (error) {
        LoginFailureState(message: error.toString());
      }
    }
    if (event is SignUpEmailPasswordPressEvent) {
      yield LoginLoadingState();
      var user = await userRepository.createUserEmailPassword(
          username: event.userEmail,
          userPassword: event.userPassword,
          userFullName: event.userFullName);
      yield LoginSuccessfulState(currentUser: user);
    }
    if (event is ChangeScreenPressEvent) {
      print("chamou");
      if (state is SignUpLoginState)
        yield InitialLoginState();
      else
        yield SignUpLoginState();
    }
  }
}
