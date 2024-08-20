class TValidator {

  static String? validateEmptyText(String? fieldName, String? value){
    if (value == null || value.isEmpty){
      return 'se necesita $fieldName.';
    }
    return null;
  }


  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Se necesita un correo.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w− ]+.)+[\w− ]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Correo Electronico no valido.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Debe ingresar una contraseña.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 digitos.';
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe tener al menos una letra en mayuscula.';
    }

// Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe contener al menos un número.';
    }
// Check for special characters
    if (!value.contains(RegExp(r'[ !@#$%^&*(),.?":{}|<>]'))) {
      return 'La contraseña debe contener al menos un caracter especial.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Se necesita un número de teléfono';
    }
    final phoneRegExp = RegExp(r'^\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Número de teléfono invalido, tiene que tener 9 digitos.';
    }
    return null;
  }
}