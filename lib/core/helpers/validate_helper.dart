class ValidateHelper {
  static bool checkFormatDateOfBirth({required String value}) {
    final regexExpression =
        RegExp(r'^(3[01]|[12][0-9]|0[1-9])-(1[0-2]|0[1-9])-[0-9]{4}$');
    return regexExpression.hasMatch(value);
  }

  static bool checkFormatEmail({required String value}) {
    final regexExpression = RegExp(r'^[A-Za-z0-9+_.-]+@(.+)$');
    return regexExpression.hasMatch(value);
  }

  //   (?=.*[A-Z])       // should contain at least one upper case
  //   (?=.*[a-z])       // should contain at least one lower case
  //   (?=.*?[0-9])      // should contain at least one digit
  //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
  //   .{8,}             // Must be at least 8 characters in length
  static bool checkFormatPassword({required String value}) {
    final regexExpression =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return regexExpression.hasMatch(value);
  }
}
