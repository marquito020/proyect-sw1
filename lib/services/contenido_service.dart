import 'package:marco_david_s_application3/core/constants/http_config.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class ContenidoService extends ChangeNotifier {
  List<Contenido> contenidoList = [];

  bool isLoading = false;

  ContenidoService() {
    getAllContenido();
  }

  Future<bool> getAllContenido() async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPreferences();
    contenidoList = [];
    try {
      final dio = DioConfig.dio;
      dio.options.headers['token'] = prefs.token;
      final response = await dio.get('/api/contenido');
      if (response.statusCode == 200) {
        /* contenidoList =
            (response.data["obj"] as List).map((e) => Contenido.fromJson(e)).toList(); */
        final List<dynamic> allcontenido = response.data["obj"];
        for (var elemt in allcontenido) {
          final Contenido contenido = Contenido.fromMap(elemt);
          contenidoList.add(contenido);
        }
        return true;
      }
      print(contenidoList);
      return false;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> crearContenido(Contenido contenido) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPreferences();
    try {
      var data = {
        "titulo": contenido.titulo,
        "p_descripcion": contenido.p_descripcion,
        "p_sub_secciones": contenido.p_sub_secciones,
        "fecha_creacion": DateTime.now().toString(),
        "id_seccion": contenido.id_seccion,
      };
      print(data);
      final dio = DioConfig.dio;
      dio.options.headers['token'] = prefs.token;
      final response = await dio.post('/api/contenido', data: data);
      if (response.statusCode == 200) {
        Contenido contenido = Contenido.fromMap(response.data["obj"]);
        contenidoList.add(contenido);
        isLoading = false;
        notifyListeners();
        return (response.data["obj"]);
      }
      return {'message': "Ocurrio un error en el server"};
    } catch (e) {
      print(e);
      return {'message': "Ocurrio un error en el server"};
    } finally {
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> getContenidoById(String id) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPreferences();
    try {
      final dio = DioConfig.dio;
      dio.options.headers['token'] = prefs.token;
      final response = await dio.get('/api/contenido/$id');
      if (response.statusCode == 200) {
        Contenido contenido = Contenido.fromMap(response.data["obj"]);
        contenidoList.add(contenido);
        isLoading = false;
        notifyListeners();
        return (response.data["obj"]);
      }
      return {'message': "Ocurrio un error en el server"};
    } catch (e) {
      print(e);
      return {'message': "Ocurrio un error en el server"};
    } finally {
      notifyListeners();
    }
  }
}
