
class AppValidatorFunctions {
  static String? emailValidator(String? text) {
    // if (text == null || text.isEmpty) {
    //   return appIntl!.pleaseEnterAValidEmail;
    // } else if (!text.isValidEmail) {
    //   return appIntl!.emailIsNotValid;
    // }
    return null;
  }

  static String? passwordValidator(String? text) {
    // if (text == null || text.isEmpty) {
    //   return appIntl!.please_enter_a_password;
    // } else if (text.length < 8) {
    //   return appIntl!.theMinimumPasswordLengthIs8;
    // } else if (!text.isValidPassword) {
    //   return "${appIntl!.passwordMustHaveAtLeastOneCapitalLetterAndAtLeastOneCharacterLike} \$,%,#.";
    // }
    return null;
  }

  static String? phoneValidator(String? text) {
    if(text!=null){
      bool isValidPhone = RegExp(r'^(\+[0-9]{2,4}|0[0-9]{2,4})?[0-9]{9,15}$').hasMatch(text);
      if(!isValidPhone){
        "Phone number is not valid";
      }
    }
    return null;
  }




}
