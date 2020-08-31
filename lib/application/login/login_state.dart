part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SignUpLoginState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginSuccessfulState extends LoginState {
  final UserCredential currentUser;

  LoginSuccessfulState({@required this.currentUser});

  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
