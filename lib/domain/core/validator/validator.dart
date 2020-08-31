import 'package:flutter/foundation.dart';

class Validator {
  static String emailValidator(String input) {
    //TODO: MAKE A REGEX VALIDATOR for email and passwordR
    // const emailRegex =
    //     r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/+""";

    // if (RegExp(emailRegex).hasMatch(input)) {
    //   return input;
    // }
    if (input.length > 5 && input.contains('@')) {
      return null;
    } else
      return "Invalid email";
  }

  static String nameValidator(String input) {
    if (input.length > 4) {
      return null;
    } else
      return "Invalid Name";
  }

  static String passwordValidator(String input) {
    // const passwordRegex =
    //     r"""/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/""";

    // if (RegExp(passwordRegex).hasMatch(input)) {
    //   return null;
    if (input.length > 5 && input.contains('@')) {
      return null;
    } else
      return "Invalid Password";
  }
}

class InvalidException implements Exception {
  final String errorValue;

  InvalidException({@required this.errorValue});
}
