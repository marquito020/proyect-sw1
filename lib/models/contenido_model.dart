import 'dart:convert';

class Contenido {
  /* id? titulo, contenido?, fecha_creacion, p_descripcion, p_sub_secciones, id_seccion? */
  int? id;
  String titulo;
  String? contenido;
  String p_descripcion;
  String p_sub_secciones;
  String fecha_creacion;
  int? id_seccion;

  Contenido({
    this.id,
    required this.titulo,
    this.contenido,
    required this.fecha_creacion,
    required this.p_descripcion,
    required this.p_sub_secciones,
    this.id_seccion,
  });

  factory Contenido.fromJson(String str) => Contenido.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contenido.fromMap(Map<String, dynamic> json) => Contenido(
        id: json["id"],
        titulo: json["titulo"],
        contenido: json["contenido"],
        p_descripcion: json["p_descripcion"],
        p_sub_secciones: json["p_sub_secciones"],
        fecha_creacion: json["fecha_creacion"],
        id_seccion: json["id_seccion"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "contenido": contenido,
        "fecha_creacion": fecha_creacion,
        "p_descripcion": p_descripcion,
        "p_sub_secciones": p_sub_secciones,
        "id_seccion": id_seccion,
      };

  @override
  String toString() {
    return 'Contenido(id: $id, titulo: $titulo, contenido: $contenido, fecha_creacion: $fecha_creacion, p_descripcion: $p_descripcion, p_sub_secciones: $p_sub_secciones, id_seccion: $id_seccion)';
  }
}
