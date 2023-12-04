import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:marco_david_s_application3/theme/theme_helper.dart';
import 'package:marco_david_s_application3/routes/app_routes.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      theme: theme,
      title: 'marco_david_s_application3',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.inicioScreenContainerScreen,
      routes: AppRoutes.routes,
    );
  }
}
