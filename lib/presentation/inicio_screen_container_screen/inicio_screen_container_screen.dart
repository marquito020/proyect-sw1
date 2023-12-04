import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/presentation/contenido_crear_screen_page/contenido_crear_screen_page.dart';
import 'package:marco_david_s_application3/presentation/inicio_screen_page/inicio_screen_page.dart';
import 'package:marco_david_s_application3/presentation/recursos_screen_page/recursos_screen_page.dart';
import 'package:marco_david_s_application3/presentation/secciones_screen_page/secciones_screen_page.dart';
import 'package:marco_david_s_application3/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class InicioScreenContainerScreen extends StatelessWidget {
  InicioScreenContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.inicioScreenPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.h),
                child: _buildBottomBar(context))));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Inicio:
        return AppRoutes.inicioScreenPage;
      case BottomBarEnum.Crear:
        return AppRoutes.contenidoCrearScreenPage;
      case BottomBarEnum.Secciones:
        return AppRoutes.seccionesScreenPage;
      case BottomBarEnum.Recursos:
        return AppRoutes.recursosScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.inicioScreenPage:
        return InicioScreenPage();
      case AppRoutes.contenidoCrearScreenPage:
        return ContenidoCrearScreenPage();
      case AppRoutes.seccionesScreenPage:
        return SeccionesScreenPage();
      case AppRoutes.recursosScreenPage:
        return RecursosScreenPage();
      default:
        return DefaultWidget();
    }
  }
}
