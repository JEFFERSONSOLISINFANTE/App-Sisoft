import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  ///Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convertir el modelo a Json para guardarlo en Firebase

  Map<String, dynamic> toJson() {
    return {
      'Nombre': name,
      'Imagen': image,
      'ParentId': parentId,
      'Disponibilidad': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
// Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['Nombre'] ?? '',
        image: data['Imagen'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['Disponibilidad'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
