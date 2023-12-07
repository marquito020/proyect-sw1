import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:marco_david_s_application3/theme/theme_helper.dart';
import 'package:marco_david_s_application3/routes/app_routes.dart';
import 'package:provider/provider.dart';

/* var globalMessengerKey = GlobalKey<ScaffoldMessengerState>(); */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  /* ThemeHelper().changeTheme('primary'); */
  ThemeHelper().themeColor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContenidoService()),
        ChangeNotifierProvider(create: (context) => PertenenciaService()),
        ChangeNotifierProvider<ContenidoFormController>(
          create: (_) => ContenidoFormController(
            Contenido(
              titulo: "",
              p_descripcion: "",
              p_sub_secciones: "",
              fecha_creacion: "",
            ),
          ),
        ),
      ],
      child: MaterialApp(
        theme: theme,
        title: 'marco_david_s_application3',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginScreenPage,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
