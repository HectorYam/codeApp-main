// To parse this JSON data, do
//
//     final lugaresModel = lugaresModelFromJson(jsonString);

// ignore_for_file: avoid_dynamic_calls

class LugaresModel {
  LugaresModel({
    required this.id,
    required this.nombre,
    required this.nombreMaya,
    required this.nombreIngles,
    required this.nombreCientifico,
    required this.recorrdio,
    required this.descripcion,
    required this.idCategoria,
  });

  factory LugaresModel.fromJson(dynamic json) => LugaresModel(
        id: json['id'] as String,
        nombre: json['Nombre'] as String,
        nombreMaya: json['Nombre_Maya'] as String,
        nombreIngles: json['Nombre_Ingles'] as String,
        nombreCientifico: json['Nombre_Cientifico'] as String,
        recorrdio: json['Recorrdio'] as String,
        descripcion: json['Descripcion'] as String,
        idCategoria: json['id_categoria'] as String,
      );
  final String id;
  final String nombre;
  final String nombreMaya;
  final String nombreIngles;
  final String nombreCientifico;
  final String recorrdio;
  final String descripcion;
  final String idCategoria;

  LugaresModel copyWith({
    String? id,
    String? nombre,
    String? nombreMaya,
    String? nombreIngles,
    String? nombreCientifico,
    String? recorrdio,
    String? descripcion,
    String? idCategoria,
  }) =>
      LugaresModel(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        nombreMaya: nombreMaya ?? this.nombreMaya,
        nombreIngles: nombreIngles ?? this.nombreIngles,
        nombreCientifico: nombreCientifico ?? this.nombreCientifico,
        recorrdio: recorrdio ?? this.recorrdio,
        descripcion: descripcion ?? this.descripcion,
        idCategoria: idCategoria ?? this.idCategoria,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'Nombre': nombre,
        'Nombre_Maya': nombreMaya,
        'Nombre_Ingles': nombreIngles,
        'Nombre_Cientifico': nombreCientifico,
        'Recorrdio': recorrdio,
        'Descripcion': descripcion,
        'id_categoria': idCategoria,
      };
}
