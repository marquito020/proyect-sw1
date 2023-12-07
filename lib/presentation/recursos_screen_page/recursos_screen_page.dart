import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/presentation/contenido_item_screen/contenido_item_screen.dart';
import 'package:marco_david_s_application3/presentation/perfil_screen/perfil_screen.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_elevated_button.dart';
import 'package:marco_david_s_application3/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

// ignore_for_file: must_be_immutable
class RecursosScreenPage extends StatefulWidget {
  RecursosScreenPage({Key? key}) : super(key: key);

  @override
  State<RecursosScreenPage> createState() => _RecursosScreenPageState();
}

class _RecursosScreenPageState extends State<RecursosScreenPage> {
  TextEditingController codigoController = TextEditingController();
  String titulo = "";
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final contenidoService = Provider.of<ContenidoService>(context);
    final pertenenciaService = Provider.of<PertenenciaService>(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 6.v),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text("Recursos Compartidos",
                                style: theme.textTheme.headlineMedium))),
                    SizedBox(height: 25.v),
                    Padding(
                        padding: EdgeInsets.only(left: 5.h, right: 6.h),
                        child: CustomTextFormField(
                            controller: codigoController,
                            hintText: "Codigo",
                            textInputAction: TextInputAction.done)),
                    SizedBox(height: 28.v),
                    CustomElevatedButton(
                        text: "Buscar",
                        margin: EdgeInsets.only(left: 5.h, right: 6.h),
                        buttonStyle: CustomButtonStyles.none,
                        decoration: CustomButtonStyles
                            .gradientIndigoToPrimaryDecoration,
                        onPressed: () async {
                          /* onTapAgregar(context); */
                          if (codigoController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Codigo vacio")));
                          } else {
                            var contenido = await contenidoService
                                .getContenidoById(codigoController.text);
                            print(contenido);
                            if (contenido['titulo'] == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Codigo invalido")));
                            } else {
                              setState(() {
                                titulo = contenido['titulo'];
                              });
                            }
                          }
                          print(codigoController.text);
                        }),
                    SizedBox(height: 28.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgImage,
                        height: 199.v,
                        width: 358.h,
                        radius: BorderRadius.circular(20.h)),
                    SizedBox(height: 17.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 21.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(titulo,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 6.v),
                                  Text("Descripcion",
                                      style: theme.textTheme.bodyMedium)
                                ]))),
                    SizedBox(height: 44.v),
                    isPressed
                        ? CustomElevatedButton(
                            text: "Agregar",
                            margin: EdgeInsets.only(left: 5.h, right: 6.h),
                            buttonStyle: CustomButtonStyles.none,
                            decoration: CustomButtonStyles
                                .gradientIndigoToPrimaryDecoration,
                            onPressed: () async {
                              /* onTapAgregar(context); */
                              if (codigoController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Codigo vacio")));
                              } else {
                                bool contenido = await pertenenciaService
                                    .createPertenencia(codigoController.text);
                                print(contenido);
                                if (contenido == false) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Codigo invalido o ya agregado")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Agregado exitosamente")));
                                }
                              }
                              print(codigoController.text);
                            })
                        : SizedBox(),
                    SizedBox(height: 29.v),
                    Divider(indent: 5.h, endIndent: 6.h),
                    SizedBox(height: 5.v)
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    /* Shared Preferences */
    final prefs = UserPreferences();
    @override
    void initState() {
      prefs.initPrefs();
      super.initState();
    }

    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgFrame,
            margin: EdgeInsets.only(left: 20.h, top: 16.v, bottom: 16.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFrameBlack900,
              margin: EdgeInsets.fromLTRB(19.h, 16.v, 8.h, 8.v)),
          Container(
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.only(left: 18.h, top: 8.v, right: 27.h),
              child: Stack(alignment: Alignment.bottomRight, children: [
                CustomImageView(
                    onTap: () {
                      print("Image tapped");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PerfilScreen();
                      }));
                    },
                    /* imagePath: ImageConstant.imgUserImage, */
                    imagePath: prefs.img,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(20.h),
                    alignment: Alignment.center),
                CustomImageView(
                    imagePath: ImageConstant.imgCirclewavycheck,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(left: 28.h, top: 28.v))
              ]))
        ]);
  }

  /// Navigates to the contenidoItemScreen when the action is triggered.
  onTapAgregar(BuildContext context) {
    /* Navigator.pushNamed(context, AppRoutes.contenidoItemScreen); */
    Navigator.pushReplacementNamed(context, AppRoutes.contenidoItemScreen);
  }
}
