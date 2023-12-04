import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/presentation/auth/login_screen/login_screen.dart';
import 'package:marco_david_s_application3/presentation/inicio_screen_container_screen/inicio_screen_container_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_item_screen/contenido_item_screen.dart';
import 'package:marco_david_s_application3/presentation/perfil_screen/perfil_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_fisica_screen/contenido_list_fisica_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_historia_screen/contenido_list_historia_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_literatura_screen/contenido_list_literatura_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_quimica_screen/contenido_list_quimica_screen.dart';
import 'package:marco_david_s_application3/presentation/splash_screen/splash_screen.dart';
import 'package:marco_david_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String inicioScreenPage = '/inicio_screen_page';

  static const String inicioScreenContainerScreen =
      '/inicio_screen_container_screen';

  static const String seccionesScreenPage = '/secciones_screen_page';

  static const String contenidoCrearScreenPage = '/contenido_crear_screen_page';

  static const String contenidoItemScreen = '/contenido_item_screen';

  static const String perfilScreen = '/perfil_screen';

  static const String contenidoListFisicaScreen =
      '/contenido_list_fisica_screen';

  static const String contenidoListHistoriaScreen =
      '/contenido_list_historia_screen';

  static const String contenidoListLiteraturaScreen =
      '/contenido_list_literatura_screen';

  static const String contenidoListQuimicaScreen =
      '/contenido_list_quimica_screen';

  static const String recursosScreenPage = '/recursos_screen_page';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String loginScreenPage = '/login_screen_page';

  static Map<String, WidgetBuilder> routes = {
    inicioScreenContainerScreen: (context) => InicioScreenContainerScreen(),
    contenidoItemScreen: (context) => ContenidoItemScreen(),
    perfilScreen: (context) => PerfilScreen(),
    contenidoListFisicaScreen: (context) => ContenidoListFisicaScreen(),
    contenidoListHistoriaScreen: (context) => ContenidoListHistoriaScreen(),
    contenidoListLiteraturaScreen: (context) => ContenidoListLiteraturaScreen(),
    contenidoListQuimicaScreen: (context) => ContenidoListQuimicaScreen(),
    splashScreen: (context) => SplashScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    loginScreenPage: (context) => LoginScreen(),
  };
}
