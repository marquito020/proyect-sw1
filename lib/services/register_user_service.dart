import 'package:dio/dio.dart';
import 'package:marco_david_s_application3/core/constants/http_config.dart';
import 'package:marco_david_s_application3/models/index.dart';

class RegisterUserService {
  Future<Map<String, dynamic>> registerUser(User user, Persona person) async {
    try {
      final data = {
        "correo": user.correo,
        "password": user.password,
        "nombre": person.nombre,
        "id_rol": person.id_rol,
        "img": person.img,
        "fecha_nac": person.fecha_nac,
      };
      print(data);
      final response = await DioConfig.dio.post('/api/usuario', data: data);
      return response.data;
    } on DioException catch (e) {
      print(e.response?.data);
      return e.response?.data;
    } catch (e) {
      print(e);
      return {'message': "Ocurrio un error en el server"};
    }
  }
}
