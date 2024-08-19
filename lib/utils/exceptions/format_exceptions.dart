/// Custom exception class to handle various format-related errors.
class TFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException(
            'El formato de la dirección de correo electrónico es inválido. Por favor, ingresa un correo electrónico válido.');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'El formato del número de teléfono proporcionado es inválido. Por favor, ingresa un número válido.');
      case 'invalid-date-format':
        return const TFormatException(
            'El formato de la fecha es inválido. Por favor, ingresa una fecha válida.');
      case 'invalid-url-format':
        return const TFormatException(
            'El formato de la URL es inválido. Por favor, ingresa una URL válida.');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'El formato de la tarjeta de crédito es inválido. Por favor, ingresa un número de tarjeta de crédito válido.');
      case 'invalid-numeric-format':
        return const TFormatException(
            'La entrada debe ser un formato numérico válido.');

      // Add more cases as needed...
      default:
        return const TFormatException();
    }
  }
}
