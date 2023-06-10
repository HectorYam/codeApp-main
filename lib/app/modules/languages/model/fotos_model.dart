// To parse this JSON data, do
//
//     final fotosModel = fotosModelFromJson(jsonString);

// ignore_for_file: avoid_dynamic_calls

class FotosModel {
  final String id;
  final String idLugar;
  final String uriFoto;

  // ignore: sort_constructors_first
  FotosModel({
    required this.id,
    required this.idLugar,
    required this.uriFoto,
  });

  FotosModel copyWith({
    String? id,
    String? idLugar,
    String? uriFoto,
  }) =>
      FotosModel(
        id: id ?? this.id,
        idLugar: idLugar ?? this.idLugar,
        uriFoto: uriFoto ?? this.uriFoto,
      );

  // ignore: sort_constructors_first
  factory FotosModel.fromJson(dynamic json) => FotosModel(
        id: json['id'] as String,
        idLugar: json['idLugar'] as String,
        uriFoto: json['UriFoto'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'idLugar': idLugar,
        'UriFoto': uriFoto,
      };
}
