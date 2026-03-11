class Validators {
  static String ? validateText(String ? value,String message){
    if(value==null || value.isEmpty){
      return message;
    }
    return null;
  }
  static String? validateEmail(String? value, String message) {
    final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

    if (value == null || value.isEmpty) {
      return message;
    }

    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }
  static String ? validatePassword(String ? value){

    if(value==null || value.isEmpty ){
      return 'Password is required';
    }else if(value.length<6){
      return 'Password must be at least 6 charecters';
    }
    return null;
  }
}