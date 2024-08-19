import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel {
  ///Variables
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  ///Separar nombres y apellidos
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///Generar nombre de usuario
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName $lastName";
    String usernameWithPrefix = "psx_$camelCaseUsername";
    return usernameWithPrefix;
  }

  ///Crear un usuario

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'Nombres': firstName,
      'Apellidos': lastName,
      'Usuario': username,
      "Correo Electronico": email,
      'Telefono': phoneNumber,
      'Foto_de_Perfil': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['Nombres'] ?? '',
          lastName: data['Apellidos'] ?? '',
          username: data['Usuario'] ?? '',
          email: data['Correo Electronico'] ?? '',
          phoneNumber: data['Telefono'] ?? '',
          profilePicture: data['Foto_de_Perfil'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
