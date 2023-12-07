import 'dart:convert';

class Pertenencia {
  int? id;
  String fecha_pertenencia;
  int? id_contenido;
  int? id_usuario;

  Pertenencia({
    this.id,
    required this.fecha_pertenencia,
    this.id_contenido,
    this.id_usuario,
  });

  factory Pertenencia.fromJson(String str) =>
      Pertenencia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pertenencia.fromMap(Map<String, dynamic> json) => Pertenencia(
        id: json["id"],
        fecha_pertenencia: json["fecha_pertenencia"],
        id_contenido: json["id_contenido"],
        id_usuario: json["id_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fecha_pertenencia": fecha_pertenencia,
        "id_contenido": id_contenido,
        "id_usuario": id_usuario,
      };

  @override
  String toString() {
    return 'Pertenencia(id: $id, fecha_pertenencia: $fecha_pertenencia, id_contenido: $id_contenido, id_usuario: $id_usuario)';
  }
}
