part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class SignUpEmailPasswordPressEvent extends LoginEvent {
  final String userEmail, userPassword, userFullName;
  SignUpEmailPasswordPressEvent(
      {@required this.userFullName,
      @required this.userEmail,
      @required this.userPassword});

  @override
  List<Object> get props => throw UnimplementedError();
}

class SignInEmailPasswordPressEvent extends LoginEvent {
  final String userEmail, userPassword;
  SignInEmailPasswordPressEvent(
      {@required this.userEmail, @required this.userPassword});

  @override
  List<Object> get props => throw UnimplementedError();
}

class SignInGooglePressEvent extends LoginEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ChangeScreenPressEvent extends LoginEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
