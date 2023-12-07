import 'package:marco_david_s_application3/core/constants/http_config.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class PertenenciaService extends ChangeNotifier {
  List<Pertenencia> pertenenciaList = [];

  bool isLoading = false;

  PertenenciaService() {
    getAllPertenencia();
  }

  Future<bool> getAllPertenencia() async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPreferences();
    pertenenciaList = [];
    try {
      final dio = DioConfig.dio;
      dio.options.headers['token'] = prefs.token;
      final response = await dio.get('/api/pertenencia');
      if (response.statusCode == 200) {
        final List<dynamic> allpertenencia = response.data["obj"];
        for (var elemt in allpertenencia) {
          final Pertenencia pertenencia = Pertenencia.fromMap(elemt);
          pertenenciaList.add(pertenencia);
        }
      }
      print(pertenenciaList);
      return false;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /* crear */
  Future<bool> createPertenencia(String id) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPreferences();
    try {
      final dio = DioConfig.dio;
      dio.options.headers['token'] = prefs.token;
      var data = {
        "fecha_pertenencia": DateTime.now().toString(),
        "id_contenido": id,
        "id_usuario": prefs.id,
      };
      final response =
          await dio.post('/api/pertenencia', data: data);
      if (response.statusCode == 200) {
        final Map<String, dynamic> allpertenencia = response.data["obj"];
        final Pertenencia pertenencia = Pertenencia.fromMap(allpertenencia);
        pertenenciaList.add(pertenencia);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
