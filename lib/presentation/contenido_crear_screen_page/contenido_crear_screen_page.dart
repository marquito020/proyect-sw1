import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/presentation/contenido_item_screen/contenido_item_screen.dart';
import 'package:marco_david_s_application3/presentation/perfil_screen/perfil_screen.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_drop_down.dart';
import 'package:marco_david_s_application3/widgets/custom_elevated_button.dart';
import 'package:marco_david_s_application3/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

// ignore_for_file: must_be_immutable
class ContenidoCrearScreenPage extends StatefulWidget {
  ContenidoCrearScreenPage({Key? key}) : super(key: key);

  @override
  State<ContenidoCrearScreenPage> createState() =>
      _ContenidoCrearScreenPageState();
}

class _ContenidoCrearScreenPageState extends State<ContenidoCrearScreenPage> {
  TextEditingController tituloController = TextEditingController();

  TextEditingController descripcionController = TextEditingController();

  TextEditingController subseccionesController = TextEditingController();

  List<String> dropdownItemList = [
    "Fisica",
    "Historia",
    "Literatura",
    "Quimica"
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 3.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Crear contenido",
                          style: theme.textTheme.headlineMedium)),
                  SizedBox(height: 28.v),
                  ChangeNotifierProvider(
                    create: (BuildContext context) =>
                        ContenidoFormController(Contenido(
                      titulo: "",
                      p_descripcion: "",
                      p_sub_secciones: "",
                      fecha_creacion: "",
                    )),
                    child: _crearContenidoForm(context),
                  ),
                  /* _buildTitulo(context),
                  SizedBox(height: 28.v),
                  _buildDescripcion(context),
                  SizedBox(height: 28.v),
                  _buildSubsecciones(context),
                  SizedBox(height: 28.v),
                  CustomDropDown(
                      icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 11.v, 18.h, 12.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdown,
                              height: 20.adaptSize,
                              width: 20.adaptSize)),
                      hintText: "Sección",
                      items: dropdownItemList,
                      onChanged: (value) {}),
                  SizedBox(height: 28.v),
                  _buildCrear(context),
                  SizedBox(height: 5.v) */
                ]))));
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

  Widget _crearContenidoForm(BuildContext context) {
    final controller = Provider.of<ContenidoFormController>(context);
    final contenidoService = Provider.of<ContenidoService>(context);
    final pertenenciaService = Provider.of<PertenenciaService>(context);
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: "Titulo",
                hintText: "Titulo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "El titulo no puede estar vacio";
                }
                return null;
              },
              onChanged: (value) {
                /* controller.onChanged(titulo: value); */
                controller.contenido.titulo = value;
              },
            ),
            SizedBox(height: 28.v),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: "Descripcion",
                hintText: "Descripcion",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "La descripcion no puede estar vacia";
                }
                return null;
              },
              onChanged: (value) {
                /* controller.onChanged(descripcion: value); */
                controller.contenido.p_descripcion = value;
              },
            ),
            SizedBox(height: 28.v),
            TextFormField(
              controller: subseccionesController,
              decoration: InputDecoration(
                labelText: "Subsecciones",
                hintText: "Subsecciones",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Las subsecciones no pueden estar vacias";
                }
                return null;
              },
              onChanged: (value) {
                /* controller.onChanged(subsecciones: value); */
                controller.contenido.p_sub_secciones = value;
              },
            ),
            SizedBox(height: 28.v),
            CustomDropDown(
                icon: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 11.v, 18.h, 12.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgArrowdown,
                        height: 20.adaptSize,
                        width: 20.adaptSize)),
                hintText: "Sección",
                items: dropdownItemList,
                onChanged: (value) {
                  if (value == null || value.isEmpty) {
                    return "La seccion no puede estar vacia";
                  }
                  if (value == "Fisica") {
                    controller.contenido.id_seccion = 2;
                  }
                  if (value == "Historia") {
                    controller.contenido.id_seccion = 3;
                  }
                  if (value == "Literatura") {
                    controller.contenido.id_seccion = 4;
                  }
                  if (value == "Quimica") {
                    controller.contenido.id_seccion = 5;
                  }
                }),
            SizedBox(height: 28.v),
            /* _buildCrear(context), */
            CustomElevatedButton(
                text: "Crear",
                buttonStyle: CustomButtonStyles.none,
                decoration:
                    CustomButtonStyles.gradientIndigoToPrimaryDecoration,
                onPressed: () async {
                  /* onTapCrear(context); */
                  if (!controller.isValidForm()) return;

                  if (controller.contenido.id_seccion == 0 ||
                      controller.contenido.id_seccion == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Seleccione una seccion"),
                    ));
                  } else {
                    print("Formulario valido");
                    var contenido = await contenidoService
                        .crearContenido(controller.contenido);
                    Contenido contenido2 = Contenido.fromMap(contenido);
                    if (contenido['id'] != null) {
                      await pertenenciaService
                          .createPertenencia(contenido['id']);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Contenido creado"),
                      ));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContenidoItemScreen(contenido: contenido2);
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error al crear contenido"),
                      ));
                    }
                  }
                }),
            SizedBox(height: 5.v)
          ],
        ));
  }

  /// Section Widget
  Widget _buildTitulo(BuildContext context) {
    return CustomTextFormField(
        controller: tituloController, hintText: "Titulo");
  }

  /// Section Widget
  Widget _buildDescripcion(BuildContext context) {
    return CustomTextFormField(
        controller: descripcionController, hintText: "Descripcion");
  }

  /// Section Widget
  Widget _buildSubsecciones(BuildContext context) {
    return CustomTextFormField(
        controller: subseccionesController,
        hintText: "Subsecciones",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildCrear(BuildContext context) {
    return CustomElevatedButton(
        text: "Crear",
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientIndigoToPrimaryDecoration,
        onPressed: () {
          onTapCrear(context);
        });
  }

  /// Navigates to the contenidoItemScreen when the action is triggered.
  onTapCrear(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contenidoItemScreen);
  }
}
